import pytest
from pytest_bdd import parsers, scenarios, given, then, when
from frontend.grv_project.page_objects.landing_page import LandingPage
from frontend.grv_project.page_objects.registration_page import RegistrationPage
from frontend.grv_project.page_objects.login_page import LoginPage
from frontend.grv_project.page_objects.step_three_registration_page import StepThreeRegistrationPage
from frontend.grv_project.page_objects.step_two_registration_page import StepTwoRegistrationPage
from frontend.grv_project.step_definitions.test_assertions import *
from frontend.grv_project.step_definitions.test_landing_anonymous import *
from frontend.grv_project.step_definitions.test_step_three_registration import *
import os
from bp_core.plugin import PROJECT_DIR
scenarios(os.path.join(PROJECT_DIR, "./frontend/grv_project/features/registration/Registration_Step_2"
                                    "/registration_Step_2_speciality_profession_postcode_license.feature"))

WORKPLACE_POSTCODE = "MK8 9BN"
LICENSE_VALUE = "ABCDTEST5869"
DEA_NUMBER = "BB"
number = 1000000
BUSINESS_NUMBER = "01632 960741"


@then('I am on "Step_1" of the "Registration" Form')
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


# @then('I should see that "Continue" Button is disabled')
# def continue_button_disabled_by_default(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
#     assert selenium_generics.get_element(RegistrationPageLocators.continue_button_xpath).get_property(
#         'disabled') or selenium_generics.get_element(RegistrationPageLocators.continue_button_form2).get_property(
#         'disabled')


@then('I am on "Step_2" of the "Registration_Form" of us market')
def check_base_elements_on_step2_signup(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.is_element_visible(RegistrationPageLocators.License_number_dropdown, 10)
    #RegistrationPage(selenium, base_url, variables).check_base_elems_step_two_signup()


@then('I Select the "Consultant" in the "Profession" field')
###@then(parsers.re('I Select the "(?P<profession>(.*)+)" in the "Profession" field'), converters=dict(profession=str))
# def selecting_profession_field(selenium, base_url, variables, profession):
def selecting_profession_field(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).fill_in_profession_field()


# @then(parsers.re('I Select the "(?P<Allergy>(.*)+)" in the "Speciality_1" field'), converters=dict(Allergy=str))
@then('I Select the "Allergy" in the "Speciality_1" field')
def select_speciality_field(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).fill_in_speciality_one_field()


@then('I Select the "DEA" in the "License Number" field')
def select_speciality_field(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.click(RegistrationPageStep2SignupLocators.license_number_selection)
    selenium_generics.click(RegistrationPageStep2SignupLocators.license_number_index_one)
    #StepTwoRegistrationPage(selenium, base_url, variables).fill_in_speciality_one_field()


@then('I Open and close "Speciality_1" field')
def open_and_close_speciality_one_field(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).open_and_close_speciality_one_field()


@then('I Open and close "Profession" field')
def open_and_close_profession_field(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).open_and_close_profession_field()


@then('I Skip and Dont fill anything in Postcode input')
def skip_postcode_input(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).skip_postcode_field()


@then('I Skip and Dont fill anything in License input')
def skip_license_input(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).skip_license_field()


@then('I Select the "Asthma" in the "Speciality_2" field')
def select_speciality_two_field(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).fill_in_speciality_two_field()


@then('I Enter the "VALID_POSTCODE" in the "Postcode" field')
def enter_postcode_valid(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).enter_postcode("MK8 9BN")


@then('I Enter the "INVALID_POSTCODE" in the "Postcode" field')
def enter_postcode_invalid(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).enter_postcode("AABBCC")


@then('I Enter the "VALID_LICENSE" in the "License" field')
def enter_license(selenium, base_url, variables):
    # license: any 7 to 12 character(alpha numeric)
    StepTwoRegistrationPage(selenium, base_url, variables).enter_license("ABCDTEST5869")


@then('I Enter the "DEA_NUMBER" in the "DEA_Number" field')
def enter_license(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.enter_text(RegistrationPageStep2SignupLocators.dea_number_input, "BB1388568")
    #StepTwoRegistrationPage(selenium, base_url, variables).enter_license("ABCDTEST5869")


@then('I should see that "Continue" Button is enabled')
def check_continue_button(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    time.sleep(5)
    assert not selenium_generics.get_element(RegistrationPageLocators.continue_button_xpath).get_property('disabled')
    #StepTwoRegistrationPage(selenium, base_url, variables).continue_button_enabled()


# @then('I click on "Continue" Button')
# def click_on_continue_Button_step_two_signup(selenium, base_url, variables):
#     StepTwoRegistrationPage(selenium, base_url, variables).click_continue_button()


@then('I should see an error "SPECIALITY_REQUIRED_ERROR" below the "Speciality_1" field')
def analyze_speciality_one_validation_error(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).analyze_speciality_one_validation()


@then('I should see an error "PROFESSION_REQUIRED_ERROR" below the "Profession" field')
def analyze_profession_validation_error(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).analyze_profession_validation()


@then('I should see an error "POSTCODE_REQUIRED_ERROR" below the "Postcode" field')
def analyze_postcode_validation_error(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).analyze_postcode_validation()


@then('I should see an error "ENTER_VALID_POSTCODE" below the "Postcode" input')
def analyze_postcode_validity(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).analyze_postcode_validity_against_regexp()


@then('I should see an error "LICENSE_REQUIRED_ERROR" below the "License" field')
def analyze_license_validation_error(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).analyze_license_validation()


@then('I click on "Close" Button')
def click_on_close_button(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).click_on_close_button()


@then('I should be on the Base webpage')
def check_base_webpage_title(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.is_element_visible(RegistrationPageLocators.pfizer_logo)
    #RegistrationPage(selenium, base_url, variables).check_base_webpage_title()


@then('I am redirected back on "Step_1" of the "Registration" Form')
def step_one_signup_verification(selenium, base_url, variables):
    RegistrationPage(selenium, base_url, variables).check_for_elements()


@then('I click on "Step_1" Button on the navigation indicator bar')
def click_step_1_navigation_indicator_bar(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).click_step_1_signup_navigator_bar()


@when('I am on "Step_3" of the "Registration_Form"')
@then('I am on "Step_3" of the "Registration_Form"')
def check_for_elements_on_step_three_signup(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).check_elements_step_three()


@when('I go to "Step_3" of the "Registration_Form"')
@then('I go to "Step_3" of the "Registration_Form"')
def check_for_elements_on_step_three_signup(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.click(RegistrationPageStep2SignupLocators.profession_dropdown)
    selenium_generics.click(RegistrationPageStep2SignupLocators.profession_dropdown_option)
    selenium_generics.click(RegistrationPageStep2SignupLocators.speciality_dropdown)
    selenium_generics.click(RegistrationPageStep2SignupLocators.speciality_dropdown_option)
    selenium_generics.click(RegistrationPageStep2SignupLocators.second_speciality_dropdown)
    selenium_generics.click(RegistrationPageStep2SignupLocators.second_speciality_dropdown_option)
    selenium_generics.enter_text(RegistrationPageStep2SignupLocators.workplace_xpath, WORKPLACE_POSTCODE)
    selenium_generics.enter_text(RegistrationPageStep2SignupLocators.lsp_xpath, LICENSE_VALUE)
    logger.info("Pressing Key", key='TAB')
    selenium_generics.press_key('TAB')
    time.sleep(3)
    selenium_generics.click(RegistrationPageLocators.continue_button_form2)


@when('I go to "Step_3" of the "Registration_Form" of uk stg market')
@then('I go to "Step_3" of the "Registration_Form" of uk stg market')
def check_for_elements_on_step_three_signup(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.enter_text(RegistrationPageStep2SignupLocators.lsp_xpath, LICENSE_VALUE)
    selenium_generics.click(RegistrationPageStep2SignupLocators.profession_dropdown)
    selenium_generics.click(RegistrationPageStep2SignupLocators.profession_dropdown_option)
    selenium_generics.click(RegistrationPageStep2SignupLocators.speciality_dropdown)
    selenium_generics.click(RegistrationPageStep2SignupLocators.speciality_dropdown_option)
    selenium_generics.enter_text(RegistrationPageStep2SignupLocators.postal_code_xpath, "35211")
    selenium_generics.enter_text(RegistrationPageStep2SignupLocators.business_number_xpath, BUSINESS_NUMBER)
    logger.info("Pressing Key", key='TAB')
    selenium_generics.press_key('TAB')
    time.sleep(3)
    selenium_generics.click(RegistrationPageLocators.continue_button_form2)

@when('I am on "Step_4" of the "Registration_Form"')
@then('I am on "Step_4" of the "Registration_Form"')
def check_for_elements_on_step_four_signup(selenium, base_url, variables):
    StepThreeRegistrationPage(selenium, base_url, variables).check_elements()


@then('I am on "Step_3" of the "Registration_Form" of us market')
def check_for_elements_on_step_three_signup(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    assert selenium_generics.is_element_visible(RegistrationPageStep2SignupLocators.therapy_area_inputs)


@then('I go to "Step_3" of the "Registration_Form" of us market')
def check_for_elements_on_step_three_signup(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.click(RegistrationPageStep2SignupLocators.license_number_selection)
    selenium_generics.click(RegistrationPageStep2SignupLocators.license_number_index_three)
    selenium_generics.click(RegistrationPageStep2SignupLocators.professional_designation)
    selenium_generics.click(RegistrationPageStep2SignupLocators.professional_designation_index_one)
    selenium_generics.click(RegistrationPageStep2SignupLocators.speciality_dd)
    selenium_generics.click(RegistrationPageStep2SignupLocators.speciality_dd_index1)
    selenium_generics.enter_text(RegistrationPageStep2SignupLocators.city_xpath, "Birmingham")
    selenium_generics.click(RegistrationPageStep2SignupLocators.state_dd)
    selenium_generics.click(RegistrationPageStep2SignupLocators.state_dd_index1)
    selenium_generics.enter_text(RegistrationPageStep2SignupLocators.postal_code_xpath, "35211")
    selenium_generics.enter_text(RegistrationPageStep2SignupLocators.office_street_address, "801, Tom Martin Drive")
    logger.info("Pressing Key", key='TAB')
    selenium_generics.press_key('TAB')
    time.sleep(3)
    selenium_generics.click(RegistrationPageLocators.continue_button_form2, max_wait_time=10)


@then('I go to "Step_4" of the "Registration_Form" of us market')
def check_for_elements_on_step_three_signup(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.click(RegistrationPageStep2SignupLocators.therapy_area_1)
    selenium_generics.click(RegistrationPageStep2SignupLocators.therapy_area_option_1)
    selenium_generics.click(RegistrationPageStep2SignupLocators.therapy_area_2)
    selenium_generics.click(RegistrationPageStep2SignupLocators.therapy_area_option_2)
    selenium_generics.click(RegistrationPageStep2SignupLocators.therapy_area_3)
    selenium_generics.click(RegistrationPageStep2SignupLocators.therapy_area_option_3)
    selenium_generics.click(RegistrationPageLocators.continue_button_form3)


@then('I enter an <Postcode> in "Postcode" field not as per the regex')
def fill_in_postcode(selenium, base_url, variables, Postcode):
    StepTwoRegistrationPage(selenium, base_url, variables).enter_postcode(Postcode)


@then('I enter an <License_Number_Less_than_Seven_Chars> in "License" field')
def fill_in_custom_license_input(selenium, base_url, variables, License_Number_Less_than_Seven_Chars):
    StepTwoRegistrationPage(selenium, base_url, variables).enter_license(License_Number_Less_than_Seven_Chars)


@then('I enter an <License_Number_More_than_Twelve_Chars> in "License" field')
def fill_in_custom_license_input_long(selenium, base_url, variables, License_Number_More_than_Twelve_Chars):
    StepTwoRegistrationPage(selenium, base_url, variables).enter_license(License_Number_More_than_Twelve_Chars)


@then('I enter an <Valid_Aplha_Numeric_License_Number> in "License" field')
def fill_in_custom_license_input_alfa_numeric(selenium, base_url, variables, Valid_Aplha_Numeric_License_Number):
    StepTwoRegistrationPage(selenium, base_url, variables).enter_license(Valid_Aplha_Numeric_License_Number)


@then('I Enter the "INVALID_LICENSE_MORE_THAN_TWELVE_CHARACTERS" in the "License" field')
def fill_in_custom_license_input_long_simple(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).enter_license("License_Number_More_than_Twelve_Chars")


@then('I should see an error "LICENSE_NUMBER_CANNOT_BE_LESS_THAN_SEVEN_CHARACTERS" below the "License" field')
def license_short_validation_message(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).analyze_for_license_length_short()


@then('I should see an error "LICENSE_NUMBER_CANNOT_BE_MORE_THAN_TWELVE_CHARACTERS" below the "License" field')
def license_long_validation_message(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).analyze_for_license_length_long()


@then('I see input is accepted and no LICENSE validation errors appear')
def license_check_validation_not_appear(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).license_validation_not_displayed()


@then('I hover over the "License" field')
def mouse_hover_license_field(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).license_field_mouse_hover()


@then('I should see the hint "Alliance Healthcare Account number"')
def check_for_tooltip(selenium, base_url, variables):
    StepTwoRegistrationPage(selenium, base_url, variables).check_for_tooltip_is_displayed()
