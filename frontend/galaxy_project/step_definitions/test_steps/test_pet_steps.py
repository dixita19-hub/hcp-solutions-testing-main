import time
import requests
from pytest_bdd import scenarios, when, parsers, then
from assertpy import assert_that, soft_assertions
from urllib.parse import unquote
from bp_core.frontend.common.helpers.selenium_generics import SeleniumGenerics
from bp_core.frontend.common.utils.locator_parser import Locators
from bp_core.frontend.common.step_definitions.steps_common import logger
from bp_core.plugin import PROJECT_DIR
from collections import defaultdict
import pytest
import os
from pytest import FixtureRequest
import xml.etree.ElementTree as etree


pytest.scenarioDict = defaultdict()

scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/cfworkers"))


@when(parsers.re("I request to '(?P<route_type>.*)' URL '(?P<url>.*)' for caching"))
def get_external_url_for_caching(selenium_generics: SeleniumGenerics, base_url: str, route_type, url):
    cookies_json = selenium_generics.get_all_cookies()
    cookies_str = ''.join(map(lambda c: '%s=%s; ' % (c['name'], c['value']), cookies_json))
    response = requests.get(base_url + url, headers={'cookie': cookies_str})

    # caching a puclic route might take some time so we are just waiting
    counter = 0
    while route_type == "public" and '404' not in url and 'cf-cache-status' not in response.headers and counter != 5:
        logger.info("route is caching, retrying")
        time.sleep(0.3)
        response = requests.get(base_url + url, headers={'cookie': cookies_str})
        counter +=1


    if 'cf-cache-status' in response.headers and response.headers['cf-cache-status'] == 'HIT':
        pytest.scenarioDict['cf-cache-status'] = True
    else:
        pytest.scenarioDict['cf-cache-status'] = False


@then(parsers.re("The page should(?P<match> not)* be loaded from the cache"))
def check_page_caching(match):
    if match:
        assert pytest.scenarioDict['cf-cache-status'] == False
    else:
        assert pytest.scenarioDict['cf-cache-status'] == True


@when(parsers.re("I wait until element '(?P<locator_path>.*)' becomes(?P<match> not)* visible"))
def wait_for_element(selenium_generics: SeleniumGenerics, locators: Locators, locator_path, match):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    if match:
        print(f"Waiting element not to be visible: {locator_path}")
        selenium_generics.is_element_invisible(locator=locator, wait_for=15)
    else:
        print(f"Waiting element to be visible: {locator_path}")
        selenium_generics.is_element_visible(locator=locator, wait_for=15)


@when(parsers.re("I fetch all urls from external site '(?P<site_url>.*)' sitemap"))
def urls_from_sitemap(selenium_generics: SeleniumGenerics, request: FixtureRequest, site_url, base_url: str):
    if not 'http' in site_url:
        site_url = base_url

    logger.info("Collecting sitemap URLs.", site_url=site_url)
    cookies_json = selenium_generics.get_all_cookies()
    cookies_str = ''.join(map(lambda c: '%s=%s; ' % (c['name'], c['value']), cookies_json))
    response = requests.get(f"{site_url}/sitemap.xml", allow_redirects=False, headers={'cookie': cookies_str})
    if response.status_code != 200:
        raise requests.HTTPError("Status Code was not 200. Exiting!!")

    root = etree.fromstring(response.content)

    urls = []
    for child in root:
        urls.append(child[0].text)

    request.node.scenarioDict["urls"] = urls


@then(parsers.re("Sitemap urls are fetching"))
def sitemap_urls_loading(request: FixtureRequest, selenium_generics: SeleniumGenerics):
    urls = request.node.scenarioDict["urls"]
    with soft_assertions():
        for url in urls:
            logger.info("Loading URL", url=url)
            cookies_json = selenium_generics.get_all_cookies()
            cookies_str = ''.join(map(lambda c: '%s=%s; ' % (c['name'], c['value']), cookies_json))
            response = requests.get(url, allow_redirects=False, headers={'cookie': cookies_str})

            assert_that(
                unquote(response.url),
                description=f"URL {response.url} is not the same with {url}",
            ).is_subset_of(url)
            assert_that(
                response.status_code,
                description=f"URL {url} load status code is {response.status_code}",
            ).is_less_than_or_equal_to(307)
