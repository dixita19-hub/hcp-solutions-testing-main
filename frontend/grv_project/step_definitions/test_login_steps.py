import time

import pytest
from pytest_bdd import parsers, scenarios, given, then, when
from frontend.grv_project.step_definitions.test_landing_anonymous import *
from frontend.grv_project.step_definitions.test_step_two_registration import *
from frontend.grv_project.step_definitions.test_step_three_registration import *
from frontend.grv_project.page_objects.forgot_password_page import ForgotPasswordPage
from frontend.grv_project.page_objects.landing_page import LandingPage
from frontend.grv_project.page_objects.locators import RegistrationPageLocators, LoginPageLocators
from frontend.grv_project.page_objects.registration_page import RegistrationPage
from frontend.grv_project.page_objects.login_page import LoginPage
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver import ActionChains
from selenium.webdriver.common.keys import Keys
from frontend.grv_project.step_definitions.test_assertions import *

import os
PROJECT_DIR = os.getcwd()
scenarios(os.path.join(PROJECT_DIR, "./frontend/grv_project/features/login_updated/login.feature"))
scenarios(os.path.join(PROJECT_DIR, "./frontend/grv_project/features/demo/testing.feature"))
scenarios(os.path.join(PROJECT_DIR, "./frontend/grv_project/features/demo/testing2.feature"))
scenarios(os.path.join(PROJECT_DIR, "./frontend/grv_project/features/login_updated/login_reg.feature"))


@when(parsers.re('I am on the "(?P<key>[a-zA-Z0-9-?_]+)" Form'))
@then(parsers.re('I am on the "(?P<key>[a-zA-Z0-9-?_]+)" Form'))
def i_on_on_a_login_form(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.is_element_visible(LoginPageLocators.sign_in_form_displayed)


@when('I click on the "PASSWORD_TOGGLE" button in the password field')
def click_password_toggle_button(selenium, base_url, variables):
    LoginPage(selenium, base_url, variables).click_password_mask_button()


@then(parsers.re('I click on "(?P<key>(continue|FORGOT_PASSWORD))" button'), converters=dict(key=str))
@when(parsers.re('I click on "(?P<key>(continue|FORGOT_PASSWORD))" button'), converters=dict(key=str))
def when_click_button(selenium, base_url, variables, key):
    print("I am in forgot password step")
    if key == 'FORGOT_PASSWORD':
        LoginPage(selenium, base_url, variables).click_forgot_password_button()


@when(parsers.re('User sets field value "(?P<key1>(PASSWORD|CONFIRM_PASSWORD))" as "(?P<key2>(VISIBLE|MASKED))"'),
      converters=dict(key1=str, key2=str))
def unmask_password(selenium, base_url, variables, key1, key2):
    state = True if key2 == 'MASKED' else False if key2 == 'VISIBLE' else None
    print(state)
    if key1 == 'PASSWORD':
        LoginPage(selenium, base_url, variables).toggle_password_mask(state)


@then(parsers.re(
    'I should be able to see the "(?P<key1>(PASSWORD))" entered in the "(?P<key2>(PASSWORD))" field for "(?P<user_type>[a-zA-Z0-9_<a-zA-Z0-9>]+)"'),
    converters=dict(user_type=str))
def validate_field_for_text_values(selenium, base_url, variables, key1, key2, user_type):
    if key1 == "PASSWORD":
        password_text_value = LoginPage(selenium, base_url, variables).get_text_from_text_field(key2)
        print(password_text_value)
        # users = pytest.globalDict['test_data']['users']
        # print('password: users[user_type]["PASSWORD"]')
        # expected_password = (users[user_type]["PASSWORD"])
        password_text_value == "text"


# Then I have entered the "VALID_EMAIL" in the "Email" field
#
# @then(parsers.re('I have filled the "(?P<key>(EMAIL))" field'), converters=dict(key=str))
# def fill_login_fields(selenium, base_url, variabless, key):
#     new_name = DataUtils.get_random_name(key)
#     if key == 'FIRST_NAME':
#         StandardRegistrationUserNamePage(selenium).fill_first_name(new_name)
#     if key == 'LAST_NAME':
#         StandardRegistrationUserNamePage(selenium).fill_last_name(new_name)
#     pytest.globalDict['test_data']['user'] = pytest.globalDict['test_data'].get('user', {})
#     pytest.globalDict['test_data']['user'][key] = new_name

@when(parsers.re('User fills login form with "(?P<user_type>[a-zA-Z0-9_<a-zA-Z0-9>]+)"'),
      converters=dict(user_type=str))
@then(parsers.re('User fills login form with "(?P<user_type>[a-zA-Z0-9_<a-zA-Z0-9>]+)"'),
      converters=dict(user_type=str))
def fill_login_form(selenium, base_url, variables, user_type):
    users = pytest.globalDict['test_data']['users']
    LoginPage(selenium, base_url, variables).fill_login_form(users[user_type])
    selenium.find_element(By.XPATH,
                          '//i[@data-field="nextgenPassword"]').click()


@then(parsers.re('"(?P<btn>[a-zA-Z0-9_]+)" button shall be "(?P<key>(DISABLED|ENABLED))"'),
      converters=dict(key=str))
def validate_save_button(selenium, base_url, variables, btn, key):
    button = pytest.globalDict['i18n']['BUTTON'][btn]
    print(button)
    if key == "DISABLED":
        LoginPage(selenium, base_url, variables).validate_login_button_disabled(button)
    if key == "ENABLED":
        LoginPage(selenium, base_url, variables).validate_login_button_enabled(button)


# @given('I am an anonymous user')
# def authorize_anonymous_user(selenium, base_url, variables):
#     base_url = pytest.globalDict['i18n']['URL']
#     LandingPage(selenium, base_url, variables).open()
#     time.sleep(15)
#     try :
#         selenium.find_element(By.XPATH,
#                                 '//button[@id="_evidon-banner-acceptbutton"]').click()
#         time.sleep(5)
#         try :
#             selenium.find_element(By.XPATH,
#                                   '//*[@id="ituw"]/helix-core-heading').click()
#
#             ActionChains(selenium).send_keys(Keys.PAGE_DOWN).perform()
#             time.sleep(2)
#             selenium.find_element(By.XPATH,
#                                   '//helix-core-button[@id="imfgj" or @id="i6gui"]').click()
#         except NoSuchElementException:
#             time.sleep(2)
#     except NoSuchElementException :
#         selenium.find_element(By.XPATH,
#                               '//helix-core-button[@id="imfgj"]').click()
#     time.sleep(5)
#     LandingPage(selenium, base_url, variables).click_pfizer_logo()
#     time.sleep(5)
#     #users = pytest.globalDict['test_data']['users']
#     #LandingPage(selenium, base_url, variables).fill_in_credentials(users["ROOT_USER"])
#     #LandingPage(selenium, base_url, variables).submit()
#     #LandingPage(selenium, base_url, variables).click_sign_in()


@given('I am picked up a "GRV_Registered" user')
@when('I am picked up a "GRV_Registered" user')
def prepare_GRV_registered_user(selenium, base_url, variables):
    users = pytest.globalDict['test_data']['users']
    LoginPage(selenium, base_url, variables).prepare_GRV_user(users["REGISTERED_USER_NOT_VERIFIED_EMAIL"])


@then('User clicks "Log in" button on the Login page')
@when('User clicks "Log in" button on the Login page')
def do_login(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.click(LoginPageLocators.log_in_button)
    #LoginPage(selenium, base_url, variables).click_login_button()


@when('User clicks on "Log in" button')
def do_login(selenium, base_url, variables):
    LoginPage(selenium, base_url, variables).click_on_login_button()


@when('User should be able to login successfully')
@then('User should be able to login successfully')
def check_logged_in(selenium, base_url, variables):
    LoginPage(selenium, base_url, variables).validate_logged_in()


@when(parsers.re('User should be able to login successfully on "(?P<key>[a-zA-Z0-9-?_]+)"'))
@then(parsers.re('User should be able to login successfully on "(?P<key>[a-zA-Z0-9-?_]+)"'))
def check_logged_in_uk_stg(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.is_element_visible(LoginPageLocators.sign_out_btn_uk_stg)


@then('I should see the "LOGIN" button is "DISABLED"')
def login_button_status(selenium, base_url, variables):
    LoginPage(selenium, base_url, variables).button_status()


@then(parsers.re('User shall see "(?P<key>[a-zA-Z0-9_]+)" error message'), converters=dict(key=str))
def invalid_credentials_validation(selenium, base_url, variables, key):
    # if key == "INVALID_CREDENTIALS":
    #     invalid_credentials_message = pytest.globalDict['i18n']['ERROR_MESSAGE'][key]
    #     LoginPage(selenium, base_url, variables).validate_login_error_message(invalid_credentials_message)
    if key == "INVALID_CREDENTIALS" or key == "TOO_MANY_FAILED_LOGIN_ATTEMPTS":
        invalid_credentials_message = pytest.globalDict['i18n']['ERROR_MESSAGE'][key]
        LoginPage(selenium, base_url, variables).validate_generic_error_message(invalid_credentials_message)
    elif key == "PASSWORD_REQUIRED" :
        invalid_credentials_message = pytest.globalDict['i18n']['ERROR_MESSAGE'][key]
        LoginPage(selenium, base_url, variables).validate_no_password_error_message(invalid_credentials_message)
    else:
        raise NameError(
            'neither "INVALID_CREDENTIALS" nor "PASSWORD_REQUIRED" nor "TOO_MANY_FAILED_LOGIN_ATTEMPTS" been passed as an argument')
    # if key == "PASSWORD_REQUIRED":
    #     invalid_credentials_message = pytest.globalDict['i18n']['ERROR_MESSAGE'][key]
    #     LoginPage(selenium, base_url, variables).validate_no_password_error_message(invalid_credentials_message)


@then('I should see an error "PASSWORD_REQUIRED" below the "Password" field')
def analyze_email_error(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).check_email_validation_message()


# @then('I Enter a space as the first character in the "First_Name" field')
# def fill_space_in_name_input(selenium, base_url, variables):
#     RegistrationPage(selenium, base_url, variables).enter_string_name_input(" ")

@when('I enter the "SOME_PASSWORD" in the "password" field')
@then('I enter the "SOME_PASSWORD" in the "password" field')
def enter_password(selenium, base_url, variables):
    users = pytest.globalDict['test_data']['users']
    LoginPage(selenium, base_url, variables).fill_password_field("%s" % users["VALID_USER_DETAILS"]["PASSWORD"])
    selenium.find_element(By.XPATH,
                          '//h1[@class="heading-block__title"]').click()


@then('I enter the "INVALID_PASSWORD" in the "password" field')
def enter_invalid_password(selenium, base_url, variables):
    users = pytest.globalDict['test_data']['users']
    LoginPage(selenium, base_url, variables).fill_password_field("%s" % users["INVALID_PASSWORD_USER"]["PASSWORD"])
    selenium.find_element(By.XPATH,
                          '//h1[@class="heading-block__title"]').click()



@then('I enter "SOME_PASSWORD" and click on the "LOGIN" button an additional 6 times within 20 mins')
def click_login_iterative(selenium, base_url, variables):
    users = pytest.globalDict['test_data']['users']
    LoginPage(selenium, base_url, variables).some_password_and_click_login_six_times(
        "%s" % users["VALID_USER_DETAILS"]["PASSWORD"])
    selenium.find_element(By.XPATH,
                          '//h1[@class="heading-block__title"]').click()


@then('I enter "INVALID_PASSWORD" and click on the "LOGIN" button an additional 6 times within 20 mins')
def invalid_password_click_login_iterative(selenium, base_url, variables):
    users = pytest.globalDict['test_data']['users']
    LoginPage(selenium, base_url, variables).some_password_and_click_login_six_times(
        "%s" % users["INVALID_PASSWORD_USER"]["PASSWORD"])



@then('I click on "Forgot_Password" link')
def forgot_password_click(selenium, base_url, variables):
    LoginPage(selenium, base_url, variables).click_forgot_password()


@then('I am on "Forgot_Password" Form')
def check_on_forgot_password_form(selenium, base_url, variables):
    ForgotPasswordPage(selenium, base_url, variables).check_on_forgot_password_form()


@when('I enter an "Valid_Registered_Email" in "Email" field as per the regex')
def enter_email_in_forgot_password(selenium, base_url, variables):
    users = pytest.globalDict['test_data']['users']
    ForgotPasswordPage(selenium, base_url, variables).enter_email_in_forgot_password(
        users["OBSOLETE_VALID_USER_DETAILS"]["EMAIL"])


@then('I should see that "Request_New_Password" Button is enabled')
def request_new_pass_button_enabled(selenium, base_url, variables):
    ForgotPasswordPage(selenium, base_url, variables).request_new_pass_button_enable()


@when('I click on "Request_New_Password" Button')
def click_request_new_password_button(selenium, base_url, variables):
    ForgotPasswordPage(selenium, base_url, variables).request_new_pass_button_click()


@then(parsers.re(
    'I should be navigated to the "Successful_Password_Request" page which display "(?P<notification_type>[a-zA-Z0-9_<a-zA-Z0-9>]+)"'),
    converters=dict(user_type=str))
def check_forgot_password_notifications(selenium, base_url, variables, notification_type):
    messages = pytest.globalDict['i18n']['FORGOT_PASSWORD_MESSAGE']
    ForgotPasswordPage(selenium, base_url, variables).check_password_sent_notification(messages[notification_type])


@when('I click on "Close" Button')
def click_close_button(selenium, base_url, variables):
    LoginPage(selenium, base_url, variables).close_button_click()


@then('I should be on the Base webpage')
def check_base_webpage_title(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.is_element_visible(RegistrationPageLocators.pfizer_logo)
    #RegistrationPage(selenium, base_url, variables).check_base_webpage_title()


@then('I should be on the "Thank_you_for_registering_with_pfizer" screen')
def check_thank_you_for_registering_page(selenium, base_url, variables):
    messages = pytest.globalDict['i18n']['THANK_YOU_FOR_REGISTRATION_MESSAGE']
    users = pytest.globalDict['test_data']['users']
    LoginPage(selenium, base_url, variables).check_for_thankyou_for_registering_message(
        messages["THANK_YOU_FOR_REGISTERING_SUBHEADER_MESSAGE"] % users["REGISTERED_USER_NOT_VERIFIED_EMAIL"]["EMAIL"])


#@then('I enter an /'<email>'/ in Email field not as per the regex')
@then(parsers.re("I enter an '(?P<email>.*)' in Email field not as per the regex"), converters=dict(email=str))
def fill_in_email_input_not_per_the_regex(selenium, base_url, variables, email):
    LoginPage(selenium, base_url, variables).fill_email_field(email)


@then('I should see an error "EMAIL_NOT_VALID_ERROR" below the "Email" field')
def check_email_not_valid_message(selenium, base_url, variables):
    LoginPage(selenium, base_url, variables).check_for_email_not_valid_error()
