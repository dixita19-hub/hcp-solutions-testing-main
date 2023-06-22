import time

import pytest
import structlog
from pytest_bdd import parsers, scenarios, given, then, when

from bp_core.plugin import project_dir
from frontend.grv_project.page_objects.landing_page import LandingPage
from frontend.grv_project.page_objects.locators import RegistrationPageLocators, RegistrationPageStep3SignupLocators
from frontend.grv_project.page_objects.registration_page import RegistrationPage
from frontend.grv_project.page_objects.login_page import LoginPage
from frontend.grv_project.page_objects.step_three_registration_page import StepThreeRegistrationPage
from frontend.grv_project.page_objects.step_two_registration_page import StepTwoRegistrationPage
from frontend.grv_project.step_definitions.test_assertions import *
from frontend.grv_project.step_definitions.test_step_two_registration import *
from bp_core.frontend.common.helpers.selenium_generics import SeleniumGenerics


WORKPLACE_POSTCODE = "MK8 9BN"
LICENSE_VALUE = "ABCDTEST5869"
FIRST_NAME_VALUE = "Test"
LAST_NAME_VALUE = "Automator"
EMAIL_VALUE = "pfzauth+us-us-grvautomation@gmail.com"
EMAIL_START = "pfzauth+us-us-grvautomation-"
EMAIL_END = "@gmail.com"
PASSWORD_TO_CREATE_VALID = "Pfizer@123"
PASSWORD_TO_CREATE_INVALID = "%&%*#"
PASSWORD_NO_UPPERCASE = "bchghjhtyyoipfg254"
PASSWORD_NO_LOWERCASE = "AFHFDHDJGJGDDGK254"
PASSWORD_NO_NUMBER = "AAHFfhdjfhjliou"
PASSWORD_NUMBER_ONLY = "57863786357"
PASSWORD_LENGTH_3_CHARS = "AV7d"
PASSWORD_LENGTH_25_CHARS = "AVFHJTUIDKDLHGWLDHBLFH45687d"
PASSWORD_ALL_CRITERIA_PASSED = "ABcsdsds_5748"

scenarios(
    '../features/registration/Registration_Step_3/registration_step_3_password_confirm_password.feature'
    )
logger = structlog.get_logger(__name__)


@when('I am on "Step_1" of the "Registration" Form')
def on_registration_form(selenium, base_url, variables):
    LoginPage(selenium, base_url, variables).start_registration()


# @given('I am an anonymous user')
# def authorize_anonymous_user(selenium, base_url, variables):
#     LandingPage(selenium, base_url, variables).open()
#     LandingPage(selenium, base_url, variables).click_pfizer_logo()
#     users = pytest.globalDict['test_data']['users']
#     LandingPage(selenium, base_url, variables).fill_in_credentials(users["ROOT_USER"])
#     LandingPage(selenium, base_url, variables).submit()
#     LandingPage(selenium, base_url, variables).click_sign_in()


@then('I go to "Step_2" of the "Registration_Form"')
def check_base_elements_on_step2_signup(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    LoginPage(selenium, base_url, variables).start_registration()
    selenium_generics.click(RegistrationPageLocators.title_input)
    selenium_generics.click(RegistrationPageLocators.title_input_mr)
    RegistrationPage(selenium, base_url, variables).enter_string_name_input("%s" % FIRST_NAME_VALUE)
    RegistrationPage(selenium, base_url, variables).enter_string_last_name_input("%s" % LAST_NAME_VALUE)
    RegistrationPage(selenium, base_url, variables).email_enter_field("%s" % EMAIL_VALUE)
    logger.info("Pressing Key", key='TAB')
    selenium_generics.press_key('TAB')
    time.sleep(3)
    selenium_generics.click(RegistrationPageLocators.continue_button_xpath)


@then('I go to "Step_2" of the "Registration_Form" of uk stg market')
def check_base_elements_on_step2_signup(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    LoginPage(selenium, base_url, variables).start_registration()
    selenium_generics.click(RegistrationPageLocators.title_input)
    selenium_generics.click(RegistrationPageLocators.title_input_mr)
    RegistrationPage(selenium, base_url, variables).enter_string_name_input("%s" % FIRST_NAME_VALUE)
    RegistrationPage(selenium, base_url, variables).enter_string_last_name_input("%s" % LAST_NAME_VALUE)
    RegistrationPage(selenium, base_url, variables).email_enter_field("%s" % EMAIL_VALUE)
    selenium_generics.click(RegistrationPageLocators.pref_language_xpath)
    selenium_generics.click(RegistrationPageLocators.pref_language_index_1)
    time.sleep(3)
    selenium_generics.click(RegistrationPageLocators.continue_button_xpath)


@then('I go to "Step_2" of the "Registration_Form" of us market')
def check_base_elements_on_step2_signup(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    LoginPage(selenium, base_url, variables).start_registration()
    RegistrationPage(selenium, base_url, variables).enter_string_name_input("%s" % FIRST_NAME_VALUE)
    RegistrationPage(selenium, base_url, variables).enter_string_last_name_input("%s" % LAST_NAME_VALUE)
    try:
        with open(PROJECT_DIR + "/frontend/grv_project/test_data/email_ids_us_stg.txt", "r") as f:
            number_of_lines = len(f.readlines())
    except:
        number_of_lines = 0
    RegistrationPage(selenium, base_url, variables).email_enter_field(
        "%s" % EMAIL_START + str(number_of_lines) + EMAIL_END)
    logger.info("Pressing Key", key='TAB')
    selenium_generics.press_key('TAB')
    time.sleep(3)
    selenium_generics.click(RegistrationPageLocators.continue_button_form1)
    #RegistrationPage(selenium, base_url, variables).click_continue_button()


@then('I am redirected to "Step_2" of the "Registration_Form"')
def check_redirect_on_step2_signup(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).check_base_elems_step_two_signup()

#
# @when('I go to "Step_3" of the "Registration_Form"')
# def continue_to_step3_registration(selenium, base_url, variables):
#     StepTwoRegistrationPage(selenium, base_url, variables).fill_in_profession_field()
#     StepTwoRegistrationPage(selenium, base_url, variables).fill_in_speciality_one_field()
#     StepTwoRegistrationPage(selenium, base_url, variables).fill_in_speciality_two_field()
#     StepTwoRegistrationPage(selenium, base_url, variables).enter_postcode("%s" % WORKPLACE_POSTCODE)
#     StepTwoRegistrationPage(selenium, base_url, variables).enter_license("%s" % LICENSE_VALUE)
#     StepTwoRegistrationPage(selenium, base_url, variables).click_continue_button()
#     StepThreeRegistrationPage(selenium, base_url, variables).check_elements()


@then('I should see that "Complete registration" Button is disabled')
def check_complete_reg_button_disabled(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    assert not selenium_generics.get_element(RegistrationPageStep3SignupLocators.complete_registration_xpath).is_enabled()
    #StepThreeRegistrationPage(selenium, base_url, variables).check_complete_reg_disabled()


@then('I should see that "Complete registration" Button is enabled')
def check_complete_reg_button_enabled(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    assert selenium_generics.get_element(RegistrationPageStep3SignupLocators.complete_registration_xpath).is_enabled()
    #StepThreeRegistrationPage(selenium, base_url, variables).check_complete_reg_enabled()


@then('I should click "Complete registration" Button on us market')
def check_complete_reg_button_enabled(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.get_element(RegistrationPageStep3SignupLocators.complete_registration_xpath).click()



@when('I click on the "Complete_Registation" button')
def click_complete_reg_button(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).complete_reg_button_click()


@then('I Enter the "VALID_PASSWORD" in the "Password" field')
def enter_valid_password(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.enter_text(RegistrationPageStep3SignupLocators.password_xpath,
                                 "%s" % PASSWORD_TO_CREATE_VALID)
    #StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % PASSWORD_TO_CREATE_VALID)


@then('I Enter the "INVALID_PASSWORD" in the "Password" field')
def enter_invalid_password(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % PASSWORD_TO_CREATE_INVALID)


@then('I Enter the "INVALID_PASSWORD" in the "Confirm_Password" field')
def enter_invalid_password(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % PASSWORD_TO_CREATE_INVALID)


@then('I Enter the "VALID_PASSWORD" in the "Confirm_Password" field')
def enter_confirm_password(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.enter_text(RegistrationPageStep3SignupLocators.confirm_password_xpath,
                                 "%s" % PASSWORD_TO_CREATE_VALID)
    #StepThreeRegistrationPage(selenium, base_url, variables).confirm_password("%s" % PASSWORD_TO_CREATE_VALID)


@then('I have "Checked" the "Certify" checkbox')
def email_consent_tick_checkbox(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.click(RegistrationPageStep3SignupLocators.certify_check)


@then('I have "Checked" the "Consent" checkbox')
def email_consent_tick_checkbox(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.click(RegistrationPageStep3SignupLocators.consent_check)


@then('I have "Checked" the "Email_Consent" checkbox')
def email_consent_tick_checkbox(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).email_consent_tick_checkbox()


@then('I should see that the "Email_Consent" checkbox is "Unchecked"')
def check_email_consent_unchecked(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).email_consent_check_unticked()


@then('I have "Unchecked" the "Email_Consent" checkbox')
def email_consent_untick_checkbox(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).email_consent_untick_checkbox()


@then('I have "Checked" the "Self_Certification" checkbox')
def self_certification_checkbox(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).self_certification_tick_checkbox()


@then('I have "Unchecked" the "Self_Certification" checkbox')
def self_certification_untick_checkbox(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).self_certification_untick_checkbox()


@when('I click on "PRIVACY_AND_COOKIE_POLICY" link')
def click_privacy_cookie_policy_link(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).click_privacy_link()


@when('I click on "TERMS_OF_USE" link')
def click_tos(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).click_tos()


@then('I should be on the "privacy_and_cookie_policy" page')
def check_privacy_policy_page_elems(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).switch_to_privacy_policy()


@then('I should be on the "terms_of_use" page')
def check_privacy_policy_page_elems(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).switch_to_tos_page()


@when('I click on "Back" Button')
def back_button_click(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).back_button_click()


@when('I click on "Step_2" Button on the navigation indicator bar')
def step_two_button_click(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).step_two_navbar_click()


@when('I click on "Step_1" Button on the navigation indicator bar')
def step_one_button_click(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).step_one_navbar_click()


@then('I am redirected back on "Step_1" of the "Registration" Form')
def step_one_signup_verification(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).check_for_elements()


@when('I Enter the "PASSWORD_WITH_FIRST_NAME_IN_IT" in the "Password" field')
def enter_password_with_fname(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % FIRST_NAME_VALUE)


@when('I Enter the "PASSWORD_WITH_FIRST_NAME_IN_IT" in the "Confirm_Password" field')
def enter_password_with_fname(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).confirm_password("%s" % FIRST_NAME_VALUE)


@when('I Enter the "PASSWORD_WITH_LAST_NAME_IN_IT" in the "Password" field')
def enter_password_with_lname(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % LAST_NAME_VALUE)


@when('I Enter the "PASSWORD_WITH_LAST_NAME_IN_IT" in the "Confirm_Password" field')
def enter_password_with_lname(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).confirm_password("%s" % LAST_NAME_VALUE)


@when('I Enter the "PASSWORD_WITH_EMAIL_IN_IT" in the "Password" field')
def enter_password_with_email(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % EMAIL_VALUE)


@when('I Enter the "PASSWORD_WITH_EMAIL_IN_IT" in the "Confirm_Password" field')
def enter_password_with_email(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).confirm_password("%s" % EMAIL_VALUE)


@when('I Enter the "PASSWORD_WITH_NO_UPPERCASE_LETTER" in the "Password" field')
def enter_password_no_uppercase(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % PASSWORD_NO_UPPERCASE)


@when('I Enter the "PASSWORD_WITH_NO_LOWERCASE_CHARACTER" in the "Password" field')
def enter_password_no_lowercase(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % PASSWORD_NO_LOWERCASE)


@when('I Enter the "PASSWORD_WITH_NO_NUMBER" in the "Password" field')
def enter_password_no_number(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % PASSWORD_NO_NUMBER)


@when('I Enter the "PASSWORD_WITH_NO_LOWERCASE_UPPERCASE_CHARACTER" in the "Password" field')
def enter_password_no_lower_no_uppercase(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % PASSWORD_NUMBER_ONLY)


@when('I Enter the "PASSWORD_WITH_LESS_THAN_EIGHT_CHARACTERS" in the "Password" field')
def enter_password_short(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % PASSWORD_LENGTH_3_CHARS)


@when('I Enter the "PASSWORD_WITH_MORE_THAN_TWENTY_CHARACTERS" in the "Password" field')
def enter_password_short(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % PASSWORD_LENGTH_25_CHARS)


@when('I Enter the "PASSWORD_WITH_ALL_CRITERIA_PASSED" in the "Password" field')
def enter_password_all_criteria_passed(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).enter_password("%s" % PASSWORD_ALL_CRITERIA_PASSED)


@then(
    'I should see an error "PASSWORD_SHOULD_NOT_HAVE_FIRST_NAME_LAST_NAME_AND_EMAIL" below the "Password" field highlighted with red color')
def check_for_validation_fname_lname_red_colour(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).check_for_validation_under_password_input(
        # "Does not contain first name, last name or email address")
        pytest.globalDict['i18n']['STEP_3']['PASSWORD_FNAME_LNAME_EMAIL_VALIDATION'])


@then('I should see the following <password_hints_blue> highlighted with blue color22')
def check_password_validation_hints_blue(selenium, base_url, variables, password_hints_blue):
    StepThreeRegistrationPage(selenium, base_url, variables).check_for_validation_under_password_input_blue_color(
        password_hints_blue)


@then('I should see the following <password_hints_red> highlighted with red color22')
def check_password_validation_hints_red(selenium, base_url, variables, password_hints_red):
    StepThreeRegistrationPage(selenium, base_url, variables).check_for_validation_under_password_input(
        password_hints_red)


@when(parsers.re('I should see the following "(?P<key>[a-zA-Z0-9,-? _]+)" highlighted with red color'))
@then(parsers.re('I should see the following "(?P<key>[a-zA-Z0-9,-? _]+)" highlighted with red color'))
def check_for_validation_message_in_red_color(selenium, base_url, variables, key):
    messages = pytest.globalDict['i18n']['PASSWORD_VALIDATION_ERROR_MESSAGE']
    StepThreeRegistrationPage(selenium, base_url, variables).check_for_validation_under_password_input(
        messages[key])


@when(parsers.re('I should see the following "(?P<key>[a-zA-Z0-9,-? _]+)" highlighted with blue color'))
@then(parsers.re('I should see the following "(?P<key>[a-zA-Z0-9,-? _]+)" highlighted with blue color'))
def check_for_validation_message_in_blue_color(selenium, base_url, variables, key):
    messages = pytest.globalDict['i18n']['PASSWORD_VALIDATION_ERROR_MESSAGE']
    StepThreeRegistrationPage(selenium, base_url, variables).check_for_validation_under_password_input_blue_color(
        messages[key])


@when('I click on "Close" Button')
def step_three_close_button_click(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).close_button_click()


@then('I should be on the Base webpage')
def check_base_webpage_title(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.is_element_visible(RegistrationPageLocators.pfizer_logo)
    #RegistrationPage(selenium, base_url, variables).check_base_webpage_title()


@then('I save registered user details of us market')
def save_details():
    PROJECT_DIR = os.getcwd()
    with open(PROJECT_DIR + "/frontend/grv_project/test_data/email_ids_us_stg.txt", "r+") as f:
        number_of_lines = len(f.readlines())
        f.write(str(number_of_lines) + ". ")
        f.write("%s" % EMAIL_START + str(number_of_lines) + EMAIL_END)
        f.write('\n')
