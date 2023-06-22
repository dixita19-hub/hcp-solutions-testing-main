class LandingPageLocators:
    landing_pfizer_menu = "//helix-core-menu[@id='in6c62'] ~ .helix-core-menu__toggle.hydrated ~ .button.button--primary.button--size--large"
    landing_pfizer_account = "//helix-core-menu/helix-core-button[1]"
    landing_pfizer_eu_uk_stg = "//grv5-oauth-login[@id='iz109'] ~ #grv5logIn"
    landing_login_username = "input[name=\"username\"]"
    landing_login_password = "input[name=\"password\"]"
    landing_login_submit = "button[type=\"submit\"]"
    landing_sign_in_link = "//grv-login-flow/grv-step-controller/div/grv-step/div/div/div/div/div[2]/div[2]/grv-button/div/helix-button/button"


class LoginPageLocators:
    register_button = '//button[@name="nextgenRegisterLink"]/i'
    sign_in_form_displayed = '//button[@id="grv_sign_in_signIn_nextgenSignInButton"]'
    close_button = '//a[@class="app-close app-close--home js-close-modal"]'
    email_field = '//input[@id="grv_sign_in_signIn_nextgenEmailSignIn"]'
    password_field = '//input[@id="grv_sign_in_signIn_nextgenPassword"]'
    password_mask_button = '//*[@id="grv_sign_in_signIn_form_item_nextgenPassword"]/i[2]'
    log_in_button = '//button[@id="grv_sign_in_signIn_nextgenSignInButton"]'
    login_button_state = '//button[@id="grv_sign_in_signIn_nextgenSignInButton"]'
    login_button_enabled = '//button[@id="grv_sign_in_signIn_nextgenSignInButton"]'
    login_button_disabled = '//button[@id="grv_sign_in_signIn_nextgenSignInButton" and @disabled="null"]'
    email_input_validation_message = '//*[@id="grv_sign_in_signIn_form_item_nextgenEmailSignIn"]/div[2]'
    validation_message_elem = '//form[@id="capture_signIn_signInForm"]/div[2]/div'
    validation_password_message_elem = 'div#grv_sign_in_signIn_form_item_nextgenPassword div.grv_tip_error'
    generic_validation_message_both_inputs = 'div[id*="grv_signIn_userInformationForm_errorMessages"][class*="grv_message_wrapper"]'
    sign_in_form = '*[@id=\"capture_signIn_signInForm\"]'
    forgot_password_button = '//a[@id="grv_sign_in_signIn_nextgenForgotPasswordLink"]'
    sign_out_btn_uk_stg = "//grv5-oauth-login[@id='iz109'] ~ #grv5Logout"


class ForgotPasswordPageLocators:
    forgot_password_title = '//*[@id="forgotPassword"]/div/div/div/div/div/h1'
    request_new_password_h1 = '//*[@id="forgotPassword"]/div/div/div/main/div/div/h2'
    registered_email_address_input = '//input[@id="grv_sign_in_forgotPassword_nextgenEmailSignIn"]'
    request_new_password_button_enabled = '//button[@id="grv_sign_in_forgotPassword_nextgenForgotPasswordSendButton"]'
    request_new_password_button_disabled = '//button[@id="grv_sign_in_forgotPassword_nextgenForgotPasswordSendButton" and @disabled="null" ]'
    request_new_password_email_sent_notification = '//*[@id="forgotPasswordSuccess"]/div/div/div/main/div/div[1]/p'
    request_new_password_validation_message = 'div#grv_sign_in_forgotPassword_form_item_nextgenEmailSignIn div.grv_tip_error'


class ThankYouForRegistrationPageLocators:
    thank_you_for_registering_header = '//div[@class=\'registration-email-verification-success-heading\']'
    thank_you_for_registration_main_subheader = '//div[contains(@class,\'auth-screen\')]//div[@class=\'registration-email-verification-success-subheading\'][1]'


class RegistrationPageLocators:
    pfizer_logo = "//helix-core-logo"
    first_name_field = "//input[@name='nextgenFirstName']"
    first_name_placeholder = '//input[@id="capture_traditionalRegistration_givenName"]'
    first_name_validation_message = "//input[@name='nextgenFirstName']/following-sibling::div[@class='grv_tip_error']"
    last_name = "//input[@name='nextgenLastName']"
    last_name_placeholder = "//button[text()=\"Register\"]"
    last_name_validation_message = "//input[@name='nextgenLastName']/following-sibling::div[@class='grv_tip_error']"
    # email = '//input[@id="capture_traditionalRegistration_emailAddress"]'
    email = "//input[@type='email' and @name='nextgenEmailRegistration']"
    email_placeholder = "//button[text()=\"Register\"]"
    email_input_validation_message = "//input[@type='email' and @name='nextgenEmailRegistration']/following-sibling::div[@class='grv_tip_error']"
    continue_button = "//button[text()=\"Continue\"]"
    # continue_button_xpath = "//button[@type=\"button\"][contains(@class,continue-button)][./i]"
    title_input = '//div[@id="grv_sign_in_traditionalRegistration_nextgenSalutation_chosen"]'
    title_input_mr = "//div[@id='grv_sign_in_traditionalRegistration_nextgenSalutation_chosen']//li[@class='active-result'][1]"
    title_input_css = "select#capture_traditionalRegistration_salutation_select"
    privacy_link_css = "a[href*=\"privacy-policy\"]"
    close_button_xpath = "//h1[normalize-space()='Register']/following-sibling::a/img[@class='app-close__icon']"
    # continue_button_xpath = "//button[@class=\"continue-button\"]"
    continue_button_xpath = "//button[@class='button p-register__continue']"
    continue_button_form1 = "//div[@id='grv-slide-one']//button[@type='button']"
    continue_button_form2 = "//div[@id='grv-slide-two']//button[@type='button']"
    continue_button_form3 = "//div[@id='grv-slide-three']//button[@type='button']"
    License_number_dropdown = "//label[@for='grv_sign_in_traditionalRegistration_nextgenlicenseType']"
    back_button_xpath = "//h1[normalize-space()='Register']/following-sibling::a[@class='header-addon__back js-back-button']/img"
    pref_language_xpath = "//div[@id='grv_sign_in_traditionalRegistration_nextgenPreferredLanguage_chosen']"
    pref_language_index_1 = "//div[@id='grv_sign_in_traditionalRegistration_nextgenPreferredLanguage_chosen']//li[@class='active-result'][1]"



class RegistrationPageStep2SignupLocators:
    profession_select_css = "select#capture_traditionalRegistration_designation_name_select"
    speciality_css = "select#capture_traditionalRegistration_designation_specialty_select"
    speciality_xpath = "//div[@id='grv_sign_in_traditionalRegistration_nextgenDesignationSpecialty_chosen']"
    second_speciality_select_css = "select#capture_traditionalRegistration_designation_specialty2_select"
    workplace_postcode_input_css = "input[id=\"capture_traditionalRegistration_primaryAddress_postalCode\"]"
    registration_lsp_number_input_css = "input[id=\"capture_traditionalRegistration_license_number\"]"
    continue_button_css = "button[class=\"continue-button\"]"
    speciality_one_validation_error = 'div#capture_traditionalRegistration_form_item_designation_specialty_select div.capture_tip_error'
    profession_validation_error = 'div#capture_traditionalRegistration_form_item_designation_name_select div.capture_tip_error'
    postcode_validation_error = '#capture_traditionalRegistration_form_item_primaryAddress_postalCode div.capture_tip_error'
    license_validation_error = '#capture_traditionalRegistration_form_item_license_number div.capture_tip_error'
    back_button_xpath = '//div[@class="register-back"]/div/i'
    step_one_navigation_indication_bar = '//div[@class="progress"]//a[1]'
    license_tooltip_xpath = '//div[@id="capture_traditionalRegistration_form_item_license_number"]/span[@class="tooltiptext"][contains(text(),\'Alliance Healthcare Account number\')][1]'
    license_number_selection = "//div[@id='grv_sign_in_traditionalRegistration_nextgenlicenseType_chosen']"
    license_number_index_one = "//div[@id='grv_sign_in_traditionalRegistration_nextgenlicenseType_chosen']//li[position()=2]"
    license_number_index_three = "//div[@id='grv_sign_in_traditionalRegistration_nextgenlicenseType_chosen']//li[position()=4]"
    professional_designation = "//div[@id='grv_sign_in_traditionalRegistration_nextgenDesignationName_chosen']"
    professional_designation_index_one = "//div[@id='grv_sign_in_traditionalRegistration_nextgenDesignationName_chosen']//li[position()=2]"
    speciality_dd = "//div[@id='grv_sign_in_traditionalRegistration_nextgenDesignationSpecialty_chosen']"
    speciality_dd_index1 = "//div[@id='grv_sign_in_traditionalRegistration_nextgenDesignationSpecialty_chosen']//li[position()=2]"
    state_dd = "//div[@id='grv_sign_in_traditionalRegistration_nextgenmailingAddressAdministrativeArea_chosen']"
    state_dd_index1 = "//div[@id='grv_sign_in_traditionalRegistration_nextgenmailingAddressAdministrativeArea_chosen']//li[position()=2]"
    office_street_address = "//input[@id='grv_sign_in_traditionalRegistration_nextgenmailingAddressStreetName1']"
    city_xpath = "//input[@id='grv_sign_in_traditionalRegistration_nextgenmailingAddressMunicipality']"
    postal_code_xpath = "//input[@id='grv_sign_in_traditionalRegistration_nextgenMailingAddressPostalCode']"
    business_number_xpath = "//input[@id='grv_sign_in_traditionalRegistration_nextgenPhoneNumberWork']"
    dea_number_input = "//input[@id='grv_sign_in_traditionalRegistration_licenseNumberdea']"
    therapy_area_inputs = "//div[@id='grv_sign_in_traditionalRegistration_nextgentherapyAreas_chosen']"
    profession_dropdown = "//div[@id='grv_sign_in_traditionalRegistration_nextgenDesignationName_chosen']"
    profession_dropdown_option = "//div[@id='grv_sign_in_traditionalRegistration_nextgenDesignationName_chosen']//li[@data-option-array-index='1']"
    speciality_dropdown = "//div[@id='grv_sign_in_traditionalRegistration_nextgenDesignationSpecialty_chosen']"
    second_speciality_dropdown = "//div[@id='grv_sign_in_traditionalRegistration_designationSpecialty2_chosen']"
    speciality_dropdown_option = "//div[@id='grv_sign_in_traditionalRegistration_nextgenDesignationSpecialty_chosen']//li[@data-option-array-index='1']"
    second_speciality_dropdown_option = "//div[@id='grv_sign_in_traditionalRegistration_designationSpecialty2_chosen']//li[@data-option-array-index='2']"
    workplace_xpath = "//input[@id='grv_sign_in_traditionalRegistration_nextgenMailingAddressPostalCode']"
    lsp_xpath = "//input[@id='grv_sign_in_traditionalRegistration_nextgenLicenseNumber']"
    therapy_area_1 = "//div[@data-drop-down-container='drop_down_container_number_0']"
    therapy_area_2 = "//div[@data-drop-down-container='drop_down_container_number_1']"
    therapy_area_3 = "//div[@data-drop-down-container='drop_down_container_number_2']"
    therapy_area_option_1 = "//div[@data-drop-down-container='drop_down_container_number_0']//li[@data-option-array-index='0']"
    therapy_area_option_2 = "//div[@data-drop-down-container='drop_down_container_number_1']//li[@data-option-array-index='1']"
    therapy_area_option_3 = "//div[@data-drop-down-container='drop_down_container_number_2']//li[@data-option-array-index='2']"


class RegistrationPageStep3SignupLocators:
    work_outline_xpath = "//i[normalize-space()='work_outline']"
    password_xpath = "//input[@id='grv_sign_in_traditionalRegistration_nextgenPasswordRegistration']"
    confirm_password_xpath = "//input[@id='grv_sign_in_traditionalRegistration_nextgenPasswordRegistationConfirm']"
    password_to_create_input_css = 'input#capture_traditionalRegistration_newPassword'
    password_to_confirm_input_css = 'input#capture_traditionalRegistration_newPasswordConfirm'
    healthcare_resident_checkbox_css = 'input#capture_traditionalRegistration_acknowledgement_professional_checkbox'
    confirm_checkbox_css = 'input#capture_traditionalRegistration_acknowledgement_consent_checkbox'
    complete_registration_xpath = "//button[@id='grv_sign_in_traditionalRegistration_nextgenCreateAccountButton']"
    privacy_cookie_policy_link_css = 'a[href*="pfizerprocouk-privacy-policy"][class="privacy_three"]'
    terms_of_use_link_css = 'a[href*="terms-of-use"][class="terms_link"]'
    back_button_xpath = "//h1[normalize-space()='Register']/following-sibling::a[@class='header-addon__back js-back-button']/img"
    step_two_navbar_css = 'div#indicator-two'
    step_one_navbar_css = 'div#indicator-one'
    close_button_css = 'div#registration_close i'
    close_button = "//h1[normalize-space()='Register']/following-sibling::a/img[@class='app-close__icon']"
    certify_check = "//label[@for='grv_sign_in_traditionalRegistration_nextgenAcknowledgementConsent']//div[@class='square']"
    consent_check = "//label[@for='grv_sign_in_traditionalRegistration_nextgenAcknowledgementTerms']"




class PrivacyPolicyPagelocators:
    title_css = '#site-name'


class HomePageLocators:
    # title(en): "Home | Pfizer for Professionals"
    # title_xpath = "//*[@id=\"i4voj\"]"
    title_xpath = '//helix-core-logo[@class="hydrated"]'
    authorized_user_widget = "//body[@auth-state='logged-in']"
    pfizer_logo = "//helix-core-logo"


class PasswordEditPageLocators:
    current_password_input = '#grv_edit_profile_changePassword_nextgenOldPassword'
    new_password_input = '#grv_edit_profile_changePassword_nextgenNewPassword'
    confirm_new_password_input = '#grv_edit_profile_changePassword_nextgenNewPasswordConfirm'
    current_password_validation_message = '#grv_signIn_changePasswordForm_errorMessages > div'
    current_password_validation_message_after_submission = '#capture_manageProfile_security_changePasswordForm_errorMessages>div'
    new_password_validation_message = '#capture_manageProfile_security_form_item_newPassword>div.capture_tip_error[data-elementname="newPassword"]'
    confirm_password_validation_message = '#capture_manageProfile_security_form_item_newPasswordConfirm>[class="capture_tip_error"][data-elementname="newPasswordConfirm"]'
    save_changes_button_enabled = '#grv_edit_profile_editProfile_nextgenSaveButton'
    save_changes_button_disabled = '#grv_edit_profile_editProfile_nextgenSaveButton[disabled=null]'
    save_changes_passwordbutton_disabled='#grv_edit_profile_changePassword_nextgenSaveChangesButton[disabled=null]'
    save_changes_passwordbutton1_disabled = '#grv_edit_profile_changePassword_nextgenSaveButton[disabled=null]'
    save_changes_passwordbutton_enabled = '#grv_edit_profile_changePassword_nextgenSaveChangesButton'
    save_changes_passwordbutton1_enabled = '#grv_edit_profile_changePassword_nextgenSaveButton'
    save_changes_professionalbutton_disabled ='#grv_edit_profile_editProfileProfessional_nextgenSaveButton[disabled=null]'
    save_changes_professionalbutton_enabled = '#grv_edit_profile_editProfileProfessional_nextgenSaveButton'
    save_changes_preferencesbutton_enabled = '#grv_edit_profile_editProfileExtra_nextgenSaveButton'

class ProfilePageLocators:
    # HEADER
    back_button_css = '#viewProfile > div > div > div.header-addon > div > a.header-addon__back.js-back-button'
    close_button_css = '#viewProfile > div > div > div.header-addon > div > a.app-close.js-close-modal'
    cloe_button_icon_css = '//*[@id="viewProfile"]/div/div/div[1]/div/a[2]'
    header_text_css = '#viewProfile > div > div > div.header-addon > div > h1'

    # TAB HEADER
    personal_information_tab_css = 'div.accordion__panel.grv-accordion-personal.collapsed'
    professional_information_tab_css = 'div.accordion__panel.collapsed.grv-accordion-professional'
    password_tab_css = 'div.accordion__panel.grv-accordion-password.grv_traditional_account_only.collapsed'
    preferences_tab_css = 'div > div.accordion__panel.collapsed.grv-accordion-extra'

    # ----- PERSONAL INFORMATION TAB -----
    personal_tab_content_css = 'div.profile-personal-tab-content'
    personal_edit_link = 'div.accordion__panel.grv-accordion-personal.expanded > div > div.accordion__edit > a'
    # email
    email_title_css = '#grv_edit_profile_viewProfile_stringdata_nextgenEmailRegistration > label'
    email_item_css = '#grv_edit_profile_viewProfile_nextgenEmailRegistration'
    # title
    title_title_css = '#grv_edit_profile_viewProfile_stringdata_nextgenSalutation > label'
    title_item_css = '#grv_edit_profile_viewProfile_nextgenSalutation'
    # name
    name_title_css = 'div.accordion__panel.grv-accordion-personal.expanded > div > label'
    name_item_css = '#grv_edit_profile_viewProfile_stringdata_nextGenViewProfileName > label'
    name_item_br_css = 'div.accordion__panel.grv-accordion-personal.expanded > div > div:nth-child(5) > div:nth-child(1)'
    # consent
    consent_title_css = '#grv_edit_profile_viewProfile_stringdata_nextgenEditProfileEmail > label'
    consent_title_br_css = '#grv_edit_profile_viewProfile_stringdata_emailPermissionSubscribed > label'
    consent_item_css = '#grv_edit_profile_viewProfile_nextgenEditProfileEmail'
    consent_item_br_css = '#grv_edit_profile_viewProfile_emailPermissionSubscribed'
    # delete
    delete_title_css = '#grv_viewProfile_redact_link > label'
    delete_button_css = '#grv_viewProfile_redact_link > div > a'

    # ----- Preferences INFORMATION TAB -----
    preferences_tab_content_css = 'div.profile-preferences-tab-content'
    preferences_edit_link = 'div.accordion__panel.grv-accordion-extra.expanded > div > div.accordion__edit > a'
    # preferences
    preferences_title_css = '#grv_edit_profile_viewProfile_stringdata_therapyAreasViewProfile > label'
    preferences_item_css = '#grv_edit_profile_viewProfile_therapyAreasViewProfile'



    # ----- PROFESSIONAL INFORMATION TAB -----
    professional_tab_content_css = 'div.profile-professional-tab-content'
    professional_edit_link = 'div.accordion__panel.grv-accordion-professional.expanded > div > div.accordion__edit > a'
    # profession
    profession_title_css = '#grv_edit_profile_viewProfile_stringdata_nextgenDesignationName > label'
    profession_item_css = '#grv_edit_profile_viewProfile_nextgenDesignationName'
    # specialty
    specialty_title_css = '#grv_edit_profile_viewProfile_stringdata_nextgenDesignationSpecialty > label'
    specialty_item_css = '#grv_edit_profile_viewProfile_nextgenDesignationSpecialty'
    # second specialty
    second_specialty_title_css = '#grv_edit_profile_viewProfile_stringdata_designationSpecialty2 > label'
    second_specialty_item_css = '#grv_edit_profile_viewProfile_designationSpecialty2'
    # registration
    registration_title_css = '#grv_edit_profile_viewProfile_stringdata_nextgenLicenseNumber > label'
    registration_item_css = '#grv_edit_profile_viewProfile_nextgenLicenseNumber'
    # postcode
    postcode_title_css = '#grv_edit_profile_viewProfile_stringdata_nextgenMailingAddressPostalCode > label'
    postcode_item_css = '#grv_edit_profile_viewProfile_nextgenMailingAddressPostalCode'
    # mailingaddressadminstrative area
    mailingAAA_title_css = '#grv_edit_profile_viewProfile_stringdata_nextgenMailingAddressAdministrativeArea > label'
    mailingAAA_item_css = '#grv_edit_profile_viewProfile_nextgenMailingAddressAdministrativeArea'

    # ----- PASSWORD TAB -----
    password_tab_content_css = 'div.profile-password-tab-content'
    password_edit_link = 'div.accordion__panel.grv-accordion-password.grv_traditional_account_only.expanded > div > div.accordion__edit > a'
    # password
    password_title_css = 'div.accordion__panel.grv-accordion-password.grv_traditional_account_only.expanded > div > div.grv_data_item.grv_stringdata_nextgenPassword > label'
    password_item_css = 'div.accordion__panel.grv-accordion-password.grv_traditional_account_only.expanded > div > div.grv_data_item.grv_stringdata_nextgenPassword > div'

    # ----- EDIT PERSONAL INFORMATION -----
    edit_personal_title_css = '#grv_signIn_editProfileForm > h1'
    # title
    edit_personal_title_select_css = '#grv_edit_profile_editProfile_form_item_nextgenSalutation'
    edit_personal_title_options_css = '#grv_edit_profile_editProfile_nextgenSalutation'
    edit_personal_title_selected_option_css = '#grv_edit_profile_editProfile_nextgenSalutation > option[selected=selected] '
    edit_personal_title_validation_msg_css = ''
    # first name
    edit_personal_first_name_input_css = '#grv_edit_profile_editProfile_nextgenFirstName'
    edit_personal_first_name_validation_mgs_css = '#grv_edit_profile_editProfile_form_item_nextgenFirstName > div.grv_tip_error'
    # last name
    edit_personal_last_name_input_css = '#grv_edit_profile_editProfile_nextgenLastName'
    edit_personal_last_name_validation_mgs_css = '#grv_edit_profile_editProfile_form_item_nextgenLastName > div.grv_tip_error'
    # email
    edit_personal_email_input_css = '#grv_edit_profile_editProfile_nextgenEmailRegistration'
    edit_personal_email_validation_msg_css = '#grv_edit_profile_editProfile_form_item_nextgenEmailRegistration > div.grv_tip_error'
    # consent
    edit_personal_consent_label_css = '#grv_edit_profile_editProfile_form_item_nextgenEditProfileEmail > p'
    edit_personal_consent_checkbox_css = 'input#capture_manageProfile_data_acknowledgement_consent_checkbox'

    # ----- EDIT PERSONAL INFORMATION -----
    edit_professional_title_css = '#grv_signIn_editProfileProfessionalForm > h1'
    # profession
    edit_professional_profession_select_css = '#grv_edit_profile_editProfileProfessional_nextgenDesignationName_chosen'
    edit_professional_profession_options_css = '#grv_edit_profile_editProfileProfessional_nextgenDesignationName'
    edit_professional_profession_selected_option_css = edit_professional_profession_options_css + ' > option[selected=selected]'
    edit_professional_profession_validation_msg_css = '#capture_manageProfile_data_form_item_designation_name_select .capture_tip_error'
    # specialty
    edit_professional_specialty_select_css = '#grv_edit_profile_editProfileProfessional_form_item_nextgenDesignationSpecialty'
    edit_professional_specialty_options_css = edit_professional_specialty_select_css + ' > option'
    edit_professional_specialty_selected_option_css = edit_professional_specialty_options_css + ' > option[selected=selected]'
    edit_professional_specialty_validation_msg_css = '#capture_manageProfile_data_form_item_designation_specialty_select .capture_tip_error'
    # second specialty
    edit_professional_second_specialty_select_css = '#grv_edit_profile_editProfileProfessional_form_item_designationSpecialty2'
    edit_professional_second_specialty_options_css = '#grv_edit_profile_editProfileProfessional_designationSpecialty2 > option'
    edit_professional_second_specialty_validation_msg_css = '#capture_manageProfile_data_form_item_designation_specialty2_select .capture_tip_error'
    # registration
    edit_professional_registration_input_css = '#grv_edit_profile_editProfileProfessional_nextgenLicenseNumber'
    edit_professional_registration_validation_msg_css = '#grv_edit_profile_editProfileProfessional_form_item_nextgenLicenseNumber > div.grv_tip_error'
    # postcode
    edit_professional_postcode_input_css = '#grv_edit_profile_editProfileProfessional_nextgenMailingAddressPostalCode'
    edit_professional_postcode_validation_msg_css = '#grv_edit_profile_editProfileProfessional_form_item_nextgenMailingAddressPostalCode > div.grv_tip_error'
    #MAA
    edit_professional_mailaddress_input ='#grv_edit_profile_editProfileProfessional_nextgenMailingAddressAdministrativeArea_chosen'

    # ------ Edit Prefrences -----

    edit_preferences_title_css = '#grv_signIn_editProfileExtraForm > h1'

    # ----- EDIT PASSWORD -----
    edit_password_title_css = '#grv_signIn_changePasswordForm > h2'
    # current password
    edit_password_current_input_css = '#grv_edit_profile_changePassword_nextgenOldPassword'
    edit_password_current_toggle_css = '#grv_edit_profile_changePassword_form_item_nextgenOldPassword > i.material-icon.input__icon.input__icon-right.input__icon-password'
    edit_password_current_validation_msg_css = '#grv_edit_profile_changePassword_form_item_nextgenOldPassword > div.grv_tip_error'
    # new password
    edit_password_new_input_css = '#grv_edit_profile_changePassword_nextgenNewPassword'
    edit_password_new_toggle_css = '#grv_edit_profile_changePassword_form_item_nextgenNewPassword > i.material-icon.input__icon.input__icon-right.input__icon-password'
    edit_password_new_validation_msg_css = ''
    # confirm password
    edit_password_confirm_input_css = '#grv_edit_profile_changePassword_nextgenNewPasswordConfirm'
    edit_password_confirm_toggle_css = '#grv_edit_profile_changePassword_form_item_nextgenNewPasswordConfirm > i.material-icon.input__icon.input__icon-right.input__icon-password'
    edit_password_confirm_validation_msg_css = ''
    # password validation
    edit_password_length_css = '#grv_edit_profile_changePassword_form_item_nextgenNewPassword > div.grv_tips_container > div:nth-child(1)'
    edit_password_upper_css = '#grv_edit_profile_changePassword_form_item_nextgenNewPassword > div.grv_tips_container > div:nth-child(2)'
    edit_password_lower_css = '#grv_edit_profile_changePassword_form_item_nextgenNewPassword > div.grv_tips_container > div:nth-child(3)'
    edit_password_number_css = '#grv_edit_profile_changePassword_form_item_nextgenNewPassword > div.grv_tips_container > div:nth-child(4)'
    edit_password_contains_css = '#grv_edit_profile_changePassword_form_item_nextgenNewPassword > div.grv_tips_container > div:nth-child(5)'
    edit_password_match_css = '#grv_edit_profile_changePassword_form_item_nextgenNewPasswordConfirm > div.grv_tips_container '

    # ----- COMMON EDIT ELEMENTS -----
    # acknowledgement text
    edit_professional_acknowledgement_text_css = '#capture_acknowlegdement_text'
    # buttons
    edit_submit_button = '#grv_edit_profile_editProfile_nextgenSaveButton'
    edit_cancel_button = '#grv_signIn_editProfileForm > div.input__submit > a'
    edit_submit_disabled_button = '#grv_edit_profile_editProfile_nextgenSaveButton[disabled=null]'
