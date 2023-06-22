@nondestructive @medical @usabove
Feature: UK Medical Galaxy Regression - Medical Search Results

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
        When I am on the page '/search/uk-medical-search?search=efficacy'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '30' seconds
        Then I expect that element 'UKAbove > search_icon' is not displayed

