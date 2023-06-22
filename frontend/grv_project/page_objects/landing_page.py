from time import sleep

import pytest
from selenium.webdriver.common.by import By

from frontend.grv_project.page_objects.base_page import BasePage
from frontend.grv_project.page_objects.locators import LandingPageLocators


class LandingPage(BasePage):
    def __init__(self, selenium, base_url,  page_name='LandingPage'):
        super().__init__(selenium, base_url)
        self._page_name = page_name
        self._page_url = ''

    def open(self, **kwargs):
        self._selenium.get('%s%s' % (self._base_url, self._page_url))

    @property
    def _pfizer_account(self):
        return self._selenium.find_element(By.XPATH, value=LandingPageLocators.landing_pfizer_account)

    @property
    def _login_username(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=LandingPageLocators.landing_login_username)

    @property
    def _login_password(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=LandingPageLocators.landing_login_password)

    @property
    def _submit_button(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=LandingPageLocators.landing_login_submit)

    @property
    def _sign_in_link(self):
        return self._selenium.find_element(By.XPATH, value=LandingPageLocators.landing_sign_in_link)

    def click_pfizer_logo(self):
        self._pfizer_account.click()

    def fill_in_credentials(self, user):
        self._selenium.switch_to_default_content()
        print(user['EMAIL'])
        print(user['PASSWORD'])
        self._selenium.find_element(By.CSS_SELECTOR, LandingPageLocators.landing_login_username).send_keys(
            user['EMAIL'])
        self._selenium.find_element(By.CSS_SELECTOR, LandingPageLocators.landing_login_password).send_keys(
            user['PASSWORD'])

    def submit(self):
        self._submit_button.click()

    def click_sign_in(self):
        sleep(30)
        #self.wait_for_element_visible(By.CSS_SELECTOR, LandingPageLocators.landing_sign_in_link)
        self._sign_in_link.click()
        sleep(5)
