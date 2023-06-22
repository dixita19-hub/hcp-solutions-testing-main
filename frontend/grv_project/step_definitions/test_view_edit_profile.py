import pytest,time
from pytest_bdd import parsers, scenarios, given, then, when
from time import sleep


from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver import ActionChains

from bp_core.frontend.common.helpers.selenium_generics import SeleniumGenerics
from frontend.grv_project.page_objects.home_page import HomePage
from frontend.grv_project.page_objects.landing_page import LandingPage
from frontend.grv_project.page_objects.locators import RegistrationPageLocators
from frontend.grv_project.page_objects.password_edit_page import PasswordEditPage
from frontend.grv_project.page_objects.registration_page import RegistrationPage
from frontend.grv_project.page_objects.login_page import LoginPage
from frontend.grv_project.page_objects.profile_page import ProfilePage

PASSWORD_TO_CREATE_VALID = "Abc1234_PASS"
PASSWORD_TO_CREATE_INVALID = "%&%*#"
PASSWORD_NO_UPPERCASE = "bchghjhtyyoipfg254"
PASSWORD_NO_LOWERCASE = "AFHFDHDJGJGDDGK254"
PASSWORD_NO_NUMBER = "AAHFfhdjfhjliou"
PASSWORD_NUMBER_ONLY = "57863786357"
PASSWORD_LENGTH_3_CHARS = "AV7d"
PASSWORD_LENGTH_25_CHARS = "AVFHJTUIDKDLHGWLDHBLFH45687d"
PASSWORD_ALL_CRITERIA_PASSED = "ABcsdsds_5748"
global select_username

scenarios(
    '../features/view_profile/navigation/view_profile_navigation.feature',
    '../features/view_profile/ui/view_profile_ui.feature',
    '../features/edit_profile/edit_profile_password_tab_validation.feature',
    '../features/edit_profile/edit_profile_personal_tab_validation.feature',
    '../features/edit_profile/edit_profile_professional_tab_validation.feature',
    '../features/edit_profile/edit_profile.feature')


@given(parsers.re('I have logged in to my account "(?P<user_name>.*)"'), converters=dict(user_name=str))
def authorize_anonymous_user(selenium, base_url, variables, user_name):
    base_url = pytest.globalDict['i18n']['URL']
    LandingPage(selenium, base_url, variables).open()
    time.sleep(15)
    try:
        selenium.find_element(By.XPATH,
                              '//button[@id="_evidon-banner-acceptbutton"]').click()
        time.sleep(5)
        try:
            selenium.find_element(By.XPATH,
                                  '//*[@id="ituw"]/helix-core-heading').click()

            ActionChains(selenium).send_keys(Keys.PAGE_DOWN).perform()
            time.sleep(2)
            selenium.find_element(By.XPATH,
                                  '//helix-core-button[@id="imfgj" or @id="i6gui"]').click()
        except NoSuchElementException:
            time.sleep(2)
    except NoSuchElementException:
        time.sleep(5)
    time.sleep(5)
    LandingPage(selenium, base_url, variables).click_pfizer_logo()
    time.sleep(5)
    # LandingPage(selenium, base_url, variables).open()
    # LandingPage(selenium, base_url, variables).click_pfizer_logo()
    users = pytest.globalDict['test_data']['users']
    pytest.globalDict['test_data']['users']['Execution_User'] = user_name
    # global select_username
    # select_username = users[user_name]
    # LandingPage(selenium, base_url, variables).fill_in_credentials(users["ROOT_USER"])
    # LandingPage(selenium, base_url, variables).submit()
    # LandingPage(selenium, base_url, variables).click_sign_in()
    LoginPage(selenium, base_url, variables).fill_login_form(users[user_name])
    selenium.find_element(By.XPATH,
                          '//h1[@class="heading-block__title"]').click()
    LoginPage(selenium, base_url, variables).click_login_button()


@then('I am on the "View_Profile" Screen')
def click_on_authorized_profile(selenium, base_url, variables):
    HomePage(selenium, base_url, variables).open_view_profile()
    ProfilePage(selenium, base_url, variables).check_header()


@when('I click on the "Professional" tab')
def click_on_professional_tab(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).profession_tab_click()


@when('I click on the "Password" tab')
def password_tab_click(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).password_tab_click()


@when('I click on "Close" button')
def close_button_click(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).close_button_click()


@when('I click on "Edit" button in "Personal" tab')
def personal_edit_click(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).personal_edit_click()
    sleep(2)

@when('I click on "Edit" button in "Preferences" tab')
def personal_edit_click(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).preferences_edit_click()
    sleep(2)


@when('I click on "Edit" button in "Professional" tab')
def profession_edit_click(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).profession_edit_click()
    sleep(2)


@then('I click on "Edit" button in "Password" tab')
@when('I click on "Edit" button in "Password" tab')
def password_edit_click(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).password_edit_click()
    sleep(2)


@then('I should be on the base webpage')
def check_on_home_page(selenium, base_url, variables, selenium_generics: SeleniumGenerics):
    selenium_generics.is_element_visible(RegistrationPageLocators.pfizer_logo)
    #HomePage(selenium, base_url, variables).check_on_home_page()


# ----- PERSONAL -----


@then('I should be on the "Personal" tab')
def check_personal_tab(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_on_personal_tab()


@when('I click on the "Personal" tab')
def click_on_personal_tab(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).personal_tab_click()


@then('I should be on Edit screen of "Personal" tab')
def check_on_personal_edit_page(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_on_personal_edit_page()


@then('I should see "Email" section')
def check_email_section(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_email_section()


@then(parsers.re('I should see the "Email" section with value "(?P<text>.*)"'), converters=dict(text=str))
def check_email_section_value(selenium, base_url, variables, text):
    ProfilePage(selenium, base_url, variables).check_email_section_value(text)

@then('I should see the "Email" section with expected value')
def check_email_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    ProfilePage(selenium, base_url, variables).check_email_section_value(user['EMAIL'])


@then(parsers.re('I should see the "Title" section with value "(?P<text>.*)"'), converters=dict(text=str))
def check_title_section_value(selenium, base_url, variables, text):
    ProfilePage(selenium, base_url, variables).check_title_section_value(text)

@then('I should see the "Title" section with expected value')
def check_title_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['TITLE'] =="None" or user['TITLE'] =="NA":
        sleep(2)
    else:
        ProfilePage(selenium, base_url, variables).check_title_section_value(user['TITLE'])

@then('I should see "Title" section')
def check_title_section(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_title_section()


@then('I should see "Name" section')
def check_name_section(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_name_section()


@then(parsers.re('I should see the "Name" section with value "(?P<text>.*)"'), converters=dict(text=str))
def check_name_section_value(selenium, base_url, variables, text):
    ProfilePage(selenium, base_url, variables).check_name_section_value(text)

@then('I should see the "Name" section with expected value')
def check_name_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    ProfilePage(selenium, base_url, variables).check_name_section_value(user['NAME'])


@then('I should see "Email_Consent" section')
def check_consent_section(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_consent_section()


@then(parsers.re('I should see the "Email Consent" section with value "(?P<text>.*)"'), converters=dict(text=str))
def check_email_section_value(selenium, base_url, variables, text):
    ProfilePage(selenium, base_url, variables).check_consent_section_value(text)

@then('I should see the "Email Consent" section with expected value')
def check_email_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if (user['EMAIL_CONSENT'] == "None") or user['EMAIL_CONSENT'] == "NA":
        sleep(1)
    else :
        ProfilePage(selenium, base_url, variables).check_consent_section_value(user['EMAIL_CONSENT'])


@then('I should see "Delete" section based on market')
def check_delete_section(selenium, base_url, variables):
    data = pytest.globalDict['i18n']['PROFILE']['PERSONAL']['DELETE_LABEL']
    if data == "None" :
        print("This market does not have delete account button")
    else :
        ProfilePage(selenium, base_url, variables).check_delete_section()


@then('I should see "Personal Edit" button')
def check_personal_edit_btn(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_personal_edit_btn()


# ----- edit -----


@then('I should see edit "Title" field')
def check_edit_title_field(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_edit_title_field()


@then('I should see edit "First Name" field')
def check_edit_first_name_field(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_edit_first_name_field()


@then('I should see edit "Last Name" field')
def check_edit_last_name_field(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_edit_last_name_field()




@then('I should see edit "Email" field')
def check_edit_email_field(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_edit_email_field()


@then('I should not be able to enter any characters apart from the "Alphabets" in "LastName" field')
def check_last_name_field_characters(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_last_name_field_characters()


@then('I should not be able to enter any characters apart from the "Alphabets" in "FirstName" field')
def check_last_name_field_characters(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_first_name_field_characters()


@when('I delete the existing "Email" to leave the "Email" field empty')
def clear_email_input(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).clear_email_input()


@when('I delete the existing "First Name" to leave the "First Name" field empty')
def clear_first_name_input(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).clear_first_name_input()


@when('I delete the existing "Last Name" to leave the "Last Name" field empty')
def clear_last_name_input(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).clear_last_name_input()


@when('I delete the existing "License Number" to leave the "Email" field empty')
def clear_registration_input(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).clear_registration_input()


@when('I delete the existing "Postcode" to leave the "Postcode" field empty')
def clear_postcode_input(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).clear_postcode_input()


@then('I should see an error "Email address is required" below the "Email" field')
def check_email_input_validation_msg(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_email_input_validation_msg()


@then('I should see an error "Please enter a valid email address" below the "Email" field')
def check_email_input_validation_format_msg(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_email_input_validation_format_msg()


@then('I should see an error "First name is required" below the "First Name" field')
def check_first_name_input_validation_msg(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_first_name_input_validation_msg()


@then('I should see an error "Last name is required" below the "Last Name" field')
def check_last_input_validation_msg(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_last_input_validation_msg()


@then('I should see an error "Postcode is required" below the "Postcode" field')
def check_postcode_input_validation_msg(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_postcode_input_validation_msg()


@then('I should see an error "Please enter a valid Post Code" below the "Postcode" field')
def check_postcode_input_format_validation_msg(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_postcode_input_format_validation_msg()


@then('I should see an error "License number is required" below the "License Number" field')
def check_registration_input_validation_msg(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_registration_input_validation_msg()


@then('I should see an error "Please enter a valid License Number" below the "License Number" field')
def check_registration_input_format_validation_msg(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_registration_input_format_validation_msg()


#@then('I enters an <email> in "Email" field not as per the regex')
@then(parsers.re("I enter an '(?P<email>.*)' in Email field not as per the regex"), converters=dict(email=str))
def enter_edit_email_value(selenium, base_url, variables, email):
    ProfilePage(selenium, base_url, variables).enter_edit_email_value(email)
    # selenium.find_element(By.CSS,
    #                       '#grv_signIn_editProfileForm > h1').click()


# ----- PROFESSIONAL -----


@then('I should be on the "Professional" tab')
def check_on_profession_tab(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_on_profession_tab()


@then('I should see "Profession" section')
def check_profession_section(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_profession_section()


@then(parsers.re('I should see the "Profession" section with value "(?P<text>.*)"'), converters=dict(text=str))
def check_profession_section_value(selenium, base_url, variables, text):
    ProfilePage(selenium, base_url, variables).check_profession_section_value(text)

@then('I should see the "Profession" section with expected value')
def check_profession_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    ProfilePage(selenium, base_url, variables).check_profession_section_value(user['PROFESSION'])


@then('I should see "Specialty" section')
def check_specialty_section(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_specialty_section()


@then(parsers.re('I should see the "Specialty" section with value "(?P<text>.*)"'), converters=dict(text=str))
def check_specialty_section_value(selenium, base_url, variables, text):
    ProfilePage(selenium, base_url, variables).check_specialty_section_value(text)

@then('I should see the "Specialty" section with expected value')
def check_specialty_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    ProfilePage(selenium, base_url, variables).check_specialty_section_value(user['SPECIALITY'])

# @then('I should be on the "Password" tab')
# def check_on_password_tab(selenium, base_url, variables):
#     ProfilePage(selenium, base_url, variables).check_on_password_tab()


@then('I should see "Second Specialty" section based on market')
def check_second_specialty_section(selenium, base_url, variables):
    data = pytest.globalDict['i18n']['PROFILE']['PROFESSIONAL']['SECOND_SPECIALTY_LABEL']
    if data == "None":
        print("This market does not have Second Speciality section")
    else:
        ProfilePage(selenium, base_url, variables).check_second_specialty_section()


@then(parsers.re('I should see the "Second Specialty" section with value "(?P<text>.*)"'), converters=dict(text=str))
def check_second_specialty_section_value(selenium, base_url, variables, text):
    ProfilePage(selenium, base_url, variables).check_second_specialty_section_value(text)


@then('I should see the "Second Specialty" section with expected value')
def check_second_specialty_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['SECOND_SPECIALITY'] == "None" or user['SECOND_SPECIALITY'] == "NA":
        sleep(3)
    else :
        ProfilePage(selenium, base_url, variables).check_second_specialty_section_value(user['SECOND_SPECIALITY'])

@then('I should see "Registration / LSP number" section')
def check_registration_sectio(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_registration_section()


@then(parsers.re('I should see the "Registration / LSP Number" section with value "(?P<text>.*)"'),
      converters=dict(text=str))
def check_registration_section_value(selenium, base_url, variables, text):
    ProfilePage(selenium, base_url, variables).check_registration_section_value(text)

@then('I should see the "Registration / LSP Number" section with expected value')
def check_registration_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['REGISTRATION_NUM'] == "None" or user['REGISTRATION_NUM'] == "NA":
        sleep(3)
    else:
        ProfilePage(selenium, base_url, variables).check_registration_section_value(user['REGISTRATION_NUM'])

@then('I should see "Workplace postcode" section based on market')
def check_postcode_section(selenium, base_url, variables):
    data = pytest.globalDict['i18n']['PROFILE']['PROFESSIONAL']['POSTCODE_LABEL']
    if data == "None":
        print("This market does not have workplace postalcode section")
    else:
        ProfilePage(selenium, base_url, variables).check_postcode_section()


@then('I should see the "Workplace Postcode" section with expected value')
def check_postcode_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['WORKPLACE_POSTCODE'] == "None" or user['WORKPLACE_POSTCODE'] == "NA":
        sleep(3)
    else:
        ProfilePage(selenium, base_url, variables).check_postcode_section_value(user['WORKPLACE_POSTCODE'])

@then('I should see "Mailing Address AdminstrativeArea" section based on market')
def check_mailingAAA_section(selenium, base_url, variables):
    data = pytest.globalDict['i18n']['PROFILE']['PROFESSIONAL']['MAILINGADDRESS_LABEL']
    if data =="None":
        print("This market does not have mailing address adminstrative section")
    else:
        ProfilePage(selenium, base_url, variables).check_mailingAAA_section()


@then('I should see the "Mailing Address AdminstrativeArea" section with expected value')
def check_mailingAAA_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['MailingAAA'] == "None" or user['MailingAAA'] == "NA":
        sleep(3)
    else:
        ProfilePage(selenium, base_url, variables).check_mailingAAA_section_value(user['MailingAAA'])


@then('I should be on Edit screen of "Professional" tab')
def check_on_profession_edit_page(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_on_profession_edit_page()


@then('I should see "Professional Edit" button')
def check_professional_edit_btn(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_professional_edit_btn()


@then('I should see edit "Profession" field')
def check_professional_profession_field(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_professional_profession_field()


@then('I should see edit "Speciality" field')
def check_professional_specialty_field(selenium, base_url, variables):
    sleep(3)
    ProfilePage(selenium, base_url, variables).check_professional_specialty_field()


@then('I should see edit "Second Speciality" field')
def check_professional_second_specialty_field(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_professional_second_specialty_field()


@then('I should see edit "Prof Registration / LSP number" field')
def check_professional_registration_field(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_professional_registration_field()


@then('I should see edit "Workplace Postcode" field')
def check_professional_postcode_field(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_professional_postcode_field()


@then('The "Professional" edit fields should be editable')
def save_changed_button_click(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_personal_edit_input_fields_are_editable()


@when('I enters an <value> in "License" edit field')
def enter_edit_registration_value(selenium, base_url, variables, value):
    ProfilePage(selenium, base_url, variables).enter_edit_registration_value(value)


@when('I enters an <value> in "Postcode" edit field')
def enter_edit_postcode_value(selenium, base_url, variables, value):
    ProfilePage(selenium, base_url, variables).enter_edit_postcode_value(value)


@when(parsers.re("I enters an '(?P<value>.*)' in targeted edit field and see error as expected"), converters=dict(value=str))
def new_error_loop(selenium, base_url, variables, value):
    value1 = ["1234567890123","123456789012345","123456ABCDEFG","ABCDEFG123456789","1234ABCDEFGH12","ABCDEFG1234HG","1","123","123456","ABC","ABCDEF","ABC123","AB12","1AB"]
    value2 = ["MK8","MK8 @AB","HA8 D3P","HA8 ABC","ABC 123","W5 ET","HA8 DP3","8HA 3DP"]
    if value == "License":
        for i in value1:
            ProfilePage(selenium, base_url, variables).enter_edit_registration_value(i)
            ActionChains(selenium).send_keys(Keys.PAGE_UP).perform()
            ProfilePage(selenium, base_url, variables).click_on_professional_edit_title()
            time.sleep(2)
            ProfilePage(selenium, base_url, variables).check_registration_input_format_validation_msg()
            ActionChains(selenium).send_keys(Keys.PAGE_DOWN).perform()
            time.sleep(2)
            PasswordEditPage(selenium, base_url, variables).save_changes_professionalcheck_disabled()
    if value == "Postalcode":
        for i in value2:
            ProfilePage(selenium, base_url, variables).enter_edit_postcode_value(i)
            ActionChains(selenium).send_keys(Keys.PAGE_UP).perform()
            ProfilePage(selenium, base_url, variables).click_on_professional_edit_title()
            time.sleep(2)
            ProfilePage(selenium, base_url, variables).check_postcode_input_format_validation_msg()
            ActionChains(selenium).send_keys(Keys.PAGE_DOWN).perform()
            time.sleep(2)
            PasswordEditPage(selenium, base_url, variables).save_changes_professionalcheck_disabled()




# ----- PASSWORD -----


@then('I should be on the "Password" tab')
def check_on_password_tab(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_on_password_tab()


@then('I should see "Password" section')
def check_password_section(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_password_section()


@then('I should be on Edit screen of "Password" tab')
@when('I should be on Edit screen of "Password" tab')
def check_on_password_edit_page(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_on_password_edit_page()


@then('I should see "Password Edit" button')
def check_password_edit_btn(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_password_edit_btn()


@then('I should see the password section with value displayed in dots hiding the real password')
def check_password_hiding(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_password_hiding()


# ----- COMMON -----


@then('I should see "Close" button')
def check_close_btn(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_close_btn()


@then('I should see "Back" button')
def check_back_btn(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_back_btn()


@when('I click on "Edit" link on the "Password" tab')
def click_on_password_tab_edit_link(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).click_on_password_tab_edit_link()


@then('I should be on the password edit screen')
def check_user_on_password_edit_screen(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).check_for_elements_to_appear_on_page()


@then('The "Professional" edit fields should be editable')
def check_professional_edit_input_fields_are_editable(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_professional_edit_input_fields_are_editable()


@when('I go into the "New Password" field')
def i_switch_focus_to_new_pass_field(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).switch_focus_to_new_pass_field()


@when('I go into the "Confirm Password" field')
def i_switch_focus_to_confirm_pass_field(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).switch_focus_to_confirm_pass_field()


@when('I go into the "Current Password" field')
def i_switch_focus_to_confirm_pass_field(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).switch_focus_to_current_pass_field()


@then('I dont enter the New Password and click outside the field')
def switch_focus_out_of_new_password_field(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).switch_focus_out_of_new_pass_field()


@then('I dont enter the Confirm Password and click outside the field')
def switch_focus_out_of_confirm_password_field(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).switch_focus_out_of_confirm_pass_field()


@then('I dont enter the Current Password and click outside the field')
def switch_focus_out_of_confirm_password_field(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).switch_focus_out_of_current_pass_field()


@then(parsers.re('I should see an error "(?P<key>[a-zA-Z0-9_]+)" below the "New Password" field'),
      converters=dict(key=str))
def invalid_credentials_validation(selenium, base_url, variables, key):
    if key == "PASSWORD_REQUIRED":  # or key == "PASSWORD_REQUIRED" or key == "TOO_MANY_FAILED_LOGIN_ATTEMPTS":
        validation_message = pytest.globalDict['i18n']['NEW_PASSWORD_ERROR_MESSAGE'][key]
        PasswordEditPage(selenium, base_url, variables).new_password_validate_error_message(validation_message)
    else:
        raise NameError('"PASSWORD_REQUIRED" have NOT been passed as an argument')


@then(parsers.re('I should see an error "(?P<key>[a-zA-Z0-9_]+)" below the "Confirm Password" field'),
      converters=dict(key=str))
def invalid_credentials_validation(selenium, base_url, variables, key):
    if key == "PASSWORD_REQUIRED" or key == "PASSWORD_REQUIRED_CONFIRM":  # or key == "TOO_MANY_FAILED_LOGIN_ATTEMPTS":
        validation_message = pytest.globalDict['i18n']['NEW_PASSWORD_ERROR_MESSAGE'][key]
        PasswordEditPage(selenium, base_url, variables).confirm_password_validate_error_message(validation_message)
    else:
        raise NameError(
            'Neither "PASSWORD_REQUIRED" nor "PASSWORD_REQUIRED_CONFIRM" have NOT been passed as an argument')


@then(parsers.re('I should see an error "(?P<key>[a-zA-Z0-9_]+)" below the "Current Password" field'),
      converters=dict(key=str))
def invalid_credentials_validation(selenium, base_url, variables, key):
    ActionChains(selenium).send_keys(Keys.PAGE_UP).perform()
    sleep(8)
    if key == "PASSWORD_REQUIRED" or key == "PASSWORD_REQUIRED_CONFIRM" or key == "CURRENT_PASSWORD_REQUIRED" or key == "INCORRECT_CURRENT_PASSWORD":
        validation_message = pytest.globalDict['i18n']['NEW_PASSWORD_ERROR_MESSAGE'][key]
        PasswordEditPage(selenium, base_url, variables).current_password_validate_error_message(validation_message)
    else:
        raise NameError(
            'Neither "PASSWORD_REQUIRED" nor "PASSWORD_REQUIRED_CONFIRM" nor "CURRENT_PASSWORD_REQUIRED" nor "INCORRECT_CURRENT_PASSWORD" have NOT been passed as an argument')


@then('I should see the "Save Changes" button disabled')
def check_save_changes_button_disabled(selenium, base_url, variables):
    ActionChains(selenium).send_keys(Keys.PAGE_DOWN).perform()
    time.sleep(2)
    PasswordEditPage(selenium, base_url, variables).save_changes_check_disabled()

@then('I should see the "Save Changes" button disabled on Change Password page')
def check_save_changes_button_disabled(selenium, base_url, variables):
    ActionChains(selenium).send_keys(Keys.PAGE_DOWN).perform()
    time.sleep(2)
    PasswordEditPage(selenium, base_url, variables).save_changes_passwordcheck_disabled()


@then('I should see the "Save Changes" button disabled on Professional page')
def check_save_changes_button_disabled(selenium, base_url, variables):
    ActionChains(selenium).send_keys(Keys.PAGE_DOWN).perform()
    time.sleep(2)
    PasswordEditPage(selenium, base_url, variables).save_changes_professionalcheck_disabled()


@then('I enter the "Incorrect Current Password"')
def enter_password(selenium, base_url, variables):
    users = pytest.globalDict['test_data']['users']
    PasswordEditPage(selenium, base_url, variables).fill_in_current_password(
        users["INCORRECT_PASSWORD_TO_ENTER"]["PASSWORD"])

@then('I enter the "Correct Current Password"')
def enter_password(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    PasswordEditPage(selenium, base_url, variables).fill_in_current_password(
        user["PASSWORD"])


@then('I enter the New Password and confirm password')
def enter_new_and_confirm_password(selenium, base_url, variables):
    users = pytest.globalDict['test_data']['users']
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password(
        users["PREDEFINED_NEW_PASSWORD"]["PASSWORD"])
    PasswordEditPage(selenium, base_url, variables).fill_in_confirm_password(
        users["PREDEFINED_NEW_PASSWORD"]["PASSWORD"])


@then('I should see the "Save Changes" button enabled')
def save_changes_button_enabled(selenium, base_url, variables):
    ActionChains(selenium).send_keys(Keys.PAGE_DOWN).perform()
    time.sleep(2)
    PasswordEditPage(selenium, base_url, variables).save_changes_check_enabled()

@then('I should see the "Save Changes" button enabled on Change Password page')
def check_save_changes_button_enabled(selenium, base_url, variables):
    ActionChains(selenium).send_keys(Keys.PAGE_DOWN).perform()
    time.sleep(2)
    PasswordEditPage(selenium, base_url, variables).save_changes_passwordcheck_enabled()

@when('I click on "Save Changes" Button')
def save_changed_button_click(selenium, base_url, variables):
    sleep(5)
    PasswordEditPage(selenium, base_url, variables).save_changes_button_click()

@when('I click on "Save Changes" Button on Change Password Page')
def save_changed_button_click(selenium, base_url, variables):
    sleep(5)
    PasswordEditPage(selenium, base_url, variables).save_changes_passwordcheck_click()


@when('I click on "Professional" edit title')
def click_on_professional_edit_title(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).click_on_professional_edit_title()


@then('The "Personal" edit fields should be editable')
def save_changed_button_click(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_personal_edit_input_fields_are_editable()


@when('I Enter the "PASSWORD_WITH_NO_UPPERCASE_LETTER" in the "New Password" field')
def enter_new_password_no_uppercase(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password("%s" % PASSWORD_NO_UPPERCASE)
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password(Keys.TAB)


@when('I Enter the "PASSWORD_WITH_NO_LOWERCASE_CHARACTER" in the "Password" field')
def enter_password_no_lowercase(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password("%s" % PASSWORD_NO_LOWERCASE)
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password(Keys.TAB)


@when('I Enter the "PASSWORD_WITH_NO_NUMBER" in the "Password" field')
def enter_password_no_lowercase(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password("%s" % PASSWORD_NO_NUMBER)
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password(Keys.TAB)


@when('I Enter the "PASSWORD_WITH_NO_LOWERCASE_UPPERCASE_CHARACTER" in the "Password" field')
def enter_password_no_lowercase(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password("%s" % PASSWORD_NUMBER_ONLY)
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password(Keys.TAB)


@when('I Enter the "PASSWORD_WITH_LESS_THAN_EIGHT_CHARACTERS" in the "Password" field')
def enter_password_no_lowercase(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password("%s" % PASSWORD_LENGTH_3_CHARS)
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password(Keys.TAB)


@when('I Enter the "PASSWORD_WITH_MORE_THAN_TWENTY_CHARACTERS" in the "Password" field')
def enter_password_no_lowercase(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password("%s" % PASSWORD_LENGTH_25_CHARS)
    PasswordEditPage(selenium, base_url, variables).fill_in_new_password(Keys.TAB)


@when(parsers.re('I should see the following "(?P<key>[a-zA-Z0-9,-? _]+)" highlighted with blue color'))
@then(parsers.re('I should see the following "(?P<key>[a-zA-Z0-9,-? _]+)" highlighted with blue color'))
def check_for_validation_message_in_blue_color(selenium, base_url, variables, key):
    messages = pytest.globalDict['i18n']['PASSWORD_VALIDATION_ERROR_MESSAGE']
    PasswordEditPage(selenium, base_url, variables).check_for_validation_under_password_input_blue_color(
        messages[key])


@when(parsers.re('I should see the following "(?P<key>[a-zA-Z0-9,-? _]+)" highlighted with red color'))
@then(parsers.re('I should see the following "(?P<key>[a-zA-Z0-9,-? _]+)" highlighted with red color'))
def check_for_validation_message_in_red_color(selenium, base_url, variables, key):
    messages = pytest.globalDict['i18n']['PASSWORD_VALIDATION_ERROR_MESSAGE']
    PasswordEditPage(selenium, base_url, variables).check_for_validation_under_password_input(
        messages[key])


@then('I should see an error "Profession is required" below the "Profession" field')
def check_profession_select_validation_msg(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_profession_select_validation_msg()


@then('I should see an error "Specialty is required" below the "Specialty" field')
def check_specialty_select_validation_msg(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_specialty_select_validation_msg()


@when(parsers.re('I select "(?P<text>.*)" from "Profession" select'), converters=dict(text=str))
def select_profession_option(selenium, base_url, variables, text):
    ProfilePage(selenium, base_url, variables).select_profession_option(text)


@when(parsers.re('I select "(?P<text>.*)" from "Speciality" select'), converters=dict(text=str))
def select_speciality_option(selenium, base_url, variables, text):
    ProfilePage(selenium, base_url, variables).select_speciality_option(text)


@then('The fields should be editable')
def check_all_input_fields_editable(selenium, base_url, variables):
    PasswordEditPage(selenium, base_url, variables).check_all_input_fields_are_editable()


@then('I close and do logout')
def close_popup_and_do_logout(selenium, base_url, variables):
    ActionChains(selenium).send_keys(Keys.PAGE_UP).perform()
    sleep(5)
    ProfilePage(selenium, base_url, variables).close_profile_click()
    sleep(5)
    ProfilePage(selenium, base_url, variables).logout_click()

#-------- Preferences --------

@then('I should be on the "Preferences" tab')
def check_preferences_tab(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_on_preferences_tab()


@when('I click on the "Preferences" tab')
def click_on_preferences_tab(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).preferences_tab_click()


@then('I should be on Edit screen of "Preferences" tab')
def check_on_preferences_edit_page(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_on_preferences_edit_page()

@then('I should see "Preferences" section')
def check_preferences_section(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_preferences_section()


@then('I should see the "Preferences" section with expected value')
def check_preferences_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['PREFERENCES'] == "None" or user['PREFERENCES'] == "NA":
        sleep(2)
    else:
        ProfilePage(selenium, base_url, variables).check_preferences_section_value(user['PREFERENCES'])


@then('I should see "Preferences Edit" button')
def check_preferences_edit_btn(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).check_preferences_edit_btn()



@then('I close the Change password Popup')
def close_popup_and_do_logout(selenium):
    ActionChains(selenium).send_keys(Keys.PAGE_UP).perform()
    sleep(3)
    close_button = selenium.find_element_by_xpath('//*[@id="changePassword"]/div/div/div/div/a[2]')
    close_button.click()
    sleep(2)



#----- Editing fields-----

@then('I should edit "Title" field')
def check_edit_title_field(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['TITLE'] == "None" or user['TITLE'] == "NA":
        sleep(2)
    else:
        ProfilePage(selenium, base_url, variables).enter_edit_title_value(user['TITLE'])


@then('I should edit "First Name" field')
def check_edit_first_name_field(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['FIRST_NAME'] == "None" or user['FIRST_NAME'] == "NA":
        sleep(2)
    else:
        ProfilePage(selenium, base_url, variables).enter_edit_firstname_value(user['FIRST_NAME'])


@then('I should edit "Last Name" field')
def check_edit_last_name_field(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['LAST_NAME'] == "None" or user['LAST_NAME'] == "NA":
        sleep(2)
    else:
        ProfilePage(selenium, base_url, variables).enter_edit_lastname_value(user['LAST_NAME'])

@then('I should edit "Email" field')
def check_edit_email_field(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['EMAIL_EDIT'] == "None" or user['EMAIL_EDIT'] == "NA":
        sleep(2)
    else:
        ProfilePage(selenium, base_url, variables).enter_edit_email_value(user['EMAIL_EDIT'])

@then('I should edit "Email Consent" field')
def check_email_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if (user['EMAIL_CONSENT'] == "None") or user['EMAIL_CONSENT'] == "NA":
        sleep(1)
    else :
        ProfilePage(selenium, base_url, variables).enter_edit_email_consent_value(user['EMAIL_CONSENT'])


@then('I click on Save button')
def save_changes_button(selenium, base_url, variables):
    ActionChains(selenium).send_keys(Keys.PAGE_DOWN).perform()
    time.sleep(2)
    PasswordEditPage(selenium, base_url, variables).save_changes_check_enabled()
    PasswordEditPage(selenium, base_url, variables).save_changes_button_click()


@then('I should edit "Profession" field')
def check_professional_profession_field(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['PROFESSION'] == "None" or user['PROFESSION'] == "NA":
        sleep(3)
    else:
        ProfilePage(selenium, base_url, variables).enter_edit_profession_value(user['PROFESSION'])



@then('I should edit "Speciality" field')
def check_professional_specialty_field(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['SPECIALITY'] == "None" or user['SPECIALITY'] == "NA":
        sleep(3)
    else :
        ProfilePage(selenium, base_url, variables).enter_edit_specialty_value(user['SPECIALITY'])




@then('I should edit "Second Speciality" field')
def check_professional_second_specialty_field(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['SECOND_SPECIALITY'] == "None" or user['SECOND_SPECIALITY'] == "NA":
        sleep(3)
    else:
        ProfilePage(selenium, base_url, variables).enter_edit_specialty_value(user['SECOND_SPECIALITY'])

@then('I should edit "Prof Registration / LSP number" field')
def check_professional_registration_field(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['REGISTRATION_NUM'] == "None" or user['REGISTRATION_NUM'] == "NA":
        sleep(3)
    else:
        ProfilePage(selenium, base_url, variables).enter_edit_registration_value(user['REGISTRATION_NUM'])



@then('I should edit "Workplace Postcode" field')
def check_professional_postcode_field(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['WORKPLACE_POSTCODE'] == "None" or user['WORKPLACE_POSTCODE'] == "NA":
        sleep(3)
    else:
        ProfilePage(selenium, base_url, variables).enter_edit_postcode_value(user['WORKPLACE_POSTCODE'])



@then('I should edit "Mailing Address AdminstrativeArea" field')
def check_maaa_edit_value(selenium,base_url,variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['MailingAAA'] == "None" or user['MailingAAA'] == "NA":
        sleep(3)
    else:
        ProfilePage(selenium, base_url, variables).enter_edit_mailingaddress_value(user['MailingAAA'])


@then('I click on Save button on Professional page')
def save_changes_button(selenium, base_url, variables):
    ActionChains(selenium).send_keys(Keys.TAB).perform()
    ActionChains(selenium).send_keys(Keys.PAGE_DOWN).perform()
    time.sleep(2)
    PasswordEditPage(selenium, base_url, variables).save_changes_professional_click()


@then('I close the Successful Change Password popup')
def close_popup_and_do_logout(selenium):
    ActionChains(selenium).send_keys(Keys.PAGE_UP).perform()
    sleep(15)
    close_button1 = selenium.find_element_by_xpath('//*[@id="changePasswordSuccess"]/div/div/div/div/a[2]')
    close_button1.click()


@then('I do logout')
def close_popup_and_do_logout(selenium,base_url,variables):
    sleep(5)
    ProfilePage(selenium, base_url, variables).logout_click()

@then('I should edit "Preferences" field')
def check_preferences_section_value(selenium, base_url, variables):
    text = pytest.globalDict['test_data']['users']['Execution_User']
    user = pytest.globalDict['test_data']['users'][text]
    if user['PREFERENCES_EDIT_1'] == "None" or user['PREFERENCES_EDIT_1'] == "NA":
        sleep(2)
    else:
        ProfilePage(selenium, base_url, variables).enter_edit_prefereneces_1_value(user['PREFERENCES_EDIT_1'])
    if user['PREFERENCES_EDIT_2'] == "None" or user['PREFERENCES_EDIT_2'] == "NA":
        sleep(2)
    else:
        ProfilePage(selenium, base_url, variables).enter_edit_prefereneces_2_value(user['PREFERENCES_EDIT_2'])
    if user['PREFERENCES_EDIT_3'] == "None" or user['PREFERENCES_EDIT_3'] == "NA":
        sleep(2)
    else:
        ProfilePage(selenium, base_url, variables).enter_edit_prefereneces_3_value(user['PREFERENCES_EDIT_3'])
    sleep(4)


@then('I click "Preferences Edit" button')
def check_preferences_edit_btn(selenium, base_url, variables):
    ProfilePage(selenium, base_url, variables).click_preferences_edit_btn()


@when('I click on "Save Changes" Button on Preferences Page')
def save_changed_button_click(selenium, base_url, variables):
    sleep(5)
    PasswordEditPage(selenium, base_url, variables).save_changes_preferences_click()



