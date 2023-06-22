from time import sleep

import pytest
import re
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.select import Select

from frontend.grv_project.page_objects.base_page import BasePage
from frontend.grv_project.page_objects.locators import RegistrationPageLocators, PrivacyPolicyPagelocators, HomePageLocators, \
    RegistrationPageStep2SignupLocators, LoginPageLocators


class StepTwoRegistrationPage(BasePage):
    def __init__(self, selenium, base_url, page_name='StepTwoRegistrationPage'):
        super().__init__(selenium, base_url)
        self._page_name = page_name
        self._page_url = ''

    def open(self, **kwargs):
        self._selenium.get('%s%s' % (self._base_url, self._page_url))

    @property
    def _speciality_input(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=RegistrationPageStep2SignupLocators.speciality_css)

    @property
    def _profession_input(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=RegistrationPageStep2SignupLocators.profession_select_css)

    @property
    def _back_button(self):
        return self._selenium.find_element(By.XPATH,
                                           value=RegistrationPageStep2SignupLocators.back_button_xpath)

    @property
    def _step_one_signup_nav_indicator_bar(self):
        return self._selenium.find_element(By.XPATH,
                                           value=RegistrationPageStep2SignupLocators.step_one_navigation_indication_bar)

    @property
    def _continue_button(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=RegistrationPageStep2SignupLocators.continue_button_css)

    def fill_in_profession_field(self):
        #self._selenium.switch_to_default_content()
        # profession_input = self._selenium.find_element_by_css_selector(
        #     RegistrationPageStep2SignupLocators.profession_select_css)
        print("professtion to enter: Consultant")
        select = Select(self._profession_input)
        select.select_by_index("1")
        sleep(2)

    def fill_in_speciality_one_field(self):
        #self._selenium.switch_to_default_content()
        print("speciality to enter: Allergy")
        speciality_one_by_locator = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.speciality_css)
        select = Select(speciality_one_by_locator)
        select.select_by_value("Allergy")
        sleep(2)

    def open_and_close_speciality_one_field(self):
        #self._selenium.switch_to_default_content()
        speciality_one_field = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.speciality_css)
        speciality_one_field.click()
        sleep(1)
        speciality_one_field.click()
        sleep(1)

    def open_and_close_profession_field(self):
        #self._selenium.switch_to_default_content()
        input_field = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.profession_select_css)
        input_field.click()
        sleep(1)
        input_field.click()
        sleep(1)

    def skip_postcode_field(self):
        #self._selenium.switch_to_default_content()
        input_field = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.workplace_postcode_input_css)
        input_field.click()
        sleep(1)

    def skip_license_field(self):
        #self._selenium.switch_to_default_content()
        input_field = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.registration_lsp_number_input_css)
        input_field.click()
        sleep(1)

    def fill_in_speciality_two_field(self):
        #self._selenium.switch_to_default_content()
        print("speciality to enter: Asthma")
        speciality_two_by_locator = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.second_speciality_select_css)
        select = Select(speciality_two_by_locator)
        select.select_by_value("Asthma")
        sleep(2)

    def enter_postcode(self, postcode):
        #self._selenium.switch_to_default_content()
        print("psotcode to enter: postcode")
        postcode_input = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.workplace_postcode_input_css)
        postcode_input.send_keys(postcode)
        sleep(2)

    def enter_license(self, license_value):
        #self._selenium.switch_to_default_content()
        print("license to enter: license_value")
        license_input = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.registration_lsp_number_input_css)
        license_input.send_keys(license_value)
        sleep(2)

    def continue_button_enabled(self):
        #self._selenium.switch_to_default_content()
        continue_button = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.continue_button_css)
        assert continue_button.is_enabled()

    def click_continue_button(self):
        #self._selenium.switch_to_default_content()
        self._continue_button.click()

    def analyze_speciality_one_validation(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        speciality_one_validation = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.speciality_one_validation_error)
        assert speciality_one_validation.is_displayed()
        print(speciality_one_validation.text)
        assert speciality_one_validation.text == pytest.globalDict['i18n']['ERROR_MESSAGE']['SPECIALITY_ONE_REQUIRED']

    def analyze_profession_validation(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        validation_message = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.profession_validation_error)
        assert validation_message.is_displayed()
        print(validation_message.text)
        assert validation_message.text == pytest.globalDict['i18n']['ERROR_MESSAGE']['PROFESSION_REQUIRED']

    def analyze_postcode_validation(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        validation_message = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.postcode_validation_error)
        assert validation_message.is_displayed()
        print(validation_message.text)
        assert validation_message.text == pytest.globalDict['i18n']['ERROR_MESSAGE']['POSTCODE_REQUIRED']

    def analyze_postcode_validity_against_regexp(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        validation_message = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.postcode_validation_error)
        assert validation_message.is_displayed()
        print(validation_message.text)
        assert validation_message.text == pytest.globalDict['i18n']['ERROR_MESSAGE']['ENTER_VALID_POSTCODE']

    def analyze_for_license_length_short(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        validation_message = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.license_validation_error)
        assert validation_message.is_displayed()
        print(validation_message.text)
        assert validation_message.text == pytest.globalDict['i18n']['ERROR_MESSAGE'][
            'LICENSE_LESS_THAN_SEVEN_CHARS_MESSAGE']

    def analyze_for_license_length_long(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        validation_message = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.license_validation_error)
        assert validation_message.is_displayed()
        print(validation_message.text)
        assert validation_message.text == pytest.globalDict['i18n']['ERROR_MESSAGE'][
            'LICENSE_NUMBER_CANNOT_BE_MORE_THAN_TWELVE_CHARACTERS']

    def analyze_license_validation(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        validation_message = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.license_validation_error)
        assert validation_message.is_displayed()
        print(validation_message.text)
        assert validation_message.text == pytest.globalDict['i18n']['ERROR_MESSAGE']['LICENSE_REQUIRED']

    def back_button_click(self):
        #self._selenium.switch_to_default_content()
        self._back_button.click()

    def click_step_1_signup_navigator_bar(self):
        #self._selenium.switch_to_default_content()
        self._step_one_signup_nav_indicator_bar.click()

    def license_validation_not_displayed(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        validation_message = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.license_validation_error)
        assert not validation_message.is_displayed()

    def license_field_mouse_hover(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        #actions = ActionChains(self._selenium)
        license_input = self._selenium.find_element_by_css_selector(
            RegistrationPageStep2SignupLocators.registration_lsp_number_input_css)
        hover = ActionChains(self._selenium).move_to_element(license_input)
        hover.perform()
        sleep(2)

    def check_for_tooltip_is_displayed(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        tooltip = self._selenium.find_element_by_xpath(
            RegistrationPageStep2SignupLocators.license_tooltip_xpath)
        assert tooltip.is_displayed()
