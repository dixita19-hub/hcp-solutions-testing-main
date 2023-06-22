@nondestructive @medical @usabove
Feature: Common Medical Galaxy Regression - Medical Search Results

    Background:
        Given I am on the page '/'
        And Browser is maximized
        When I pause for '3' s
        And The element 'SearchPageLocators > MedicalUS > consent_continue_button' is displayed
        And I move to element 'SearchPageLocators > MedicalUS > consent_continue_button'
        And The element 'SearchPageLocators > MedicalUS > consent_continue_button' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > consent_continue_button'

   @TR-C396171 @automated @regression @prio1
    Scenario: Verify that Search Icon is not displayed on Medical Search Results Page
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing 'search=all'
        Then I expect that element 'UKAbove > search_icon' is not displayed

    @TR-C872861 @automated @regression @prio1
    Scenario: Verify 'Your Results' Title on Medical Search Results Page
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '10' seconds
        When I set text 'Efficacy' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then The element 'SearchPageLocators > MedicalUS > medical_your_results' is displayed

    @TR-C872862 @automated @regression @prio1
    Scenario: Verify Medical Search Input Field
        Then The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        When I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        Then I expect that element 'SearchPageLocators > MedicalUS > medical_search_input_field' becomes visible within '3' seconds
        And I expect that element 'SearchPageLocators > search_input_field_inactive' is displayed
        And I expect that attribute 'placeholder' for element 'SearchPageLocators > MedicalUS > medical_search_input_field' to be 'Medical search term'
        When I click on item 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then I expect that element 'SearchPageLocators > search_input_field_active' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'Efficacy' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then I expect that attribute 'value' for element 'SearchPageLocators > MedicalUS > medical_search_input_field' to be 'Efficacy'
        When I move to element 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I press backspace '8' times on field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then I expect that attribute 'value' for element 'SearchPageLocators > MedicalUS > medical_search_input_field' to be ''
        When I move to element 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I set text 'Keyword' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then I expect that attribute 'value' for element 'SearchPageLocators > MedicalUS > medical_search_input_field' to be 'Keyword'
        When I click on item 'SearchPageLocators > search_clear_button'
        Then I expect that attribute 'value' for element 'SearchPageLocators > MedicalUS > medical_search_input_field' to be ''

    @TR-C396167 @automated @regression @prio1
    Scenario: Verify Search Performed from Content Page
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        And The element 'SearchPageLocators > MedicalUS > medical_search_input_field' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I set text 'Treatments' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_cta'
        Then The element 'SearchPageLocators > MedicalUS > medical_your_results' is displayed

    @TR-C872864 @automated @regression @prio1
    Scenario: Verify Search Icon from Content Page
        When I am on the page '/productsanddiseases'
        Then The element 'UKAbove > search_icon' is displayed

    @TR-C874224 @automated @regression @prio1
    Scenario: Verify Website Brand MetaTag Syntax for Medical Site
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        And The element 'SearchPageLocators > MedicalUS > medical_search_input_field' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Given The element 'SearchPageLocators > MedicalUS > medical_search_cta' is displayed
        Then I expect that attribute 'content' for non ui element 'SearchPageLocators > website_brand' to be 'Unbranded'
