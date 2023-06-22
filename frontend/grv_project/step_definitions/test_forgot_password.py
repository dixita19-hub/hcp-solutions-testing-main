import time

import pytest
from pytest_bdd import parsers, scenarios, given, then, when
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver import ActionChains, Keys
from selenium.webdriver.common.by import By

from frontend.grv_project.page_objects.forgot_password_page import ForgotPasswordPage
from frontend.grv_project.page_objects.home_page import HomePage
from frontend.grv_project.page_objects.landing_page import LandingPage
from frontend.grv_project.page_objects.registration_page import RegistrationPage
from frontend.grv_project.page_objects.login_page import LoginPage

scenarios(
    '../features/forgot_password_updated/whole/request_new_password.feature',
    '../features/forgot_password_updated/wip/request_new_password.feature')


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
    # LandingPage(selenium, base_url, variables).open()
    # LandingPage(selenium, base_url, variables).click_pfizer_logo()
    # users = pytest.globalDict['test_data']['users']
    # LandingPage(selenium, base_url, variables).fill_in_credentials(users["ROOT_USER"])
    # LandingPage(selenium, base_url, variables).submit()
    # LandingPage(selenium, base_url, variables).click_sign_in()


@when(parsers.re('I am on the "(?P<key>[a-zA-Z0-9-?_]+)" Form'))
@then(parsers.re('I am on the "(?P<key>[a-zA-Z0-9-?_]+)" Form'))
def i_on_on_a_login_form(selenium, base_url, variables, key):
    LoginPage(selenium, base_url, variables).is_on_login_form()


@then('I click on "Forgot_Password" link')
def forgot_password_click(selenium, base_url, variables):
    LoginPage(selenium, base_url, variables).click_forgot_password()


@then('I am on "Forgot_Password" Form')
@when('I am on "Forgot_Password" Form')
def check_on_forgot_password_form(selenium, base_url, variables):
    ForgotPasswordPage(selenium, base_url, variables).check_on_forgot_password_form()



@then('I should see that "Request_New_Password" Button is enabled')
def request_new_pass_button_enabled(selenium, base_url, variables):
    ForgotPasswordPage(selenium, base_url, variables).request_new_pass_button_enable()


@then('I should see that "Request_New_Password" Button is disabled')
def check_button_disabled(selenium, base_url, variables):
    ForgotPasswordPage(selenium, base_url, variables).request_new_pass_button_disabled()


@then('I enter an <email> in "Email" field not as per the regex')
@when('I enter an <email> in "Email" field not as per the regex')
@then(parsers.re("I enter an '(?P<email>.*)' in Email field not as per the regex"), converters=dict(email=str))
@when(parsers.re("I enter an '(?P<email>.*)' in Email field not as per the regex"), converters=dict(email=str))
@when('I enter an <email> in "Email" field as per the regex')
@then('I enter an <email> in "Email" field as per the regex')
@when(parsers.re("I enter an '(?P<email>.*)' in Email field as per the regex"), converters=dict(email=str))
@then(parsers.re("I enter an '(?P<email>.*)' in Email field as per the regex"), converters=dict(email=str))
def fill_in_email_input_not_per_the_regex(selenium, base_url, variables, email):
    ForgotPasswordPage(selenium, base_url, variables).enter_email_in_forgot_password(email)
    selenium.find_element(By.XPATH,
                          '//*[@id="forgotPassword"]/div/div/div/div/div/h1').click()


@when(parsers.re("I enter an '(?P<user_type>[a-zA-Z0-9_<a-zA-Z0-9>]+)' in the Email field as per the regex"),
      converters=dict(user_type=str))
@then(parsers.re("I enter an '(?P<user_type>[a-zA-Z0-9_<a-zA-Z0-9>]+)' in the Email field as per the regex"),
      converters=dict(user_type=str))
def fill_in_forgot_password_emailinput(selenium, base_url, variables, user_type):
    users = pytest.globalDict['test_data']['users']
    ForgotPasswordPage(selenium, base_url, variables).enter_email_in_forgot_password(users[user_type]["EMAIL"])


@then('I should see an error "EMAIL_NOT_VALID_ERROR" below the "Email" field')
def check_email_not_valid_message(selenium, base_url, variables):
    ForgotPasswordPage(selenium, base_url, variables).check_for_email_not_valid_error()


@when('I click on "Request_New_Password" Button')
def click_request_new_password_button(selenium, base_url, variables):
    ForgotPasswordPage(selenium, base_url, variables).request_new_pass_button_click()


@then(parsers.re('I should see an error "(?P<key>[a-zA-Z0-9_]+)" below the "Email" field'), converters=dict(key=str))
def check_for_validation_msg(selenium, base_url, variables, key):
    if key == "NO_ACCOUNT_FOUND_ERROR":
        validation_message = pytest.globalDict['i18n']['FORGOT_PASSWORD_MESSAGE'][key]
        ForgotPasswordPage(selenium, base_url, variables).validate_generic_error_message(validation_message)
    else:
        raise NameError(
            '"NO_ACCOUNT_FOUND_ERROR" have not been passed as an argument')
