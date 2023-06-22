from selenium.webdriver.common.by import By

from frontend.grv_project.page_objects.base_page import BasePage


class ComplicatedPage(BasePage):
    def __init__(self, selenium, base_url,  page_name='ComplicatedPage'):
        super().__init__(selenium, base_url)
        self._page_name = page_name
        self._page_url = '/complicated-page'

    def open(self, **kwargs):
        self._selenium.get('%s%s' % (self._base_url, self._page_url))

    def is_loaded(self, **kwargs):
        self._wait.wait_until(lambda: self._selenium.current_url == '%s%s' % (self._base_url, self._page_url))
        assert self._selenium.title == 'Complicated Page - Ultimate QA'
