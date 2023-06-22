import time

import pytest
import structlog
from pytest_bdd import parsers, scenarios, given, then, when

from bp_core.frontend.common.helpers.selenium_generics import SeleniumGenerics
from bp_core.frontend.common.utils.locator_parser import Locators
from frontend.grv_project.page_objects.landing_page import LandingPage
from frontend.grv_project.page_objects.locators import RegistrationPageLocators, RegistrationPageStep2SignupLocators, \
    LoginPageLocators
from frontend.grv_project.page_objects.registration_page import RegistrationPage
from frontend.grv_project.page_objects.login_page import LoginPage
from frontend.grv_project.step_definitions.test_assertions import *
import os

from frontend.grv_project.utils.utils import types_dict

PROJECT_DIR = os.getcwd()
scenarios(os.path.join(PROJECT_DIR, "./frontend/grv_project/features/registration/Registration_Step_1/registration_Step_1_first_last_name_email.feature"))
logger = structlog.get_logger(__name__)

#           '../features/registration/Registration_Step_2/registration_Step_2_speciality_profession_postcode_license.feature',

#
# @given('I am an anonymous user')
# def authorize_anonymous_user(selenium, base_url, variables):
#     LandingPage(selenium, base_url, variables).open()
#     LandingPage(selenium, base_url, variables).click_pfizer_logo()
#     users = pytest.globalDict['test_data']['users']
#     LandingPage(selenium, base_url, variables).fill_in_credentials(users["ROOT_USER"])
#     LandingPage(selenium, base_url, variables).submit()
#     LandingPage(selenium, base_url, variables).click_sign_in()


@then('I am on "Step_1" of the "Registration" Form')
def on_registration_form(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.click(LoginPageLocators.register_button)
    #LoginPage(selenium, base_url, variables).start_registration()


@then('I Enter a space as the first character in the "First_Name" field')
def fill_space_in_name_input(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).enter_string_name_input(" ")


@then('I Enter a space as the first character in the "Last_Name" field')
def fill_space_in_last_name_input(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).enter_string_last_name_input(" ")


@then('I should not see the space accepted in the "First_Name" field')
def grab_text_input(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).analyze_first_name_actual_input("")


@then('I should not see the space accepted in the "Last_Name" field')
def grab_text_input_last_name(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).analyze_last_name_actual_input("")


@then(parsers.re('I enter an "(?P<alphabets>.*)" in the "First_Name" field'), converters=types_dict)
def fill_in_first_name_input(selenium, base_url, variables, alphabets):
    print(alphabets)
    RegistrationPage(selenium, base_url, variables).enter_string_name_input(alphabets)


@then('I Enter the "First_Name" in the "First_Name" field')
def fill_in_first_name_input(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).enter_string_name_input("firstname")


@then(parsers.re('I enter an "(?P<alphabets>.*)" in the "Last_Name" field'), converters=types_dict)
def fill_in_last_name_input(selenium, base_url, variables, alphabets):
    print(alphabets)
    RegistrationPage(selenium, base_url, variables).enter_string_last_name_input(alphabets)


@then('I Enter the "Last_Name" in the "Last_Name" field')
def fill_in_last_name_input(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).enter_string_last_name_input("lastname")


@then(parsers.re('I enter an "(?P<non_alphabets>.*)" in the "First_Name" field'), converters=types_dict)
def fill_in_fname_with_non_alphabetic(selenium, base_url, variables, non_alphabets):
    RegistrationPage(selenium, base_url, variables).enter_string_name_input(non_alphabets)


@then(parsers.re('I enter an "(?P<non_alphabets>.*)" in the "Last_Name" field'), converters=types_dict)
def fill_in_lname_with_non_alphabetic(selenium, base_url, variables, non_alphabets):
    RegistrationPage(selenium, base_url, variables).enter_string_last_name_input(non_alphabets)


@when('I move to "Last_Name" field')
def click_on_last_name_input(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).last_name_input_click()


@when('I move to "Email" field')
def click_on_email_input(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).email_input_click()


@then('I should not see any error for the "First_Name" field')
def check_for_missing_validation_first_name_input(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    assert not selenium_generics.is_element_visible(RegistrationPageLocators.first_name_validation_message, 10)
    #RegistrationPage(selenium, base_url, variables).check_first_name_validation_absent_improved()



@then('I should see an error "FIRST_NAME_VALIDATION_MESSAGE" below the "First_Name" field')
def check_missing_validation_first_name_input(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    assert selenium_generics.is_element_visible(RegistrationPageLocators.first_name_validation_message, 10)
    #RegistrationPage(selenium, base_url, variables).check_first_name_validation_absent_improved()


@then('I should see an error "SURNAME_NAME_VALIDATION_MESSAGE" below the "Last_Name" field')
def check_missing_validation_first_name_input(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    assert selenium_generics.is_element_visible(RegistrationPageLocators.last_name_validation_message, 10)
    #RegistrationPage(selenium, base_url, variables).check_first_name_validation_absent_improved()


@then('I should not see any error for the "Last_Name" field')
def check_for_missing_validation_last_name_input(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    assert not selenium_generics.is_element_visible(RegistrationPageLocators.last_name_validation_message, 10)
    #RegistrationPage(selenium, base_url, variables).check_last_name_validation_absent()


@then(parsers.re('I should see the entered "(?P<alphabets>.*)" in the "First_Name" field'), converters=types_dict)
# @then(parsers.re('I should see the entered (?P<alphabetic_string>(.*)+) in the "First_Name" field'),
# @then(parsers.re('I should see the entered (?P<alphabetic_string>[a-zA-Z]+) in the "First_Name" field'),
# @then(parsers.parse('results are shown for "{phrase}"'))
# @then(parsers.parse('I should see the entered "{alphabetic_string}" in the "First_Name" field'))
# @then(parsers.parse('I should see the entered (?P<alphabetic_string>[a-zA-Z_<a-zA-Z>]+) in the "First_Name" field'),
def check_for_expected_input_first_name(selenium, base_url, variables, alphabets):
    RegistrationPage(selenium, base_url, variables).analyze_first_name_actual_input(alphabets)


@then(parsers.re('I should see the entered "(?P<alphabets>.*)" in the "Last_Name" field'), converters=types_dict)
def check_for_expected_input_last_name(selenium, base_url, variables, alphabets):
    RegistrationPage(selenium, base_url, variables).analyze_last_name_actual_input(alphabets)


@then(parsers.re('I should not see the entered "(?P<non_alphabets>.*)" in the "First_Name" field'), converters=types_dict)
def check_for_expected_input_first_name(selenium, base_url, variables, non_alphabets):
    RegistrationPage(selenium, base_url, variables).analyze_first_name_actual_input("")


@then(parsers.re('I should not see the entered "(?P<non_alphabets>.*)" in the "Last_Name" field'), converters=types_dict)
def check_for_expected_input_last_name_nonalph(selenium, base_url, variables, non_alphabets):
    RegistrationPage(selenium, base_url, variables).analyze_last_name_actual_input("")


@then(parsers.re("I press '(?P<key>.*)'"))
@when(parsers.re("I press '(?P<key>.*)'"))
def press_key_not_focused_on_element(selenium_generics: SeleniumGenerics, key: str):
    logger.info("Pressing Key", key=key)
    selenium_generics.press_key(key)


@then(parsers.re('I enter an "(?P<email>.*)" in "Email" field as per the regex'), converters=types_dict)
@then(parsers.re('I enter an "(?P<email>.*)" in "Email" field not as per the regex'), converters=types_dict)
def fill_in_email_input(selenium, base_url, variables, email):
    RegistrationPage(selenium, base_url, variables).email_enter_field(email)


@then('I Enter the "Email" in the "Email" field')
@when('I Enter the "Email" in the "Email" field')
def fill_in_email_input(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).email_enter_field("email2233@test.com")


@when('I Enter the "INVALID_EMAIL" in the "Email" field')
def fill_in_email_input(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).email_enter_field("email@@ff34353535")


@then('I should see an error "EMAIL_NOT_VALID_ERROR" below the "Email" field')
@then('I should see an error "EMAIL_NOT_ENTERED_VALIDATION_MESSAGE" below the "Email" field')
def analyze_email_error(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.is_element_visible(RegistrationPageLocators.email_input_validation_message, 10)
    #RegistrationPage(selenium, base_url, variables).check_email_validation_message()


@then('I should see that "Continue" Button is disabled')
def continue_button_disabled_by_default(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    assert selenium_generics.get_element(RegistrationPageLocators.continue_button_xpath).get_property('disabled')


@then('I should see that "Continue" Button is disabled on "Step_1"')
def continue_button_disabled_by_default(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    assert selenium_generics.get_element(RegistrationPageLocators.continue_button_form1).get_property('disabled')


@then('I should see that "Continue" Button is disabled on "Step_2"')
def continue_button_disabled_by_default(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    assert selenium_generics.get_element(RegistrationPageLocators.continue_button_form2).get_property('disabled')


@then('I should see that "Continue" Button is disabled on "Step_3"')
def continue_button_disabled_by_default(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    assert selenium_generics.get_element(RegistrationPageLocators.continue_button_form3).get_property('disabled')


@then('I should see that "Continue" Button is enabled on "Step_3"')
def continue_button_disabled_by_default(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    assert not selenium_generics.get_element(RegistrationPageLocators.continue_button_form3).get_property('disabled')


@then('I should see that "Continue" Button is enabled')
def continue_button_disabled_by_default(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    time.sleep(5)
    assert not selenium_generics.get_element(RegistrationPageLocators.continue_button_xpath).get_property('disabled')
    #RegistrationPage(selenium, base_url, variables).check_continue_button_enabled()


@then('I do not enter an anything in "Title" field')
def skip_title_input_field(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).skipping_title_input()


@then('I Enter the "Title" in the "Titles" field')
def skip_title_input_field(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.click(RegistrationPageLocators.title_input, max_wait_time=10)
    selenium_generics.click(RegistrationPageLocators.title_input_mr, max_wait_time=10)
   #RegistrationPage(selenium, base_url, variables).enter_title_input_select("Mr")


@when("I click on 'PRIVACY_POLICY' link")
def navigate_to_efficacy_tab_1(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).click_on_privacy_link()


@then('I should be on the "Privacy_Policy" page')
def privacy_policy_page_verification(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.switch_to_last_window()
    selenium_generics.does_title_contains(pytest.globalDict['i18n']['PRIVACY_POLICY_PAGE_TITLE'])
    #RegistrationPage(selenium, base_url, variables).extract_privacy_policy_title()


@when('I click on "Close" Button')
def click_on_close_button(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).click_on_close_button()


@then('I should be on the Base webpage')
def check_base_webpage_title(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.is_element_visible(RegistrationPageLocators.pfizer_logo)
    #RegistrationPage(selenium, base_url, variables).check_base_webpage_title()


@then('I click on "Continue" Button')
@when('I click on "Continue" Button')
def click_continue_button(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.click(RegistrationPageLocators.continue_button_xpath, max_wait_time=10)
    #RegistrationPage(selenium, base_url, variables).click_continue_button()

@then('I click on "Continue" Button on page 2')
@when('I click on "Continue" Button on page 2')
def click_continue_button_logger(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.click(RegistrationPageLocators.continue_button_form2, max_wait_time=10)


# @then(parsers.re(
#     'I click on "(?P<key>(continue|FORGOT_PASSWORD))" button'),
#     converters=dict(key=str))
# @when(parsers.re(
#     'I click on "(?P<key>(continue|FORGOT_PASSWORD))" button'),
#     converters=dict(key=str))
# def when_click_button(selenium, base_url, variables, key):
#     if key == 'FORGOT_PASSWORD':
#         LoginPage(selenium, base_url, variables).click_forgot_password_button()


@then('I am on "Step_2" of the "Registration_Form"')
def check_base_elements_on_step2_signup(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.is_element_visible(RegistrationPageStep2SignupLocators.speciality_xpath, 10)
    #RegistrationPage(selenium, base_url, variables).check_base_elems_step_two_signup()


@when('I click on "Back" Button')
@then('I click on "Back" Button')
def click_on_back_button(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).back_button_click()


@then('I should be on the "Login_Page"')
def checking_login_input_passwords(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).check_login_input_passwords()


@when(parsers.re("I click on '(?P<link_name>.*)' link"), converters=dict(link_name=str))
def navigate_to_efficacy_tab_1(selenium, base_url, variables, link_name):
    UltimateqaAutomationPage(selenium, base_url, variables['env']).click_link(link_name)
