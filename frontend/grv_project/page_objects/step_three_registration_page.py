from time import sleep

import pytest
import re
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.color import Color
from selenium.webdriver.support.select import Select

from frontend.grv_project.page_objects.base_page import BasePage
from frontend.grv_project.page_objects.locators import RegistrationPageLocators, PrivacyPolicyPagelocators, HomePageLocators, \
    RegistrationPageStep2SignupLocators, LoginPageLocators, RegistrationPageStep3SignupLocators

RED_COLOR = "#fa5151"
BLUE_COLOR = "#0064c1"


class StepThreeRegistrationPage(BasePage):
    def __init__(self, selenium, base_url, page_name='StepThreeRegistrationPage'):
        super().__init__(selenium, base_url)
        self._page_name = page_name
        self._page_url = ''

    def open(self, **kwargs):
        self._selenium.get('%s%s' % (self._base_url, self._page_url))

    @property
    def _work_outline(self):
        return self._selenium.find_element(By.XPATH,
                                           value=RegistrationPageStep3SignupLocators.work_outline_xpath)

    @property
    def _password_input(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=RegistrationPageStep3SignupLocators.password_to_create_input_css)

    @property
    def _therapy_inputs(self):
        return self._selenium.find_elements(By.CSS_SELECTOR,
                                           value=RegistrationPageStep3SignupLocators.password_to_create_input_css)

    @property
    def _confirm_password_input(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=RegistrationPageStep3SignupLocators.password_to_confirm_input_css)

    @property
    def _healthcare_checkbox(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=RegistrationPageStep3SignupLocators.healthcare_resident_checkbox_css)

    @property
    def _confirm_checkbox(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=RegistrationPageStep3SignupLocators.confirm_checkbox_css)

    @property
    def _privacy_cookie_policy_link(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=RegistrationPageStep3SignupLocators.privacy_cookie_policy_link_css)

    @property
    def _tos_link(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=RegistrationPageStep3SignupLocators.terms_of_use_link_css)

    @property
    def _back_button(self):
        return self._selenium.find_element(By.XPATH,
                                           value=RegistrationPageStep3SignupLocators.back_button_xpath)

    @property
    def _step_two_navbar(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=RegistrationPageStep3SignupLocators.step_two_navbar_css)

    @property
    def _step_one_navbar(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=RegistrationPageStep3SignupLocators.step_one_navbar_css)

    @property
    def _close_button(self):
        return self._selenium.find_element(By.XPATH,
                                           value=RegistrationPageStep3SignupLocators.close_button)


    def check_elements_step_three(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        assert self._work_outline.is_displayed()


    def check_elements(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        assert self._password_input.is_displayed()
        assert self._confirm_password_input.is_displayed()
        assert self._healthcare_checkbox.is_displayed()
        assert self._confirm_checkbox.is_displayed()

    def check_elements_theray_form(self):
        sleep(2)
        assert self._password_input.is_displayed()
        assert self._confirm_password_input.is_displayed()
        assert self._healthcare_checkbox.is_displayed()
        assert self._confirm_checkbox.is_displayed()

    def check_complete_reg_disabled(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        element = self._selenium.find_element_by_xpath(RegistrationPageStep3SignupLocators.complete_registration_xpath)
        assert not element.is_enabled()
        sleep(2)

    def check_complete_reg_enabled(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        element = self._selenium.find_element_by_xpath(RegistrationPageStep3SignupLocators.complete_registration_xpath)
        assert element.is_enabled()

    def complete_reg_button_click(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        element = self._selenium.find_element_by_xpath(RegistrationPageStep3SignupLocators.complete_registration_xpath)
        element.click()

    def enter_password(self, password):
        #self._selenium.switch_to_default_content()
        self._password_input.clear()
        self._password_input.send_keys(password)
        sleep(1)

    def confirm_password(self, password):
        #self._selenium.switch_to_default_content()
        self._confirm_password_input.send_keys(password)
        sleep(1)

    def email_consent_tick_checkbox(self):
        #self._selenium.switch_to_default_content()
        self._confirm_checkbox.click()
        sleep(1)

    def email_consent_check_unticked(self):
        #self._selenium.switch_to_default_content()
        assert not self._confirm_checkbox.is_selected()
        sleep(1)

    def email_consent_untick_checkbox(self):
        #self._selenium.switch_to_default_content()
        self._confirm_checkbox.click()
        sleep(1)
        self._confirm_checkbox.click()
        sleep(1)

    def self_certification_tick_checkbox(self):
        #self._selenium.switch_to_default_content()
        self._healthcare_checkbox.click()
        sleep(1)

    def self_certification_untick_checkbox(self):
        #self._selenium.switch_to_default_content()
        self._healthcare_checkbox.click()
        sleep(1)
        self._healthcare_checkbox.click()
        sleep(1)

    def click_privacy_link(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        move = ActionChains(self._selenium).move_to_element(self._privacy_cookie_policy_link)
        move.perform()
        self._privacy_cookie_policy_link.click()
        sleep(2)

    def click_tos(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        move = ActionChains(self._selenium).move_to_element(self._tos_link)
        move.perform()
        self._tos_link.click()
        sleep(2)

    def switch_to_privacy_policy(self):
        self._selenium.switch_to.window(self._selenium.window_handles[1])
        print("Current Page Title is : %s" % self._selenium.title)
        assert self._selenium.title == pytest.globalDict['i18n']['PRIVACY_COOKIE_POLICY_TITLE']
        self._selenium.close()

    def switch_to_tos_page(self):
        self._selenium.switch_to.window(self._selenium.window_handles[1])
        print("Current Page Title is : %s" % self._selenium.title)
        assert self._selenium.title == pytest.globalDict['i18n']['TOS_PAGE_TITLE']
        self._selenium.close()

    def back_button_click(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        self._back_button.click()

    def step_two_navbar_click(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        self._step_two_navbar.click()

    def step_one_navbar_click(self):
        ##self._selenium.switch_to_default_content()
        self._step_one_navbar.click()

    def check_for_validation_under_password_input(self, message):
        #self._selenium.switch_to_default_content()
        print("message: " + message)
        validation_message_locator_xpath = "//ul[@id=\"password-indicator\"]/li[contains(text(),'" + message + "')]"
        validation_message = self._selenium.find_element_by_xpath(validation_message_locator_xpath)
        assert validation_message.is_displayed()
        color = validation_message.value_of_css_property("color")
        print("rgba color: " + Color.from_string(color).rgba)
        print("hex color: " + Color.from_string(color).hex)
        assert Color.from_string(color).hex == ("%s" % RED_COLOR)

    def check_for_validation_under_password_input_blue_color(self, message):
        #self._selenium.switch_to_default_content()
        print("message: " + message)
        validation_message_locator_xpath = "//ul[@id=\"password-indicator\"]/li[contains(text(),'" + message + "')]"
        validation_message = self._selenium.find_element_by_xpath(validation_message_locator_xpath)
        assert validation_message.is_displayed()
        color = validation_message.value_of_css_property("color")
        print("rgba color: " + Color.from_string(color).rgba)
        print("hex color: " + Color.from_string(color).hex)
        assert Color.from_string(color).hex == ("%s" % BLUE_COLOR)

    def close_button_click(self):
        #self._selenium.switch_to_default_content()
        self._close_button.click()
        sleep(2)
