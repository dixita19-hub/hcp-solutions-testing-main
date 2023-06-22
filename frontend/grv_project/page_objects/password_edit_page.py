from time import sleep
import pytest
from assertpy import assert_that
from selenium.common.exceptions import NoSuchElementException, TimeoutException

from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

from frontend.grv_project.page_objects.base_page import BasePage
from frontend.grv_project.page_objects.locators import LoginPageLocators, HomePageLocators, ForgotPasswordPageLocators, \
    PasswordEditPageLocators
from selenium.webdriver.support.color import Color

RED_COLOR = "#ff0000"
BLUE_COLOR = "#0064c1"
NAVYBLUE_COLOR = "#0f75d4"


class PasswordEditPage(BasePage):
    def __init__(self, selenium, base_url, page_name='PasswordEditPage'):
        super().__init__(selenium, base_url)
        self._page_name = page_name
        self._page_url = ''

    def open(self, **kwargs):
        self._selenium.get('%s%s' % (self._base_url, self._page_url))

    @property
    def _current_password_input(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=PasswordEditPageLocators.current_password_input)

    @property
    def _new_password_input(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=PasswordEditPageLocators.new_password_input)

    @property
    def _confirm_new_password_input(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=PasswordEditPageLocators.confirm_new_password_input)

    @property
    def _new_password_validation_message(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=PasswordEditPageLocators.new_password_validation_message)

    @property
    def _confirm_password_validation_message(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=PasswordEditPageLocators.confirm_password_validation_message)

    @property
    def _current_password_validation_message(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=PasswordEditPageLocators.current_password_validation_message)

    @property
    def _save_changes_button_disabled(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=PasswordEditPageLocators.save_changes_button_disabled)

    @property
    def _save_changes_button_enabled(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=PasswordEditPageLocators.save_changes_button_enabled)

    def check_for_elements_to_appear_on_page(self):
        self.static_wait()
        #self._selenium.switch_to_default_content()
        self.wait_for_element_visible(by=By.CSS_SELECTOR, value=PasswordEditPageLocators.current_password_input)
        self.wait_for_element_visible(by=By.CSS_SELECTOR, value=PasswordEditPageLocators.new_password_input)
        self.wait_for_element_visible(by=By.CSS_SELECTOR, value=PasswordEditPageLocators.confirm_new_password_input)

    def check_all_input_fields_are_editable(self):
        #self._selenium.switch_to_default_content()
        assert 'disabled' not in (self._current_password_input.get_attribute("class"))
        assert 'disabled' not in (self._new_password_input.get_attribute("class"))
        assert 'disabled' not in (self._confirm_new_password_input.get_attribute("class"))

    def switch_focus_to_new_pass_field(self):
        #self._selenium.switch_to_default_content()
        self._new_password_input.click()

    def switch_focus_to_confirm_pass_field(self):
        #self._selenium.switch_to_default_content()
        self._confirm_new_password_input.click()

    def switch_focus_to_current_pass_field(self):
        #self._selenium.switch_to_default_content()
        self._current_password_input.click()

    def switch_focus_out_of_new_pass_field(self):
        #self._selenium.switch_to_default_content()
        self._new_password_input.send_keys(Keys.TAB)

    def switch_focus_out_of_confirm_pass_field(self):
        #self._selenium.switch_to_default_content()
        self._confirm_new_password_input.send_keys(Keys.TAB)

    def switch_focus_out_of_current_pass_field(self):
        #self._selenium.switch_to_default_content()
        self._current_password_input.send_keys(Keys.TAB)

    def new_password_validate_error_message(self, text):
        self.static_wait()
        #self._selenium.switch_to_default_content()
        print("Validation messages:")
        print(self._new_password_validation_message.text)
        assert_that(self._new_password_validation_message.text).is_equal_to(text)

    def confirm_password_validate_error_message(self, text):
        self.static_wait()
        #self._selenium.switch_to_default_content()
        print("Validation messages:")
        print(self._confirm_password_validation_message.text)
        assert_that(self._confirm_password_validation_message.text).is_equal_to(text)

    def current_password_validate_error_message(self, text):
        self.static_wait()
        #self._selenium.switch_to_default_content()
        print("Validation messages:")
        print(self._current_password_validation_message.text)
        # different locators for validation message when input is empty VS input is incorrect
        if len(self._current_password_validation_message.text):
            assert_that(self._current_password_validation_message.text).is_equal_to(text)
        else:
            validation_msg = self._selenium.find_element_by_css_selector(
                PasswordEditPageLocators.current_password_validation_message_after_submission)
            assert_that(validation_msg.text).is_equal_to(text)

    def save_changes_check_disabled(self):
        #self._selenium.switch_to_default_content()
        self.wait_for_element_visible(by=By.CSS_SELECTOR, value=PasswordEditPageLocators.save_changes_button_disabled)

    def save_changes_passwordcheck_disabled(self):
        #self._selenium.switch_to_default_content()
        try :
            self.wait_for_element_visible(by=By.CSS_SELECTOR, value=PasswordEditPageLocators.save_changes_passwordbutton_disabled)
        except TimeoutException:
            self.wait_for_element_visible(by=By.CSS_SELECTOR,
                                          value=PasswordEditPageLocators.save_changes_passwordbutton1_disabled)
    def save_changes_professionalcheck_disabled(self):
        #self._selenium.switch_to_default_content()
        try :
            self.wait_for_element_visible(by=By.CSS_SELECTOR, value=PasswordEditPageLocators.save_changes_professionalbutton_disabled)
        except TimeoutException:
            self.wait_for_element_visible(by=By.CSS_SELECTOR,
                                          value=PasswordEditPageLocators.save_changes_professionalbutton_disabled)

    def save_changes_passwordcheck_enabled(self):
        #self._selenium.switch_to_default_content()
        try:
            self.wait_for_element_visible(by=By.CSS_SELECTOR,
                                          value=PasswordEditPageLocators.save_changes_passwordbutton_enabled)
        except TimeoutException:
            self.wait_for_element_visible(by=By.CSS_SELECTOR,
                                          value=PasswordEditPageLocators.save_changes_passwordbutton1_enabled)

    def save_changes_check_enabled(self):
        #self._selenium.switch_to_default_content()
        self.wait_for_element_visible(by=By.XPATH, value=PasswordEditPageLocators.save_changes_button_enabled)

    def fill_in_current_password(self, password):
        #self._selenium.switch_to_default_content()
        self._current_password_input.send_keys(password)

    def fill_in_new_password(self, password):
        #self._selenium.switch_to_default_content()
        self._new_password_input.send_keys(password)

    def fill_in_confirm_password(self, password):
        #self._selenium.switch_to_default_content()
        self._confirm_new_password_input.send_keys(password)

    def save_changes_button_click(self):
        #self._selenium.switch_to_default_content()
        self._save_changes_button_enabled.click()
        self.static_wait()

    def save_changes_professional_click(self):
        #self._selenium.switch_to_default_content()
        self._selenium.find_element(By.CSS_SELECTOR,
                                    value=PasswordEditPageLocators.save_changes_professionalbutton_enabled).click()
        self.static_wait()

    def save_changes_preferences_click(self):
        #self._selenium.switch_to_default_content()
        self._selenium.find_element(By.CSS_SELECTOR,
                                    value=PasswordEditPageLocators.save_changes_preferencesbutton_enabled).click()
        self.static_wait(5)
    def save_changes_passwordcheck_click(self):
        #self._selenium.switch_to_default_content()
        try :
            cs = self._selenium.find_element(By.CSS_SELECTOR,
                                        value=PasswordEditPageLocators.save_changes_passwordbutton_enabled)
            cs.click()
        except NoSuchElementException:
            cs = self._selenium.find_element(by=By.CSS_SELECTOR,
                                          value=PasswordEditPageLocators.save_changes_passwordbutton1_enabled)
            cs.click()

    def check_for_validation_under_password_input(self, message):
        #self._selenium.switch_to_default_content()
        print("message: " + message)
        validation_message_locator_xpath = "//*[@id=\"grv_edit_profile_changePassword_form_item_nextgenNewPassword\"]/div[1]/div/span[contains(text(),'"+ message +"')]"
        validation_message = self._selenium.find_element_by_xpath(validation_message_locator_xpath)
        assert validation_message.is_displayed()
        color = validation_message.value_of_css_property("color")
        print("rgba color: " + Color.from_string(color).rgba)
        print("hex color: " + Color.from_string(color).hex)
        assert Color.from_string(color).hex == ("%s" % RED_COLOR)

    def check_for_validation_under_password_input_blue_color(self, message):
        #self._selenium.switch_to_default_content()
        print("message: " + message)
        #"//*[@id=\"grv_edit_profile_changePassword_form_item_nextgenNewPassword\"]/div[1]/div[contains(text(),'"+ message +"')]"
        #validation_message_locator_xpath = "//ul[@id=\"password-indicator\"]/li[contains(text(),'" + message + "')]"
        validation_message_locator_xpath = "//*[@id=\"grv_edit_profile_changePassword_form_item_nextgenNewPassword\"]/div[1]/div/span[contains(text(),'"+ message +"')]"
        validation_message = self._selenium.find_element_by_xpath(validation_message_locator_xpath)
        assert validation_message.is_displayed()
        color = validation_message.value_of_css_property("color")
        print("rgba color: " + Color.from_string(color).rgba)
        print("hex color: " + Color.from_string(color).hex)
        assert Color.from_string(color).hex == ("%s" % NAVYBLUE_COLOR)
