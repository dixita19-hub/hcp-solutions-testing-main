import json
import re
import time
import typing
from pathlib import Path
from urllib.parse import urlparse, parse_qsl

import structlog
from pytest_selenium_enhancer import CustomWait
from selenium.webdriver.common.by import By
from selenium.webdriver.remote.webdriver import WebDriver
from selenium.webdriver.remote.webelement import WebElement

from bp_core.frontend.common.helpers.browser import BrowserInteraction
from bp_core.frontend.common.helpers.elements import ElementInteraction
from bp_core.frontend.common.utils.containers import Locator, ShadowLocator
from bp_core.frontend.common.helpers.app import App

logger = structlog.get_logger(__name__)


class SeleniumGenerics(BrowserInteraction, ElementInteraction, App):
    def __init__(self, driver: WebDriver):
        self._os = (
            re.sub(r"[\s]*", "", driver.capabilities["platformName"].lower())
            if "platformName" in driver.capabilities
            else re.sub(r"[\s]*", "", driver.capabilities["platform"].lower())
        )
        self._device = "mobile" if self._os in ["android", "ios"] else "desktop"

        self._selenium = driver
        self._custom_wait = CustomWait(driver)

        super().__init__(self._selenium)

    def execute_action(self, action):
        if "execute_script_on_elements" in action.keys():
            logger.info(
                "Action: %s started on elements: %s"
                % (str(action), str(action["execute_script_on_elements"]["elements"]))
            )
            elements = self.get_elements(
                action["execute_script_on_elements"]["elements"]
            )
            for element in elements:
                if element.is_displayed() is True:
                    self._custom_wait.static_wait(2)
                    self._selenium.execute_script(
                        action["execute_script_on_elements"]["script"], element
                    )
        if "click" in action.keys():
            elements = self.get_elements(action["click"])
            for element in elements:
                if element.is_displayed() is True:
                    self._custom_wait.static_wait(2)
                    self.scroll_into_view(element)
                    logger.info("Scrolled the element into view")
                    self.click(element)
                    logger.info("Action: %s executed on elements" % str(action))

    def get_actual_screenshot_dir(self, url, base_url, count, data_table):
        actual_ss_base_path = Path(
            __file__
            + f"../../../../../output/screenshots/actual/full_page/{data_table['site']}"
        ).resolve()
        page_name = "{site}_{url}_{count}.png".format(
            site=data_table["site"],
            url=url.replace(base_url, "").replace("/", "_"),
            count=count,
        )
        resolution = "{width}_{height}".format(
            width=self._selenium.get_window_size()["width"],
            height=self._selenium.get_window_size()["height"],
        )

        actual_dir = actual_ss_base_path / resolution / page_name
        logger.info(
            "Actual Screenshot Directory",
            base_path=actual_ss_base_path,
            resolution=resolution,
            page_name=page_name,
            full_path=actual_dir,
        )
        return actual_dir

    def validate_element_text(
        self,
        locator: typing.Union[Locator, ShadowLocator, WebElement, str],
        expected_text: str,
    ):
        logger.info("Validating the element text")
        elem = self.get_element(locator)
        inner_text = elem.get_attribute("innerText")
        inner_text = re.sub(r"[\n\t]*", "", inner_text).strip()
        text_content = elem.get_attribute("textContent")
        text_content = re.sub(r"[\n\t]*", "", text_content).strip()

        expected_text = re.sub(r"[\n\t]*", "", str(expected_text)).strip()
        self._custom_wait.wait_until(
            lambda: inner_text == expected_text or text_content == expected_text,
            description=f"Element text is not correct: \nExpected text: {expected_text} "
            f"\nActual inner_text: {inner_text} \nActual text_content: #{text_content}",
        )
        logger.info("Element text validation successful")

    def _file_extension(self):
        if self._device == "mobile":
            return "_%s.png" % self._os
        elif "browserName" in self._selenium.capabilities:
            if self._selenium.capabilities["browserName"] in [
                "Chrome",
                "chrome",
            ]:
                return "_%s_chrome.png" % self._os
            if (
                self._selenium.capabilities["browserName"]
                == "internet explorer"
            ):
                return "_%s_ie.png" % self._os
            if self._selenium.capabilities["browserName"] == "MicrosoftEdge":
                return "_%s_edge.png" % self._os
            if self._selenium.capabilities["browserName"] in [
                "Safari",
                "safari",
            ]:
                return "_%s_safari.png" % self._os
            if self._selenium.capabilities["browserName"] in [
                "Firefox",
                "firefox",
            ]:
                return "_%s_firefox.png" % self._os
        return ".png"

    def validate_page_loaded(self, page_url):
        logger.info("Page load validation started")
        self._custom_wait.wait_until(
            lambda: self._selenium.current_url == page_url,
            description=f"Page not loaded. \nExpected: {page_url} \nActual: {self._selenium.current_url}",
        )
        self._custom_wait.wait_for_the_attribute_value(
            self._selenium.find_element(By.XPATH, "//html"), "class", "hydrated"
        )
        self._custom_wait.static_wait(5)
        logger.info("Page load validation successful")

    def validate_scroll_position(self, scroll_position):
        logger.info("Scroll position validation started")
        self._custom_wait.wait_until(
            lambda: self._selenium.execute_script("return window.pageYOffset;")
            == scroll_position,
            description="Scroll to position %s failed" % scroll_position,
        )
        logger.info(
            "Scroll position validation successful. Scroll position: %s "
            % str(scroll_position)
        )

    def get_elements_to_hide(self, data_table):
        start_elements = []
        start_elements_locators = (
            data_table["start"].split(" ~ ") if data_table["start"] != "None" else []
        )
        for start_element_locator in start_elements_locators:
            elements = self._selenium.find_elements(By.XPATH, start_element_locator)
            if elements.__len__():
                start_elements.append(elements[0])

        all_elements = []
        all_elements_locators = (
            data_table["all"].split(" ~ ") if data_table["all"] != "None" else []
        )
        for all_element_locator in all_elements_locators:
            elements = self._selenium.find_elements(By.XPATH, all_element_locator)
            if elements.__len__():
                all_elements.append(elements[0])

        end_elements = []
        end_elements_locators = (
            data_table["end"].split(" ~ ") if data_table["end"] != "None" else []
        )
        for end_element_locator in end_elements_locators:
            elements = self._selenium.find_elements(By.XPATH, end_element_locator)
            if elements.__len__():
                end_elements.append(elements[0])
        logger.info(
            "Elements to hide are start: %s , end: %s , all: %s"
            % (str(start_elements), str(end_elements), str(all_elements))
        )
        return {
            "start": start_elements,
            "all": all_elements,
            "end": end_elements,
        }

    def set_component_style(self, component_locator, data_table):
        logger.info("Setting component style")
        script = (
            f'document.body.insertAdjacentHTML("beforeend", '
            f'  "<style>{component_locator} {{ '
        )
        for key in data_table:
            script += f"    --{key}: {data_table[key]}; " if key in data_table else ""
        script += f'  }}</style>");'
        self._selenium.execute_script(script)
        logger.info("Component style setting successful")

    def log_filter(self, network_logs):
        # check to be an actual response
        return network_logs["method"] == "Network.responseReceived"

    def retrieve_analytics_from_network_logs(self, network_logs):
        PFIZER_BACKEND_ANALYTICS_URL = 'pfizer.sc.omtrdc.net/b/ss'
        analytics = []
        for log in filter(self.log_filter, network_logs):
            resp_url = log["params"]["response"]["url"]
            if PFIZER_BACKEND_ANALYTICS_URL in resp_url:
                analytics.append(parse_qsl(urlparse(resp_url).query))
        return analytics

    def compare_analytics_logs(self, input_analytics, expected_analytics, presence_no):
        final_analytics = []
        failed_analytics = []
        analytics_match = True
        ANY_VALUE = "any"
        if input_analytics is not None:
            for analytics_request in input_analytics:
                for index in range(0, len(expected_analytics)):
                        if (list(expected_analytics.items())[index][1].lower() != ANY_VALUE and
                            list(expected_analytics.items())[index] not in analytics_request) or \
                            (list(expected_analytics.items())[index][1].lower() == ANY_VALUE and
                             list(expected_analytics.items())[index][0] not in list(zip(*analytics_request))[0]):
                            analytics_match = False
                            failed_analytics.append(analytics_request)
                            break
                if analytics_match:
                    final_analytics.append(analytics_request)
                analytics_match = True
            if len(final_analytics) == int(presence_no):
                    return
            if len(final_analytics) == 0:
                logger.error("\n\nActual Analytics:\n")
                for item in failed_analytics: logger.error(f"{item}\n")
                logger.error("\n\nExpected Analytics:\n")
                logger.error(f"{expected_analytics}\n")
                raise TimeoutError(f"The Actual Analytics do NOT contain the Expected Analytics")
            else:
                raise TimeoutError(
                    f"The Analytics {expected_analytics} occurrences is: {len(final_analytics)}, but we expected to "
                    f"have {presence_no} occurrences")
        else:
            raise TimeoutError("No analytics data is stored in BP pickle file")
