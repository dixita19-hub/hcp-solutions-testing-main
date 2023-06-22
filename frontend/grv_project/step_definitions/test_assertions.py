import pytest
import time

import structlog
from pytest_bdd import parsers, then, given, when

from frontend.grv_project.page_objects.landing_page import LandingPage
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By


from frontend.grv_project.page_objects.complicated_page import ComplicatedPage
from frontend.grv_project.page_objects.locators import LandingPageLocators
from frontend.grv_project.page_objects.ultimateqa_automation_page import UltimateqaAutomationPage
from bp_core.frontend.common.helpers.selenium_generics import SeleniumGenerics
logger = structlog.get_logger(__name__)

@then(parsers.re("'(?P<page_name>.*)' page is opened"), converters=dict(page_name=str))
def navigate_to_efficacy_tab_1(selenium, base_url, variables, page_name):
    if page_name == 'ComplicatedPage':
        ComplicatedPage(selenium, base_url, variables['env']).is_loaded()
    elif page_name == 'UltimateqaAutomationPage':
        UltimateqaAutomationPage(selenium, base_url, variables['env']).is_loaded()
    else:
        ValueError('%s page does not exist' % page_name)


@given('I am an anonymous user')
def authorize_anonymous_user(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    base_url = pytest.globalDict['i18n']['URL']
    LandingPage(selenium, base_url, variables).open()
    time.sleep(5)
    if pytest.globalDict['language'] == 'en':
        selenium.find_element(By.XPATH,
                              '//button[@id="_evidon-banner-acceptbutton"]').click()
        if selenium_generics.is_element_visible('//*[@id="ituw"]/helix-core-heading', 10):
            selenium.find_element(By.XPATH, '//*[@id="ituw"]/helix-core-heading').click()
            ActionChains(selenium).send_keys(Keys.PAGE_DOWN).perform()
            time.sleep(2)
            selenium.find_element(By.XPATH,
                                  '//helix-core-button[@id="imfgj" or @id="i6gui"]').click()
            time.sleep(3)
    if pytest.globalDict['language'] == 'eu-uk-stg':
        selenium_generics.click(LandingPageLocators.landing_pfizer_eu_uk_stg)
    else:
        try:
            selenium_generics.click(LandingPageLocators.landing_pfizer_account)
        except:
            selenium_generics.click(LandingPageLocators.landing_pfizer_menu)
            selenium_generics.click(LandingPageLocators.landing_pfizer_account)


    time.sleep(4)


@then(parsers.re("I press '(?P<key>.*)'"))
@when(parsers.re("I press '(?P<key>.*)'"))
def press_key_not_focused_on_element(selenium_generics: SeleniumGenerics, key: str):
    logger.info("Pressing Key", key=key)
    selenium_generics.press_key(key)
