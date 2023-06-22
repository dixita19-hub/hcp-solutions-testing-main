from time import sleep
import pytest
from assertpy import assert_that

from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

from frontend.grv_project.page_objects.base_page import BasePage
from frontend.grv_project.page_objects.locators import LoginPageLocators
from frontend.grv_project.page_objects.locators import ForgotPasswordPageLocators


class ForgotPasswordPage(BasePage):
    def __init__(self, selenium, base_url, page_name='ForgotPasswordPage'):
        super().__init__(selenium, base_url)
        self._page_name = page_name
        self._page_url = ''

    def open(self, **kwargs):
        self._selenium.get('%s%s' % (self._base_url, self._page_url))

    @property
    def _is_on_forgot_password_form(self):
        return self._selenium.find_element(By.XPATH, value=ForgotPasswordPageLocators.forgot_password_title)

    @property
    def _sign_in_form_displayed(self):
        return self._selenium.find_element(By.XPATH, value=LoginPageLocators.sign_in_form_displayed)

    @property
    def _close_button(self):
        return self._selenium.find_element(By.XPATH, value=LoginPageLocators.close_button)

    @property
    def _email_input_field(self):
        print(LoginPageLocators.email_field)
        return self._selenium.find_element(By.XPATH, value=LoginPageLocators.email_field)

    @property
    def _password_input_field(self):
        print(LoginPageLocators.password_field)
        return self._selenium.find_element(By.XPATH, value=LoginPageLocators.password_field)

    @property
    def _password_mask_button(self):
        print(LoginPageLocators.password_mask_button)
        return self._selenium.find_element(by=By.XPATH, value=LoginPageLocators.password_mask_button)

    @property
    def _registration_button(self):
        return self._selenium.find_element(By.XPATH, value=LoginPageLocators.register_button)

    @property
    def _log_in_button(self):
        return self._selenium.find_element(By.XPATH, value=LoginPageLocators.log_in_button)

    @property
    def _login_button_state_enabled(self):
        return self._selenium.find_element(by=By.XPATH, value=LoginPageLocators.login_button_enabled)

    @property
    def _login_button_state_disabled(self):
        return self._selenium.find_element(by=By.XPATH, value=LoginPageLocators.login_button_disabled)

    @property
    def _form_sign_in(self):
        return self._selenium.find_element(by=By.XPATH, value=LoginPageLocators.sign_in_form)

    @property
    def _validation_message_elem(self):
        return self._selenium.find_element(by=By.XPATH, value=LoginPageLocators.validation_message_elem)

    @property
    def _forgot_password_button(self):
        return self._selenium.find_element(by=By.XPATH, value=LoginPageLocators.forgot_password_button)

    @property
    def _forgot_password_input(self):
        return self._selenium.find_element(by=By.XPATH, value=ForgotPasswordPageLocators.registered_email_address_input)

    @property
    def _password_sent_notification(self):
        return self._selenium.find_element(by=By.XPATH,
                                           value=ForgotPasswordPageLocators.request_new_password_email_sent_notification)

    @property
    def _email_validation_message(self):
        return self._selenium.find_element(by=By.CSS_SELECTOR,
                                           value=ForgotPasswordPageLocators.request_new_password_validation_message)

    def validate_login_button_disabled(self, button):
        print(self._login_button_state_disabled.get_attribute("class"))
        self._login_button_state_disabled
        # .get_attribute("class")).contains('button-disabled')

    def validate_login_button_enabled(self, button):
        self._login_button_state_enabled
        # assert not (self._login_button_state(button).get_attribute("class")).contains('button-disabled')

    def click_login_button(self):
        self.static_wait()
        #self._selenium.switch_to_default_content()
        # self.wait_for_element_visible(by=By.XPATH, value=LoginPageLocators.log_in_button)
        print(self._log_in_button.text)
        self._log_in_button.click()
        sleep(4)

    def start_registration(self):
        #self._selenium.switch_to_default_content()
        # self.wait_for_element_visible(By.XPATH, "//button[text()=\"Register\"]")
        self.wait_for_element_visible(By.XPATH, "//a[@data-render-screen=\"traditionalRegistration\"]")
        self._registration_button.click()
        sleep(5)

    def is_on_login_form(self):
        #self._selenium.switch_to_default_content()
        self._sign_in_form_displayed
        self._sign_in_form_displayed.get_attribute('style') == "display: block;"

    def click_close_button(self):
        #self._selenium.switch_to_default_content()
        self.wait_for_child_element_visible(by=By.XPATH, value=LoginPageLocators.close_button)
        self._close_button().click()

    def click_forgot_password_button(self):
        #self._selenium.switch_to_default_content()
        self.wait_for_child_element_visible(by=By.XPATH, value=LoginPageLocators.forgot_password_button)
        self._forgot_password_button().click()

    def click_password_mask_button(self):
        #self._selenium.switch_to_default_content()
        self.wait_for_element_visible(by=By.XPATH, value=LoginPageLocators.password_mask_button)
        self._password_mask_button().click()

    def fill_login_form(self, user):
        #self._selenium.switch_to_default_content()
        print(user['EMAIL'])
        print(user['PASSWORD'])
        # self.__email_input_field().clear()
        self._email_input_field.send_keys(user['EMAIL'])
        # self.__password_input_field().clear()
        self._password_input_field.send_keys(user['PASSWORD'])

    def toggle_password_mask(self, state):
        print(state)
        print(self._password_mask_button.get_attribute('style'))
        mask_state = True if self._password_mask_button.get_attribute('style') == "fill: rgb(53, 56, 63);" else \
            False if self._password_mask_button.get_attribute('style') == "fill: rgb(174, 175, 178);" else \
                None
        if state != mask_state:
            print("I am here and about to click the mask button to unmask")
            sleep(3)
            self._password_mask_button.click()
            sleep(3)

    def get_text_from_text_field(self, field_name):
        if field_name == "PASSWORD":
            # print(self._password_input_field.text())
            return self._password_input_field.get_attribute("type")

    def validate_login_error_message(self, text):
        # self.wait_for_element_visible(by=By.XPATH, value=LoginPageLocators.validation_message_elem)
        #self._selenium.switch_to_default_content()
        self.static_wait()
        print("Validation messages:")
        print(self._validation_message_elem.text())
        assert_that(self._validation_message_elem.text()).is_equal_to(text)

    def check_on_forgot_password_form(self):
        #self._selenium.switch_to_default_content()
        self.wait_for_element_visible(by=By.XPATH, value=ForgotPasswordPageLocators.forgot_password_title)
        self.wait_for_element_visible(by=By.XPATH, value=ForgotPasswordPageLocators.request_new_password_h1)
        self.wait_for_element_visible(by=By.XPATH, value=ForgotPasswordPageLocators.registered_email_address_input)

    def enter_email_in_forgot_password(self, email):
       # self._selenium.switch_to_default_content()
        self.wait_for_element_clickable(by=By.XPATH, value=ForgotPasswordPageLocators.registered_email_address_input)
        self._forgot_password_input.send_keys(email)
        self._forgot_password_input.send_keys(Keys.TAB)

    def request_new_pass_button_enable(self):
        #self._selenium.switch_to_default_content()
        self.wait_for_element_visible(by=By.XPATH, value=ForgotPasswordPageLocators.request_new_password_button_enabled)

    def request_new_pass_button_disabled(self):
        #self._selenium.switch_to_default_content()
        self.wait_for_element_visible(by=By.XPATH,
                                      value=ForgotPasswordPageLocators.request_new_password_button_disabled)

    def request_new_pass_button_click(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        element = self._selenium.find_element_by_xpath(ForgotPasswordPageLocators.request_new_password_button_enabled)
        element.click()

    def check_password_sent_notification(self, expected):
        #self._selenium.switch_to_default_content()
        self.wait_for_element_visible(by=By.XPATH, value=ForgotPasswordPageLocators.forgot_password_title)
        self.wait_for_element_visible(by=By.XPATH,
                                      value=ForgotPasswordPageLocators.request_new_password_email_sent_notification)
        assert_that(self._password_sent_notification.text).contains(expected)

    def check_for_email_not_valid_error(self):
        #self._selenium.switch_to_default_content()
        self.wait_for_element_visible(by=By.CSS_SELECTOR,
                                      value=ForgotPasswordPageLocators.request_new_password_validation_message)
        messages = pytest.globalDict['i18n']['ERROR_MESSAGE']

        assert_that(self._email_validation_message.text).is_equal_to(
            messages["EMAIL_NOT_VALID_ERROR"])

    def validate_generic_error_message(self, text):
        self.static_wait()
        #self._selenium.switch_to_default_content()
        print("Validation messages:")
        print(self._email_validation_message.text)
        assert_that(self._email_validation_message.text).is_equal_to(text)
