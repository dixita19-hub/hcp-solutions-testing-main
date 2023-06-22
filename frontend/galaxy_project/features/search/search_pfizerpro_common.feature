@nondestructive @search @usabove @ukabove
Feature: Common Galaxy Automated Regression - Search Results

    Background:
        Given I am on the page '/'
        And Browser is maximized
        When I switch pfizerpro market accordingly with consent for 'UKAbove > hcp_confirmation_yes' and 'UKAbove > cookie_accept_all_button'
        #Wait for UI to load
        When I pause for '2' s
        When I click on item 'UKAbove > search_icon'

    @TR-C396161 @automated @regression @prio1
    Scenario: Verify Search Icon from Content Page
        When I am on the page '/explore-content'
        Then The element 'UKAbove > search_icon' is displayed

    @TR-C396170 @automated @regression @prio1
    Scenario: Verify that Search Icon is not displayed on PfizerPro Search Results Page
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all'
        Then I expect that element 'UKAbove > search_icon' is not displayed

    @TR-C396169 @automated @regression @prio1
    Scenario: Verify 'Your Results' Title on Search Results Page
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '10' seconds
        When I set text 'Pfizer' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then The element 'SearchPageLocators > search_results_title' is displayed

    @TR-C872863 @automated @regression @prio1
    Scenario: Verify Search Performed from Content Page
        When I am on the page '/explore-content'
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '5' seconds
        And The element 'SearchPageLocators > search_button' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'Pfizer' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_result_cards' is displayed
        Then I expect that element 'SearchPageLocators > search_result_cards' is displayed

    @TR-C872311 @automated @regression @prio1
    Scenario: Search PfizerPro - HCP: Verify Website Brand MetaTag Syntax for AboveBrand PfizerPro Sites
        Given The element 'SearchPageLocators > search_button' is displayed
        Then I expect that attribute 'content' for non ui element 'SearchPageLocators > website_brand' to be 'Unbranded'

    @TR-C874272 @automated @regression @prio1
    Scenario: Verify NoMatch Search Performed from Search Input Field from Content Page triggers No Results page
        When I am on the page '/explore-content'
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '5' seconds
        And The element 'SearchPageLocators > search_button' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'PfizerNoResults' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And I click on item 'SearchPageLocators > search_button'
        Then The element 'SearchPageLocators > search_no_results_title' is displayed
