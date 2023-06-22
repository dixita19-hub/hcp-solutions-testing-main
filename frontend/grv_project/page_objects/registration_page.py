from time import sleep

import pytest
import re
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.select import Select

from frontend.grv_project.page_objects.base_page import BasePage
from frontend.grv_project.page_objects.locators import RegistrationPageLocators, PrivacyPolicyPagelocators, \
    HomePageLocators, RegistrationPageStep2SignupLocators, LoginPageLocators


class RegistrationPage(BasePage):
    def __init__(self, selenium, base_url, page_name='RegistrationPage'):
        super().__init__(selenium, base_url)
        self._page_name = page_name
        self._page_url = ''

    def open(self, **kwargs):
        self._selenium.get('%s%s' % (self._base_url, self._page_url))

    @property
    def _registration_button(self):
        return self._selenium.find_element(By.XPATH, value=RegistrationPageLocators.continue_button)

    @property
    def _first_name_input(self):
        return self._selenium.find_element(By.XPATH, value=RegistrationPageLocators.first_name_field)

    @property
    def _last_name_input(self):
        return self._selenium.find_element(By.XPATH, value=RegistrationPageLocators.last_name)

    @property
    def _email_input(self):
        return self._selenium.find_element(By.XPATH, value=RegistrationPageLocators.email)

    @property
    def _last_name_validation_msg(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=RegistrationPageLocators.last_name_validation_message)

    @property
    def _privacy_link(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=RegistrationPageLocators.privacy_link_css)

    def enter_string_name_input(self, first_name):
        #self._selenium.switch_to_default_content()
        print(first_name)
        self._first_name_input.send_keys(first_name)

    def enter_string_last_name_input(self, string):
        #self._selenium.switch_to_default_content()
        self._last_name_input.send_keys(string)

    def last_name_input_click(self):
        sleep(2)
        self._last_name_input.click()

    def email_input_click(self):
        #self._selenium.switch_to_default_content()
        self._email_input.click()

    def email_enter_field(self, email_to_enter):
        #self._selenium.switch_to_default_content()
        self._email_input.send_keys(email_to_enter)
        sleep(5)

    def analyze_first_name_actual_input(self, expected):
        #self._selenium.switch_to_default_content()
        print("value passed in function: " + expected)
        alfanumber_part_expected = re.findall('[A-Za-z_ ]+', expected)
        sleep(1)
        fname_input = self._selenium.find_element(By.XPATH, value=RegistrationPageLocators.first_name_field)
        name_value_extracted = fname_input.get_property('value')
        print("value actual extracted: " + name_value_extracted)
        print("value expected: " + expected)
        assert alfanumber_part_expected.__eq__(name_value_extracted)

    def analyze_last_name_actual_input(self, expected):
        #self._selenium.switch_to_default_content()
        print("value passed in function: " + expected)
        alfanumber_part_expected = re.findall('[A-Za-z_ ]+', expected)
        sleep(1)
        fname_input = self._selenium.find_element(By.XPATH, value=RegistrationPageLocators.last_name)
        name_value_extracted = fname_input.get_property('value')
        print("value actual extracted: " + name_value_extracted)
        print("value expected: " + expected)
        assert alfanumber_part_expected.__eq__(name_value_extracted)

    # def analyze_last_name_actual_input(self, expected):
    #     lname_value = self._last_name_input.get_attribute('value')
    #     assert expected.__eq__(lname_value)

    def check_first_name_validation_absent(self):
        sleep(3)
        assert not len(
            self._selenium.find_elements_by_css_selector(RegistrationPageLocators.first_name_validation_message))

    def check_first_name_validation_absent_improved(self):
        #element = self._selenium.find_element_by_css_selector(RegistrationPageLocators.first_name_validation_message)
        element = self._selenium.find_element(by=By.CSS_SELECTOR, value=RegistrationPageLocators.first_name_validation_message)
        assert not element.is_displayed()

    def check_last_name_validation_absent(self):
        sleep(2)
        element = self._selenium.find_element_by_css_selector(RegistrationPageLocators.last_name_validation_message)
        assert not element.is_displayed()

    def check_email_validation_message(self):
        #self._selenium.switch_to_default_content()
        self._email_input.send_keys(Keys.TAB)
        sleep(4)
        email_validation = self._selenium.find_element_by_css_selector(
            RegistrationPageLocators.email_input_validation_message)
        assert email_validation.is_displayed()
        print(email_validation.text)
        assert email_validation.text == pytest.globalDict['i18n']['ERROR_MESSAGE']['EMAIL_VALIDATION_MESSAGE']

    def check_continue_button_disabled(self):
        #self._selenium.switch_to_default_content()
        element = self._selenium.find_element_by_xpath(RegistrationPageLocators.continue_button_xpath)
        assert not element.is_enabled()

    def check_continue_button_enabled(self):
        #self._selenium.switch_to_default_content()
        element = self._selenium.find_element_by_xpath(RegistrationPageLocators.continue_button_xpath)
        assert element.is_enabled()

    def skipping_title_input(self):
        #self._selenium.switch_to_default_content()
        title_input = self._selenium.find_element_by_css_selector(RegistrationPageLocators.title_input_css)
        title_input.click()
        title_input.send_keys(Keys.ESCAPE)
        sleep(3)

    def enter_title_input_select(self, title):
        #self._selenium.switch_to_default_content()
        #title_input = self._selenium.find_element_by_css_selector(RegistrationPageLocators.title_input_css)
        title_input = self._selenium.find_element_by_css_selector(RegistrationPageLocators.title_input_css)
        select = Select(title_input)
        # select by visible text
        select.select_by_visible_text(title)
        sleep(3)

    def click_on_privacy_link(self):
        #self._selenium.switch_to_default_content()
        self._privacy_link.click()
        sleep(2)

    def extract_privacy_policy_title(self):
        sleep(2)
        self._selenium.switch_to.window(self._selenium.window_handles[-1])
        sleep(2)
        #self._selenium.switch_to_default_content()
        title = self._selenium.find_element_by_css_selector(PrivacyPolicyPagelocators.title_css)
        print(title.text)
        assert title.text == pytest.globalDict['i18n']['PRIVACY_POLICY_PAGE_TITLE']

    def click_on_close_button(self):
        #self._selenium.switch_to_default_content()
        close_button = self._selenium.find_element_by_xpath(RegistrationPageLocators.close_button_xpath)
        close_button.click()

    def check_base_webpage_title(self):
        ##self._selenium.switch_to_default_content()
        sleep(5)
        base_webpage_title = self._selenium.find_element_by_xpath(HomePageLocators.title_xpath)
        assert base_webpage_title.is_displayed()

    def click_continue_button(self):
        #self._selenium.switch_to_default_content()
        # scroll down to make Continue button vivsible
        html = self._selenium.find_element_by_tag_name('html')
        html.send_keys(Keys.END)
        continue_button = self._selenium.find_element_by_xpath(RegistrationPageLocators.continue_button_xpath)
        continue_button.click()
        sleep(8)
        #continue_button.click()

    def check_base_elems_step_two_signup(self):
        #self._selenium.switch_to_default_content()
        sleep(4)
        speciality_input = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.speciality_css)
        assert speciality_input.is_displayed()

    def back_button_click(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        back_button = self._selenium.find_element_by_xpath(RegistrationPageLocators.back_button_xpath)
        back_button.click()

    def check_login_input_passwords(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        email_input = self._selenium.find_element_by_xpath(LoginPageLocators.email_field)
        password_input = self._selenium.find_element_by_xpath(LoginPageLocators.password_field)
        assert email_input.is_displayed()
        assert password_input.is_displayed()

    def check_for_elements(self):
        sleep(5)
        assert self._selenium.find_element_by_xpath(
            RegistrationPageLocators.first_name_field).is_displayed()
        assert self._selenium.find_element_by_xpath(
            RegistrationPageLocators.last_name).is_displayed()
        assert self._selenium.find_element_by_xpath(
            RegistrationPageLocators.email).is_displayed()
