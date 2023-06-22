# pylint: disable=invalid-name
# pylint: disable=protected-access
# pylint: disable=wildcard-import
# pylint: disable=unused-wildcard-import
from collections import defaultdict
from pathlib import Path

import pytest

from _pytest.fixtures import FixtureRequest, FixtureLookupError

from pytest_bdd import parser as pytest_bdd_parser

from bp_core.frontend.common.step_definitions.steps_common import *
from bp_core.frontend.common.utils.locator_parser import Locators

from pytest_selenium.drivers import appium
from pytest_selenium.drivers import remote

import logging

blank_logger = logging.getLogger(__name__)
blank_logger.propagate = False


def pytest_bdd_before_scenario(
    request: FixtureRequest,
    feature: pytest_bdd_parser.Feature,
    scenario: pytest_bdd_parser.Scenario,
):
    """Called before every scenario execution"""
    request.node.scenarioDict = defaultdict()
    # Use built-in logger with default level warning to display only a separation line between each scenario
    blank_logger.warning("\n")

    logger.info(
        "Scenario Execution Started.", scenario_name=scenario.name, feature=feature.name
    )


# Add logging after each scenario
def pytest_bdd_after_scenario(
    feature: pytest_bdd_parser.Feature, scenario: pytest_bdd_parser.Scenario
):
    """Called after every scenario is executed"""
    logger.info(
        "Scenario Execution Completed.",
        scenario_name=scenario.name,
        feature=feature.name,
    )


# Add logging for each step
def pytest_bdd_after_step(
    request: FixtureRequest,
    feature: pytest_bdd_parser.Feature,
    scenario: pytest_bdd_parser.Scenario,
    step: pytest_bdd_parser.Step
):
    """Called after every step execution"""
    logger.info(
        "Step Executed.",
        step=step.name,
    )
    if "I take a screenshot" in step.name:
        try:
            driver_ = request.getfixturevalue("selenium")
        except FixtureLookupError:
            driver_ = None
        if driver_:
            screenshot_source = driver_.get_screenshot_as_base64()
            scenario_cache = request.config.cache.get(f"{feature.name}/{scenario.name}", None)
            if scenario_cache and isinstance(scenario_cache, dict):
                if request.node.name not in scenario_cache:
                    scenario_cache[request.node.name] = [screenshot_source]
                    request.config.cache.set(f"{feature.name}/{scenario.name}", scenario_cache)
                elif scenario_cache.get(request.node.name, None):
                    scenario_cache.get(request.node.name, []).append(screenshot_source)
                    request.config.cache.set(f"{feature.name}/{scenario.name}", scenario_cache)
            else:
                request.config.cache.set(f"{feature.name}/{scenario.name}", {f"{request.node.name}": [screenshot_source]})


# Define chrome options as a fixture
@pytest.fixture
def chrome_options(chrome_options, variables, proxy_url, env_variables, request):
    file_path = Path(__file__ + "/../../../" + env_variables.get("DOWNLOAD_DIR")).resolve()
    caps = request.getfixturevalue("session_capabilities")
    if (caps.get("headless", "") == "True") or (
        "capabilities" in variables
        and "headless" in variables["capabilities"]
        and variables["capabilities"]["headless"] == "True"
    ):
        chrome_options.add_argument("--headless")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-gpu")
    chrome_options.add_argument("--disable-dev-shm-usage")
    chrome_options.add_argument("--window-size=1367,768")
    if proxy_url:
        chrome_options.add_argument("--ignore-certificate-errors")
        chrome_options.add_argument(f"--proxy-server={proxy_url}")

    if env_variables.get("DOWNLOAD_DIR", default=False):
        chrome_options.add_experimental_option('prefs', {"download.default_directory": str(file_path)})

    return chrome_options


# Define firefox options as a fixture
@pytest.fixture
def firefox_options(firefox_options, request, proxy_url):
    caps = request.getfixturevalue("session_capabilities")
    if caps.get("headless", "false").strip().lower() != "false":
        firefox_options.add_argument("-headless")

    if proxy_url:
        proxy = {
            "proxyType": "MANUAL",
            "httpProxy": proxy_url,
            "sslProxy": proxy_url,
        }
        firefox_options.set_capability("proxy", proxy)
        firefox_options.set_capability("acceptInsecureCerts", True)
        firefox_options.set_capability("marionette", True)
    return firefox_options


# Define MSEdge options as a fixture
@pytest.fixture
def edge_options(edge_options, request, proxy_url):
    caps = request.getfixturevalue("session_capabilities")
    if caps.get("headless", "false").strip().lower() != "false":
        edge_options.add_argument('--window-size=1024,768')
        edge_options.headless = True
    if proxy_url:
        edge_options.add_argument(f'--proxy-server={request.config.option.proxy_url}')

    return edge_options


# Define session capabilities as a fixture
# This is API & UI specific implementation
@pytest.fixture(scope="session", autouse=True)
def session_capabilities(proxy_url, session_capabilities: dict):
    # enable performance logs for Adobe Analytics generic step
    session_capabilities["goog:loggingPrefs"] = {"performance": "ALL"}
    if proxy_url:
        proxy_caps: dict = {
            "proxyType": "MANUAL",
            "httpProxy": proxy_url,
            "sslProxy": proxy_url,
        }

        # merging the dictionaries
        return {**session_capabilities, **proxy_caps}

    return session_capabilities


# Default selenium driver as a fixture
# This is UI specific implementation
@pytest.fixture
def selenium(selenium, selenium_patcher, variables, request):
    selenium.delete_all_cookies()

    return selenium


# Add support for HTTPS protocol for Appium & Remote when running against Browserstack
# You need to have the property "browserstack" set to "True" within capabilities files
# This is a temporary solution until pytest-selenium gets updated with HTTPS protocol support added
@pytest.fixture(scope="session", autouse=True)
def configure_driver_executor(session_capabilities):
    if session_capabilities.get("browserstack", "False") == 'True':
        def driver_kwargs(capabilities, host, **kwargs):  # noqa
            executor = f"https://{host}/wd/hub"
            kwargs = {"command_executor": executor, "desired_capabilities": capabilities}
            return kwargs

        appium.driver_kwargs = driver_kwargs
        remote.driver_kwargs = driver_kwargs


# Define selenium generics as a fixture
# This is UI specific implementation
@pytest.fixture
def selenium_generics(selenium) -> SeleniumGenerics:
    return SeleniumGenerics(selenium)


# Define the locators in case of specific path to the locators values
# This is UI specific implementation
@pytest.fixture(scope="session", autouse=True)
def locators(request) -> Locators:
    locator_path = request.config.getoption("--locators")
    return Locators(locator_path)


# Define capabilities as a fixture
# This is UI specific implementation
@pytest.fixture
def capabilities(capabilities):
    if "browser" in capabilities and capabilities["browser"] in [
        "Edge",
        "MicrosoftEdge",
    ]:
        capabilities["browserstack.edge.enablePopups"] = "true"
    if "browser" in capabilities and capabilities["browser"] in ["safari", "Safari"]:
        capabilities["browserstack.safari.enablePopups"] = "true"
    return capabilities
