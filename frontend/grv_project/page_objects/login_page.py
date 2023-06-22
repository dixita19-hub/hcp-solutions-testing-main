from time import sleep
import pytest
from assertpy import assert_that

from selenium.webdriver.common.by import By

from frontend.grv_project.page_objects.base_page import BasePage
from frontend.grv_project.page_objects.locators import LoginPageLocators, HomePageLocators, ForgotPasswordPageLocators, \
    ThankYouForRegistrationPageLocators
from selenium.common.exceptions import NoSuchElementException
SIX_TIMES = 7


class LoginPage(BasePage):
    def __init__(self, selenium, base_url,  page_name='LoginPage'):
        super().__init__(selenium, base_url)
        self._page_name = page_name
        self._page_url = ''

    def open(self, **kwargs):
        self._selenium.get('%s%s' % (self._base_url, self._page_url))

    @property
    def _is_on_login_form(self):
        element = self._selenium.find_element(By.XPATH, value=LoginPageLocators.register_button)
        #self.scroll_into_view(element)
        return element

    @property
    def _sign_in_form_displayed(self):
        element = self._selenium.find_element(By.XPATH, value=LoginPageLocators.sign_in_form_displayed)
        #self.scroll_into_view(element)
        return element

    @property
    def _close_button(self):
        element = self._selenium.find_element(By.XPATH, value=LoginPageLocators.close_button)
        #self.scroll_into_view(element)
        return element

    @property
    def _email_input_field(self):
        print(LoginPageLocators.email_field)
        element = self._selenium.find_element(By.XPATH, value=LoginPageLocators.email_field)
        #self.scroll_into_view(element)
        return element

    @property
    def _password_input_field(self):
        print(LoginPageLocators.password_field)
        element = self._selenium.find_element(By.XPATH, value=LoginPageLocators.password_field)
        #self.scroll_into_view(element)
        return element

    @property
    def _password_mask_button(self):
        print(LoginPageLocators.password_mask_button)
        element = self._selenium.find_element(by=By.XPATH, value=LoginPageLocators.password_mask_button)
        #self.scroll_into_view(element)
        return element

    @property
    def _registration_button(self):
        element =  self._selenium.find_element(By.XPATH, value=LoginPageLocators.register_button)
        #self.scroll_into_view(element)
        return element

    @property
    def _log_in_button(self):
        element = self._selenium.find_element(By.XPATH, value=LoginPageLocators.log_in_button)
        #self.scroll_into_view(element)
        return element

    @property
    def _login_button_state_enabled(self):
        element = self._selenium.find_element(by=By.XPATH, value=LoginPageLocators.login_button_enabled)
        #self.scroll_into_view(element)
        return element

    @property
    def _login_button_state_disabled(self):
        element = self._selenium.find_element(by=By.XPATH, value=LoginPageLocators.login_button_disabled)
        #self.scroll_into_view(element)
        return element

    @property
    def _form_sign_in(self):
        element = self._selenium.find_element(by=By.XPATH, value=LoginPageLocators.sign_in_form)
        #self.scroll_into_view(element)
        return element

    @property
    def _validation_message_elem(self):
        element = self._selenium.find_element(by=By.XPATH, value=LoginPageLocators.validation_message_elem)
        #self.scroll_into_view(element)
        return element

    @property
    def _generic_validation_message_both(self):
        try :
            element = self._selenium.find_element(by=By.CSS_SELECTOR,
                                           value=LoginPageLocators.generic_validation_message_both_inputs)
            #self.scroll_into_view(element)
            return element
        except NoSuchElementException:
            element = self._selenium.find_element(by=By.CSS_SELECTOR,
                                               value=LoginPageLocators.validation_password_message_elem)
            #self.scroll_into_view(element)
            return element


    @property
    def _validation_password_message_elem(self):
        element = self._selenium.find_element(by=By.CSS_SELECTOR, value=LoginPageLocators.validation_password_message_elem)
        #self.scroll_into_view(element)
        return element

    @property
    def _forgot_password_button(self):
        element = self._selenium.find_element(by=By.XPATH, value=LoginPageLocators.forgot_password_button)
        #self.scroll_into_view(element)
        return element

    @property
    def _thank_for_registering_header(self):
        element = self._selenium.find_element(by=By.XPATH,
                                           value=ThankYouForRegistrationPageLocators.thank_you_for_registering_header)
        #self.scroll_into_view(element)
        return element

    @property
    def _thank_for_registering_subheader(self):
        element = self._selenium.find_element(by=By.XPATH,
                                           value=ThankYouForRegistrationPageLocators.thank_you_for_registration_main_subheader)
        #self.scroll_into_view(element)
        return element

    @property
    def _email_validation_message(self):
        element = self._selenium.find_element(by=By.XPATH,
                                           value=LoginPageLocators.email_input_validation_message)
        #self.scroll_into_view(element)
        return element

    def validate_login_button_disabled(self, button):
        print(self._login_button_state_disabled.get_attribute("class"))
        self._login_button_state_disabled
        # .get_attribute("class")).contains('button-disabled')

    def validate_login_button_enabled(self, button):
        self._login_button_state_enabled
        # assert not (self._login_button_state(button).get_attribute("class")).contains('button-disabled')

    def click_login_button(self):
        self.static_wait()
        # self._selenium.switch_to_default_content()
        print(self._log_in_button.text)
        self._log_in_button.click()
        sleep(5)
        # wait until navigation is done on home page after authorization
        self.wait_for_element_visible(By.XPATH, value=HomePageLocators.title_xpath)
        sleep(4)

    def click_on_login_button(self):
        self.static_wait()
        #self._selenium.switch_to_default_content()
        print(self._log_in_button.text)
        self._selenium.find_element(By.XPATH,
                              '//h1[@class="heading-block__title"]').click()
        self._log_in_button.click()
        sleep(4)

    def start_registration(self):
        #self._selenium.switch_to_default_content()
        sleep(2)
        self.wait_for_element_visible(By.XPATH, value=LoginPageLocators.register_button)
        self._registration_button.click()
        sleep(5)

    def is_on_login_form(self):
        #self._selenium.switch_to_default_content()
        self._sign_in_form_displayed
        print("I am on the Login Form")

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
            element = self._password_input_field.get_attribute("type")
            #self.scroll_into_view(element)
            return element

    def validate_login_error_message(self, text):
        # self.wait_for_element_visible(by=By.XPATH, value=LoginPageLocators.validation_message_elem)
        self.static_wait()
        #self._selenium.switch_to_default_content()
        print("Validation messages:")
        print(self._validation_message_elem.text)
        assert_that(self._validation_message_elem.text).is_equal_to(text)

    def validate_no_password_error_message(self, text):
        # self.wait_for_element_visible(by=By.XPATH, value=LoginPageLocators.validation_message_elem)
        self.static_wait()
        #self._selenium.switch_to_default_content()
        print("Validation messages:")
        print(self._validation_password_message_elem.text)
        assert_that(self._validation_password_message_elem.text).is_equal_to(text)

    def validate_generic_error_message(self, text):
        self.static_wait()
        #self._selenium.switch_to_default_content()
        print("Validation messages:")
        print(self._generic_validation_message_both.text)
        assert_that(self._generic_validation_message_both.text).is_equal_to(text)

    def validate_logged_in(self):
        self.static_wait()
        #self._selenium.switch_to_default_content()
        sleep(2)
        self.wait_for_element_visible(By.XPATH, value=HomePageLocators.title_xpath)
        self.wait_for_element_visible(By.XPATH, value=HomePageLocators.authorized_user_widget)

    def fill_email_field(self, email):
        #self._selenium.switch_to_default_content()
        self._email_input_field.clear()
        self._email_input_field.send_keys(email)

    def fill_password_field(self, password):
        #self._selenium.switch_to_default_content()
        self._password_input_field.clear()
        self._password_input_field.send_keys(password)

    def some_password_and_click_login_six_times(self, password):
        #self._selenium.switch_to_default_content()
        for x in range(SIX_TIMES):
            self.fill_password_field(password)

            self.click_on_login_button()
            print("clicked login  button %s times" % x)


    def click_forgot_password(self):
        #self._selenium.switch_to_default_content()
        self.wait_for_element_clickable(by=By.XPATH, value=LoginPageLocators.forgot_password_button)
        element = self._selenium.find_element_by_xpath(LoginPageLocators.forgot_password_button)
        element.click()

    def check_on_forgot_password_form(self):
        #self._selenium.switch_to_default_content()
        self.wait_for_element_visible(by=By.XPATH, value=ForgotPasswordPageLocators.forgot_password_title)
        self.wait_for_element_visible(by=By.XPATH, value=ForgotPasswordPageLocators.request_new_password_h1)
        self.wait_for_element_visible(by=By.XPATH, value=ForgotPasswordPageLocators.registered_email_address_input)

    def close_button_click(self):
       #self._selenium.switch_to_default_content()
        self.wait_for_element_clickable(by=By.XPATH, value=LoginPageLocators.close_button)
        self._close_button.click()

    def prepare_GRV_user(self, user):
        #self._selenium.switch_to_default_content()
        print(user['EMAIL'])
        print(user['PASSWORD'])

    def check_for_thankyou_for_registering_message(self, message):
        #self._selenium.switch_to_default_content()
        # checking for presence of header on ThankYou page and comparing it by text values
        self.wait_for_element_visible(by=By.XPATH,
                                      value=ThankYouForRegistrationPageLocators.thank_you_for_registering_header)
        messages = pytest.globalDict['i18n']['THANK_YOU_FOR_REGISTRATION_MESSAGE']
        assert_that(self._thank_for_registering_header.text).is_equal_to(
            messages["THANK_YOU_FOR_REGISTERING_HEADER_MESSAGE"])
        # checking for presence of sub-header on ThankYou page and comparing it by text values
        self.wait_for_element_visible(by=By.XPATH,
                                      value=ThankYouForRegistrationPageLocators.thank_you_for_registration_main_subheader)
        assert_that(self._thank_for_registering_subheader.text).is_equal_to(message)

    def check_for_email_not_valid_error(self):
       # self._selenium.switch_to_default_content()
        self.wait_for_element_visible(by=By.XPATH,
                                      value=LoginPageLocators.email_input_validation_message)
        messages = pytest.globalDict['i18n']['ERROR_MESSAGE']

        assert_that(self._email_validation_message.text).is_equal_to(
            messages["EMAIL_NOT_VALID_ERROR"])
