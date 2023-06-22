from time import sleep
import re
from pytest_selenium_enhancer import CustomWait
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from frontend.grv_project.webdriver import custom_expected_conditions as CEC
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException

from frontend.grv_project.page_objects.header_co import HeaderComponent

from frontend.grv_project.webdriver.custom_wait import CustomWait

TIMEOUT_20SEC = 20

class BasePage:
    def __init__(self, selenium, base_url):
        self._base_url = base_url
        self._selenium = selenium
        # self._device = env['env']['device']
        # self._os = env['env']['os']
        self._os = (
            re.sub(r"[\s]*", "", selenium.desired_capabilities["platformName"].lower())
            if "platformName" in selenium.desired_capabilities
            else re.sub(r"[\s]*", "", selenium.desired_capabilities["platform"].lower())
        )
        if self._os == "macos":
            self._os = "macosx"
        self._device = "mobile" if self._os in ["android", "ios"] else "desktop"
        self._wait = CustomWait(self._selenium)

    @property
    def header(self):
        return HeaderComponent(self._selenium)

    def open(self, **kwargs):
        pass

    def is_loaded(self, **kwargs):
        pass

    # def find_element(self, *locator):
    #     if locator.__len__() == 2:
    #         return self._selenium.find_element(*locator)
    #     return self._selenium.find_element(*(locator[1], locator[2] % locator[0]))
    #
    # def wait_for_element_visible(self, *locator):
    #     wait = WebDriverWait(self._selenium, TIMEOUT_20SEC)
    #     if locator.__len__() == 2:
    #         return wait.until(EC.visibility_of_element_located((locator[0], locator[1])))
    #     return wait.until(EC.visibility_of_element_located((locator[1], locator[2] % locator[0])))

    def wait_for_element_visible(self, by=By.XPATH, value=None, text=None, time_to_wait=10):
        if text is not None:
            value = value % text
        wait = WebDriverWait(self._selenium, time_to_wait)
        self.scroll_into_view(self._selenium.find_element(By.XPATH, value))
        return wait.until(EC.visibility_of_element_located((by, value)))

    def wait_for_element_clickable(self, by=By.XPATH, value=None, text=None):
        if text is not None:
            value = value % text
        wait = WebDriverWait(self._selenium, 10)
        self.scroll_into_view(self._selenium.find_element(By.XPATH, value))
        return wait.until(EC.element_to_be_clickable((by, value)))

    def wait_for_child_element_visible(self, parent_element, by=By.XPATH, value=None, text=None):
        if text is not None:
            value = value % text
        wait = WebDriverWait(self._selenium, 10)
        self.scroll_into_view(self._selenium.find_element(By.XPATH, value))
        return wait.until(CEC.visibility_of_child_element_located(parent_element, (by, value)))

    def check_element_exists_by(self, by=By.XPATH, value=None, text=None):
        try:
            self._selenium.find_element(by, value)
        except NoSuchElementException:
            return False
        return True

    def scroll_into_view(self, element):
        self._selenium.execute_script("arguments[0].scrollIntoView()", element)

    @staticmethod
    def static_wait(period=1):
        sleep(period)
