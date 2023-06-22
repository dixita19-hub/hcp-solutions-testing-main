from assertpy import assert_that
from selenium.webdriver.common.by import By


class HeaderComponent:

    def __init__(self, selenium):
        self._selenium = selenium

    @property
    def _title(self):
        return self._selenium.find_element(By.XPATH, '')

    @property
    def _subtitle(self):
        return self._selenium.find_element(By.XPATH, '')

    def validate_header(self):
        assert_that(self._title.get_property('hidden')).is_false()
        assert_that(self._subtitle.get_property('hidden')).is_false()
        assert_that(self._title.text).contains('This is a Heading')
        assert_that(self._subtitle.text).contains('Demo app')

