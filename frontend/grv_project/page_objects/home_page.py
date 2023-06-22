from time import sleep

import pytest
import re
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.select import Select

from frontend.grv_project.page_objects.base_page import BasePage
from frontend.grv_project.page_objects.locators import RegistrationPageLocators, PrivacyPolicyPagelocators, HomePageLocators, \
    RegistrationPageStep2SignupLocators, LoginPageLocators


class HomePage(BasePage):
    def __init__(self, selenium, base_url, page_name='HomePage'):
        super().__init__(selenium, base_url)
        self._page_name = page_name
        self._page_url = ''

    def open(self, **kwargs):
        self._selenium.get('%s%s' % (self._base_url, self._page_url))

    def open_view_profile(self):
        sleep(5)
        # New Added
        # js = "var x= document.querySelector('helix-oidc-login').shadowRoot.querySelector('a.oidc-personal'); x.click();"
        # self._selenium.execute_script(js)
        # sleep(5)
        self._selenium.find_element(By.XPATH,
                              '//*[@id="iz7tz" or @id="iorgq"]').click()
        sleep(5)


    def check_on_home_page(self):
        print(self._selenium.title)
        print(pytest.globalDict['i18n']['HOME_PAGE_TITLE'])
        assert self._selenium.title == pytest.globalDict['i18n']['HOME_PAGE_TITLE']
