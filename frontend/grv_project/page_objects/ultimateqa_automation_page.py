import pytest
from selenium.webdriver.common.by import By

from frontend.grv_project.page_objects.base_page import BasePage


class UltimateqaAutomationPage(BasePage):
    def __init__(self, selenium, base_url, env, page_name='UltimateqaAutomationPage'):
        super().__init__(selenium, base_url, env)
        self._page_name = page_name
        self._page_url = '/automation'

        self._actual_screenshot_dir = '%s/%s.png' % (pytest.globalDict['actual_screenshot_dir'], page_name)

    @property
    def _header(self):
        return self._selenium.find_element(By.XPATH, '//header')

    @property
    def _header_banner(self):
        return self._selenium.find_element(By.XPATH, '//section')

    @property
    def _content(self):
        return self._selenium.find_element(By.XPATH, '//div[contains(@class, "et_pb_section_1")]')

    @property
    def _complicated_page_link(self):
        return self._content.find_element(By.XPATH, './/a[@href="../complicated-page"]')

    @property
    def _social_panel(self):
        return self._selenium.find_element(By.XPATH, '//div[contains(@class, "swp_social_panelSide")]')

    def click_link(self, link_name):
        if link_name == 'ComplicatedPage':
            script = 'arguments[0].scrollIntoView(true)'
            self._selenium.execute_script(script, self._header_banner)
            self._complicated_page_link.click()
        else:
            raise ValueError('%s link does not exist on page' % link_name)

    def open(self, **kwargs):
        self._selenium.get('%s%s' % (self._base_url, self._page_url))

    def is_loaded(self, **kwargs):
        self._wait.wait_until(lambda: self._selenium.current_url == '%s%s' % (self._base_url, self._page_url))
        assert self._selenium.title == 'Automation Practice - Ultimate QA'
        self._selenium.get_full_page_screenshot_as_png(
            image_path=self._actual_screenshot_dir,
            elements_to_hide={"start": [self._header], "all": [self._social_panel], "end": []})
