import pytest
import re
from assertpy import assert_that
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from time import sleep

from frontend.grv_project.page_objects.base_page import BasePage
from frontend.grv_project.page_objects.locators import ProfilePageLocators
from selenium.webdriver.support.ui import Select

from selenium.common.exceptions import NoSuchElementException, ElementNotInteractableException


class ProfilePage(BasePage):
    def __init__(self, selenium, base_url,  page_name='ProfilePage'):
        super().__init__(selenium, base_url)
        self._page_name = page_name
        self._page_url = ''

    def open(self, **kwargs):
        self._selenium.get('%s%s' % (self._base_url, self._page_url))

    # ----- HEADER -----

    @property
    def _close_button(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.close_button_css)

    @property
    def _back_button(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.back_button_css)

    @property
    def _header_title(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.header_text_css)

    def back_button_click(self):
        #self._selenium.switch_to_default_content()
        self._back_button.click()

    def close_button_click(self):
        #self._selenium.switch_to_default_content()
        self._close_button.click()

    def close_button_click(self):
        #self._selenium.switch_to_default_content()
        self._close_button.click()

    def check_header(self):
        #self._selenium.switch_to_default_content()
        assert self._header_title.is_displayed()

    # ----- PERSONAL TAB -----

    @property
    def _personal_tab(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.personal_information_tab_css)

    def _preferences_tab(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.preferences_tab_css)

    @property
    def _name_label(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.name_title_css)

    @property
    def _name_item(self):
        try :
            return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.name_item_css)
        except NoSuchElementException:
            return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.name_item_br_css)


    @property
    def _title_label(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.title_title_css)

    @property
    def _title_item(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.title_item_css)

    @property
    def _consent_label(self):
        try:
            return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.consent_title_css)
        except NoSuchElementException:
            return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.consent_title_br_css)

    @property
    def _consent_item(self):
        try:
            return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.consent_item_css)
        except NoSuchElementException:
            return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.consent_item_br_css)

    @property
    def _email_label(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.email_title_css)

    @property
    def _email_item(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.email_item_css)

    @property
    def _preferences_label(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.preferences_title_css)

    @property
    def _preferences_item(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.preferences_item_css)

    @property
    def _delete_label(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.delete_title_css)

    @property
    def _delete_btn(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.delete_button_css)

    @property
    def _personal_edit_button(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.personal_edit_link)

    @property
    def _preferences_edit_button(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.preferences_edit_link)

    @property
    def _personal_edit_title(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.edit_personal_title_css)

    @property
    def _preferences_edit_title(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.edit_preferences_title_css)

    @property
    def _personal_title_select(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.edit_personal_title_select_css)

    @property
    def _personal_first_name_input(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_personal_first_name_input_css)

    @property
    def _personal_last_name_input(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.edit_personal_last_name_input_css)

    @property
    def _personal_email_input(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.edit_personal_email_input_css)

    @property
    def _edit_email_input_validation_msg(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_personal_email_validation_msg_css)

    @property
    def _edit_first_name_input_validation_msg(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_personal_first_name_validation_mgs_css)

    @property
    def _edit_last_name_input_validation_msg(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_personal_last_name_validation_mgs_css)

    def personal_tab_click(self):
        #self._selenium.switch_to_default_content()
        self._personal_tab.click()

    def check_on_personal_tab(self):
        #assert_that(self._personal_tab.get_attribute("class")).contains('personal')
        assert self._email_label.is_displayed()

    def personal_edit_click(self):
        #self._selenium.switch_to_default_content()
        self._personal_edit_button.click()

    def preferences_edit_click(self):
        #self._selenium.switch_to_default_content()
        self._preferences_edit_button.click()

    def preferences_tab_click(self):
        #self._selenium.switch_to_default_content()
        self._preferences_tab().click()

    def check_on_preferences_tab(self):
        #assert_that(self._personal_tab.get_attribute("class")).contains('personal')
        assert self._preferences_label.is_displayed()

    def check_on_preferences_edit_page(self):
        assert self._preferences_edit_title.is_displayed()
        assert self._preferences_edit_title.text == pytest.globalDict['i18n']['PROFILE']['EDIT_PREFERENCES']['TITLE']

    def check_preferences_section(self):
        assert self._preferences_label.is_displayed()
        assert self._preferences_label.text == pytest.globalDict['i18n']['PROFILE']['PREFERENCES']['PREFERENCES_LABEL']
        assert self._preferences_item.is_displayed()

    def check_preferences_section_value(self, text):
        assert self._preferences_item.text == text

    def check_on_personal_edit_page(self):
        assert self._personal_edit_title.is_displayed()
        assert self._personal_edit_title.text == pytest.globalDict['i18n']['PROFILE']['EDIT_PERSONAL']['TITLE']

    def check_email_section(self):
        assert self._email_label.is_displayed()
        assert self._email_label.text == pytest.globalDict['i18n']['PROFILE']['PERSONAL']['EMAIL_LABEL']
        assert self._email_item.is_displayed()

    def check_email_section_value(self, text):
        assert self._email_item.text == text

    def check_name_section(self):
        assert self._name_label.is_displayed()
        assert self._name_label.text == pytest.globalDict['i18n']['PROFILE']['PERSONAL']['NAME_LABEL']
        assert self._name_item.is_displayed()

    def check_name_section_value(self, text):
        print(self._name_item.text)
        assert self._name_item.text == text

    def check_title_section(self):
        assert self._title_label.is_displayed()
        assert self._title_label.text == pytest.globalDict['i18n']['PROFILE']['PERSONAL']['TITLE_LABEL']
        assert self._title_item.is_displayed()

    def check_title_section_value(self, text):
        assert self._title_item.text == text

    def check_consent_section(self):
        assert self._consent_label.is_displayed()
        assert self._consent_label.text == pytest.globalDict['i18n']['PROFILE']['PERSONAL']['CONSENT_MSG']
        assert self._consent_item.is_displayed()

    def check_consent_section_value(self, text):
        assert self._consent_item.text == text

    def check_delete_section(self):
        assert self._delete_label.is_displayed()
        assert self._delete_label.text == pytest.globalDict['i18n']['PROFILE']['PERSONAL']['DELETE_LABEL']
        assert self._delete_btn.is_displayed()

    def check_edit_title_field(self):
        assert self._personal_title_select.is_displayed()

    def check_edit_first_name_field(self):
        assert self._personal_first_name_input.is_displayed()

    def check_edit_last_name_field(self):
        assert self._personal_last_name_input.is_displayed()

    def check_edit_email_field(self):
        assert self._personal_email_input.is_displayed()

    def check_last_name_field_characters(self):
        #self._selenium.switch_to_default_content()
        text = 'TestLastName123@#$+'
        self._personal_last_name_input.clear()
        self._personal_last_name_input.send_keys(text)
        assert_that(self._personal_last_name_input.get_attribute("value")).is_equal_to('TestLastName')

    def check_first_name_field_characters(self):
        ##self._selenium.switch_to_default_content()
        text = 'TestFirstName123@#$+'
        self._personal_first_name_input.clear()
        self._personal_first_name_input.send_keys(text)
        assert_that(self._personal_first_name_input.get_attribute("value")).is_equal_to('TestFirstName')

    def clear_email_input(self):
        #self._selenium.switch_to_default_content()
        self._personal_email_input.clear()
        self._personal_edit_title.click()

    def clear_first_name_input(self):
        #self._selenium.switch_to_default_content()
        self._personal_first_name_input.clear()
        self._personal_edit_title.click()

    def clear_last_name_input(self):
        #self._selenium.switch_to_default_content()
        self._personal_last_name_input.clear()
        self._personal_edit_title.click()

    def clear_registration_input(self):
        #self._selenium.switch_to_default_content()
        self._professional_edit_registration.clear()

    def clear_postcode_input(self):
        #self._selenium.switch_to_default_content()
        self._professional_edit_postcode.clear()

    def check_email_input_validation_msg(self):
        #self._selenium.switch_to_default_content()
        self._edit_email_input_validation_msg.is_displayed()
        assert self._edit_email_input_validation_msg.text == pytest.globalDict['i18n']['PROFILE']['EDIT_PERSONAL'][
            'EMAIL_VALIDATION_EMPTY']

    def check_email_input_validation_format_msg(self):
        #self._selenium.switch_to_default_content()
        #assert self._edit_email_input_validation_msg.is_displayed()
        print(self._edit_email_input_validation_msg.text)
        assert self._edit_email_input_validation_msg.text == pytest.globalDict['i18n']['PROFILE']['EDIT_PERSONAL'][
            'EMAIL_VALIDATION_FORMAT']

    def check_first_name_input_validation_msg(self):
        #self._selenium.switch_to_default_content()
        self._edit_first_name_input_validation_msg.is_displayed()
        assert self._edit_first_name_input_validation_msg.text == pytest.globalDict['i18n']['PROFILE']['EDIT_PERSONAL'][
            'FIRST_NAME_VALIDATION']

    def check_last_input_validation_msg(self):
        #self._selenium.switch_to_default_content()
        self._edit_last_name_input_validation_msg.is_displayed()
        assert self._edit_last_name_input_validation_msg.text == pytest.globalDict['i18n']['PROFILE']['EDIT_PERSONAL'][
            'SECOND_NAME_VALIDATION']

    def enter_edit_email_value(self, text):
        #self._selenium.switch_to_default_content()
        self._personal_email_input.clear()
        self._personal_email_input.send_keys(text)
        self._personal_edit_title.click()

    def enter_edit_title_value(self, text):
        #self._selenium.switch_to_default_content()
        self._selenium.find_element(By.XPATH,
                                    value="//*[@id=\"grv_edit_profile_editProfile_nextgenSalutation_chosen\"]").click()
        text1 = "//*[@id=\"grv_edit_profile_editProfile_nextgenSalutation_chosen\"]/div/ul/li[text()=\""+str(text)+"\"]"
        title_edit = self._selenium.find_element(By.XPATH, value = text1)
        #SeleniumGenerics.select_dropdown_value(self,locator=title_edit,value = str(text))
        title_edit.click()
        self._personal_edit_title.click()

    def enter_edit_firstname_value(self, text):
        #self._selenium.switch_to_default_content()
        firstname_edit = self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.edit_personal_first_name_input_css)
        firstname_edit.clear()
        firstname_edit.send_keys(text)
        self._personal_edit_title.click()

    def enter_edit_lastname_value(self, text):
        #self._selenium.switch_to_default_content()
        lastname_edit = self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.edit_personal_last_name_input_css)
        lastname_edit.clear()
        lastname_edit.send_keys(text)
        self._personal_edit_title.click()


    def enter_edit_email_consent_value(self, text):
        #self._selenium.switch_to_default_content()
        text1 = "//main/div/div[1]/form/div[5]/div/div[contains(@class,\"true\")]/label"
        text2 = "//main/div/div[1]/form/div[5]/div/div[contains(@class,\"false\")]/label"
        yes = "Yes"
        if text.casefold() == yes.casefold() :
            emailconsent_edit = self._selenium.find_element(By.XPATH, value = text1)
            emailconsent_edit.click()
        else:
            emailconsent_edit = self._selenium.find_element(By.XPATH, value=text2)
            emailconsent_edit.click()


    # ----- PROFESSION TAB -----

    @property
    def _profession_tab(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.professional_information_tab_css)

    @property
    def _profession_label(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.profession_title_css)

    @property
    def _profession_item(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.profession_item_css)

    @property
    def _specialty_label(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.specialty_title_css)

    @property
    def _specialty_item(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.specialty_item_css)

    @property
    def _second_specialty_label(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.second_specialty_title_css)

    @property
    def _second_specialty_item(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.second_specialty_item_css)

    @property
    def _registration_label(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.registration_title_css)

    @property
    def _registration_item(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.registration_item_css)

    @property
    def _postcode_label(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.postcode_title_css)

    @property
    def _postcode_item(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.postcode_item_css)

    @property
    def _mailingAAA_label(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.mailingAAA_title_css)

    @property
    def _mailingAAA_item(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.mailingAAA_item_css)

    @property
    def _profession_edit_button(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.professional_edit_link)

    @property
    def _profession_edit_title(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.edit_professional_title_css)

    @property
    def _professional_edit_profession(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_professional_profession_select_css)

    @property
    def _professional_edit_specialty(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_professional_specialty_select_css)

    @property
    def _professional_edit_second_specialty(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_professional_second_specialty_select_css)

    @property
    def _professional_edit_registration(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_professional_registration_input_css)

    @property
    def _professional_edit_mailaddress(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_professional_mailaddress_input)

    @property
    def _professional_edit_postcode(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_professional_postcode_input_css)

    def profession_tab_click(self):
        #self._selenium.switch_to_default_content()
        self._profession_tab.click()

    def check_on_profession_tab(self):
        #assert_that(self._profession_tab.get_attribute("class")).contains('link-active')
        assert self._profession_label.is_displayed()

    def profession_edit_click(self):
        #self._selenium.switch_to_default_content()
        self._profession_edit_button.click()

    def check_on_profession_edit_page(self):
        assert self._profession_edit_title.is_displayed()
        assert self._profession_edit_title.text == pytest.globalDict['i18n']['PROFILE']['EDIT_PROFESSIONAL']['TITLE']

    def check_profession_section(self):
        assert self._profession_label.is_displayed()
        assert self._profession_label.text == pytest.globalDict['i18n']['PROFILE']['PROFESSIONAL']['PROFESSION_LABEL']
        assert self._profession_item.is_displayed()

    def check_profession_section_value(self, text):
        assert self._profession_item.text == text

    def check_specialty_section(self):
        assert self._specialty_label.is_displayed()
        assert self._specialty_label.text == pytest.globalDict['i18n']['PROFILE']['PROFESSIONAL']['SPECIALTY_LABEL']
        assert self._specialty_item.is_displayed()

    def check_specialty_section_value(self, text):
        assert self._specialty_item.text == text

    def check_second_specialty_section(self):
        assert self._second_specialty_label.is_displayed()
        assert self._second_specialty_label.text == pytest.globalDict['i18n']['PROFILE']['PROFESSIONAL'][
            'SECOND_SPECIALTY_LABEL']
        assert self._second_specialty_item.is_displayed()

    def check_second_specialty_section_value(self, text):
        assert self._second_specialty_item.text == text

    def check_registration_section(self):
        assert self._registration_label.is_displayed()
        assert self._registration_label.text == pytest.globalDict['i18n']['PROFILE']['PROFESSIONAL'][
            'REGISTRATION_LABEL']
        assert self._registration_item.is_displayed()

    def check_registration_section_value(self, text):
        assert self._registration_item.text == text

    def check_postcode_section(self):
        assert self._postcode_label.is_displayed()
        assert self._postcode_label.text == pytest.globalDict['i18n']['PROFILE']['PROFESSIONAL']['POSTCODE_LABEL']
        assert self._postcode_item.is_displayed()

    def check_postcode_section_value(self, text):
        assert self._postcode_item.text == text

    def check_mailingAAA_section(self):
        assert self._mailingAAA_label.is_displayed()
        assert self._mailingAAA_label.text == pytest.globalDict['i18n']['PROFILE']['PROFESSIONAL']['MAILINGADDRESS_LABEL']
        assert self._mailingAAA_item.is_displayed()

    def check_mailingAAA_section_value(self, text):
        assert self._mailingAAA_item.text == text

    def check_professional_profession_field(self):
        assert self._professional_edit_profession.is_displayed()

    def check_professional_specialty_field(self):
        assert self._professional_edit_specialty.is_displayed()

    def check_professional_second_specialty_field(self):
        assert self._professional_edit_second_specialty.is_displayed()

    def check_professional_registration_field(self):
        assert self._professional_edit_registration.is_displayed()

    def check_professional_postcode_field(self):
        assert self._professional_edit_postcode.is_displayed()

    @property
    def _edit_profession_select_validation_msg(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_professional_profession_validation_msg_css)

    @property
    def _edit_specialty_select_validation_msg(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_professional_specialty_validation_msg_css)

    @property
    def _edit_registration_input_validation_msg(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_professional_registration_validation_msg_css)

    @property
    def _edit_postcode_input_validation_msg(self):
        return self._selenium.find_element(By.CSS_SELECTOR,
                                           value=ProfilePageLocators.edit_professional_postcode_validation_msg_css)

    def enter_edit_registration_value(self, text):
        #self._selenium.switch_to_default_content()
        self._professional_edit_registration.clear()
        self._professional_edit_registration.send_keys(text)

    def enter_edit_postcode_value(self, text):
        #self._selenium.switch_to_default_content()
        self._professional_edit_postcode.clear()
        self._professional_edit_postcode.send_keys(text)


    def enter_edit_profession_value(self, text):
        #self._selenium.switch_to_default_content()
        self._selenium.find_element(By.XPATH,
                                    value="//*[@id=\"grv_edit_profile_editProfileProfessional_nextgenDesignationName_chosen\"]").click()
        text1 = "//*[@id=\"grv_edit_profile_editProfileProfessional_nextgenDesignationName_chosen\"]/div/ul/li[text()=\""+str(text)+"\"]"
        title_edit = self._selenium.find_element(By.XPATH, value = text1)
        #SeleniumGenerics.select_dropdown_value(self,locator=title_edit,value = str(text))
        title_edit.click()


    def enter_edit_specialty_value(self, text):
        #self._selenium.switch_to_default_content()
        self._selenium.find_element(By.XPATH,
                                    value="//*[@id=\"grv_edit_profile_editProfileProfessional_nextgenDesignationSpecialty_chosen\"]").click()
        text1 = "//*[@id=\"grv_edit_profile_editProfileProfessional_nextgenDesignationSpecialty_chosen\"]/div/ul/li[text()=\""+str(text)+"\"]"
        title_edit = self._selenium.find_element(By.XPATH, value = text1)
        title_edit.click()


    def enter_edit_mailingaddress_value(self, text):
        #self._selenium.switch_to_default_content()
        self._selenium.find_element(By.XPATH,
                                    value="//*[@id=\"grv_edit_profile_editProfileProfessional_nextgenMailingAddressAdministrativeArea_chosen\"]").click()
        text1 = "//*[@id=\"grv_edit_profile_editProfileProfessional_nextgenMailingAddressAdministrativeArea_chosen\"]/div/ul/li[text()=\""+str(text)+"\"]"
        title_edit = self._selenium.find_element(By.XPATH, value = text1)
        title_edit.click()
        sleep(1)

    def enter_edit_prefereneces_1_value(self, text):
        #self._selenium.switch_to_default_content()
        self._selenium.find_element(By.XPATH,
                                    value="//*[@id=\"grv_edit_profile_editProfileExtra_therapyAreas_chosen\"][@data-drop-down=\"drop_down_number_0\"]").click()

        text1 = "//*[@id=\"grv_edit_profile_editProfileExtra_therapyAreas_chosen\"][@data-drop-down=\"drop_down_number_0\"]/div/ul/li[text()=\""+str(text)+"\"]"
        sleep(5)
        text2=self._selenium.find_element(By.XPATH, value = text1)
        #self._selenium.execute_script("arguments[0].click();", text1)
        ActionChains(self._selenium).move_to_element(text2).click(text2).perform()
        #SeleniumGenerics.select_dropdown_value(self,locator=title_edit,value = str(text))
        #title_edit.click()

    def enter_edit_prefereneces_2_value(self, text):
        #self._selenium.switch_to_default_content()
        self._selenium.find_element(By.XPATH,
                                    value="//*[@id=\"grv_edit_profile_editProfileExtra_therapyAreas_chosen\"][@data-drop-down=\"drop_down_number_1\"]").click()
        text1 = "//*[@id=\"grv_edit_profile_editProfileExtra_therapyAreas_chosen\"][@data-drop-down=\"drop_down_number_1\"]/div/ul/li[text()=\""+str(text)+"\"]"
        text2 = self._selenium.find_element(By.XPATH, value = text1)
        #SeleniumGenerics.select_dropdown_value(self,locator=title_edit,value = str(text))
        ActionChains(self._selenium).move_to_element(text2).click(text2).perform()

    def enter_edit_prefereneces_3_value(self, text):
        #self._selenium.switch_to_default_content()
        self._selenium.find_element(By.XPATH,
                                    value="//*[@id=\"grv_edit_profile_editProfileExtra_therapyAreas_chosen\"][@data-drop-down=\"drop_down_number_2\"]").click()
        text1 = "//*[@id=\"grv_edit_profile_editProfileExtra_therapyAreas_chosen\"][@data-drop-down=\"drop_down_number_2\"]/div/ul/li[text()=\""+str(text)+"\"]"
        text2= self._selenium.find_element(By.XPATH, value = text1)
        #SeleniumGenerics.select_dropdown_value(self,locator=title_edit,value = str(text))
        ActionChains(self._selenium).move_to_element(text2).click(text2).perform()


    # ----- PASSWORD TAB -----

    @property
    def _password_tab(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.password_tab_css)

    @property
    def _password_label(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.password_title_css)

    @property
    def _password_item(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.password_item_css)

    @property
    def _password_edit_title(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.edit_password_title_css)

    @property
    def _password_edit_button(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.password_edit_link)

    @property
    def _submit_disabled_btn(self):
        return self._selenium.find_element(By.CSS_SELECTOR, value=ProfilePageLocators.edit_submit_disabled_button)

    def password_tab_click(self):
        #self._selenium.switch_to_default_content()
        self._password_tab.click()

    def check_on_password_tab(self):
        #assert_that(self._password_tab.get_attribute("class")).contains('link-active')
        assert self._password_label.is_displayed()

    def check_password_section(self):
        assert self._password_label.is_displayed()
        assert self._password_label.text == pytest.globalDict['i18n']['PROFILE']['PASSWORD']['PASSWORD_LABEL']
        assert self._password_item.is_displayed()

    def check_password_hiding(self):
        value = self._password_item.text
        assert re.match('^\•+$', value)

    def password_edit_click(self):
        #self._selenium.switch_to_default_content()
        self._password_edit_button.click()

    def check_personal_edit_btn(self):
        assert self._personal_edit_button.is_displayed()
        assert self._personal_edit_button.text == pytest.globalDict['i18n']['PROFILE']['EDIT_BUTTON']

    def check_preferences_edit_btn(self):
        assert self._preferences_edit_button.is_displayed()
        assert self._preferences_edit_button.text == pytest.globalDict['i18n']['PROFILE']['PREFERENCES']['EDIT_BUTTON']

    def check_professional_edit_btn(self):
        assert self._profession_edit_button.is_displayed()
        assert self._profession_edit_button.text == pytest.globalDict['i18n']['PROFILE']['EDIT_BUTTON']

    def check_password_edit_btn(self):
        assert self._password_edit_button.is_displayed()
        assert self._password_edit_button.text == pytest.globalDict['i18n']['PROFILE']['EDIT_BUTTON']

    def check_back_btn(self):
        assert self._back_button.is_displayed()

    def check_close_btn(self):
        assert self._close_button.is_displayed()

    def check_on_password_edit_page(self):
        assert self._password_edit_title.is_displayed()
        assert self._password_edit_title.text == pytest.globalDict['i18n']['PROFILE']['EDIT_PASSWORD']['TITLE']

    def check_on_profession_edit_page(self):
        assert self._profession_edit_title.is_displayed()
        assert self._profession_edit_title.text == pytest.globalDict['i18n']['PROFILE']['EDIT_PROFESSIONAL']['TITLE']

    def click_on_password_tab_edit_link(self):
        #self._selenium.switch_to_default_content()
        element = self._selenium.find_element_by_css_selector(ProfilePageLocators.password_edit_link)
        element.click()

    def check_personal_edit_input_fields_are_editable(self):
        #self._selenium.switch_to_default_content()
        assert 'disabled' not in (self._personal_title_select.get_attribute("class"))
        assert 'disabled' not in (self._personal_first_name_input.get_attribute("class"))
        assert 'disabled' not in (self._personal_last_name_input.get_attribute("class"))
        assert 'disabled' not in (self._personal_email_input.get_attribute("class"))

    def check_professional_edit_input_fields_are_editable(self):
        #self._selenium.switch_to_default_content()
        assert 'disabled' not in (self._professional_edit_profession.get_attribute("class"))
        assert 'disabled' not in (self._professional_edit_specialty.get_attribute("class"))
        text = pytest.globalDict['test_data']['users']['Execution_User']
        user = pytest.globalDict['test_data']['users'][text]
        if [user['SECOND_SPECIALITY'] == "None" or user['SECOND_SPECIALITY'] == "NA"] and [user['WORKPLACE_POSTCODE'] == "None" or user['WORKPLACE_POSTCODE'] == "NA"]:
            sleep(3)
        else:
            assert 'disabled' not in (self._professional_edit_second_specialty.get_attribute("class"))
            assert 'disabled' not in (self._professional_edit_postcode.get_attribute("class"))
        if user['MailingAAA'] == "None" or user['MailingAAA'] == "NA":
            sleep(3)
        else:
            assert 'disabled' not in (self._professional_edit_mailaddress.get_attribute("class"))
        assert 'disabled' not in (self._professional_edit_registration.get_attribute("class"))


    def select_profession_option(self, text):
        #self._selenium.switch_to_default_content()
        select = Select(self._professional_edit_profession)
        select.select_by_visible_text(text)

    def select_speciality_option(self, text):
        #self._selenium.switch_to_default_content()
        select = Select(self._professional_edit_specialty)
        select.select_by_visible_text(text)

    def select_second_speciality_option(self, text):
        #self._selenium.switch_to_default_content()
        select = Select(self._professional_edit_second_specialty)
        select.select_by_visible_text(text)

    def enter_registration_value(self, text):
        #self._selenium.switch_to_default_content()
        self._professional_edit_registration.clear()
        self._professional_edit_registration.send_keys(text)

    def enter_postcode_value(self, text):
        #self._selenium.switch_to_default_content()
        self._professional_edit_postcode.clear()
        self._professional_edit_postcode.send_keys(text)

    def click_on_professional_edit_title(self):
        self._profession_edit_title.click()

    def click_preferences_edit_btn(self):
        self._preferences_edit_button.click()

    def check_profession_select_validation_msg(self):
        #self._selenium.switch_to_default_content()
        self._edit_profession_select_validation_msg.is_displayed()
        assert self._edit_profession_select_validation_msg.text == \
               pytest.globalDict['i18n']['PROFILE']['EDIT_PROFESSIONAL']['PROFESSION_VALIDATION']

    def check_specialty_select_validation_msg(self):
        #self._selenium.switch_to_default_content()
        self._edit_specialty_select_validation_msg.is_displayed()
        assert self._edit_specialty_select_validation_msg.text == \
               pytest.globalDict['i18n']['PROFILE']['EDIT_PROFESSIONAL']['SPECIALTY_VALIDATION']

    def check_registration_input_validation_msg(self):
        #self._selenium.switch_to_default_content()
        self._edit_registration_input_validation_msg.is_displayed()
        assert self._edit_registration_input_validation_msg.text == \
               pytest.globalDict['i18n']['PROFILE']['EDIT_PROFESSIONAL']['REGISTRATION_VALIDATION']

    def check_registration_input_format_validation_msg(self):
        #self._selenium.switch_to_default_content()
        self._edit_registration_input_validation_msg.is_displayed()
        assert self._edit_registration_input_validation_msg.text == \
               pytest.globalDict['i18n']['PROFILE']['EDIT_PROFESSIONAL']['REGISTRATION_FORMAT_VALIDATION']

    def check_postcode_input_validation_msg(self):
        #self._selenium.switch_to_default_content()
        self._edit_postcode_input_validation_msg.is_displayed()
        assert self._edit_postcode_input_validation_msg.text == \
               pytest.globalDict['i18n']['PROFILE']['EDIT_PROFESSIONAL']['POSTCODE_VALIDATION']

    def check_postcode_input_format_validation_msg(self):
        #self._selenium.switch_to_default_content()
        self._edit_postcode_input_validation_msg.is_displayed()
        assert self._edit_postcode_input_validation_msg.text == \
               pytest.globalDict['i18n']['PROFILE']['EDIT_PROFESSIONAL']['POSTCODE_FORMAT_VALIDATION']

    def close_profile_click(self):
        ##self._selenium.switch_to_default_content()
        sleep(5)
        try:
            close_button1 = self._selenium.find_element_by_xpath('//*[@id="viewProfile"]/div/div/div[1]/div/a[1]')
            close_button1.click()
        except ElementNotInteractableException:
            close_button = self._selenium.find_element_by_xpath(
                '//*[@id="changePassword" or @id="editProfile" or @id="viewProfile" or @id="changePasswordSuccess"]/div/div/div/div/a[2]')
            close_button.click()
        #js = 'document.querySelector("#viewProfile > div > div > div.header-addon > div > a.app-close.js-close-modal")'
        #self._selenium.execute_script(js)
        sleep(2)

    def logout_click(self):
        sleep(1)
        x = self._selenium.find_element_by_xpath('//*[@id="i5lcs"]')
        x.click()
        #js = "document.querySelector("#i5lcs")"
        #self._selenium.execute_script(js)
        sleep(2)
