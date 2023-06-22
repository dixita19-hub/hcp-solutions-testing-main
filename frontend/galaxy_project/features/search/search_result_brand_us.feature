@nondestructive @search @usabove
Feature: US Brand Galaxy Automated Regression - Search Results

    Background:
        Given I am on the page '/'
        And Browser is maximized
        When I click on item 'UKAbove > search_icon'
        And The title is 'Home | Pfizer For Professionals'

    @TR-C211199 @automated @regression @prio1
    Scenario: Verify whether the “Your Results” label on Brand site is hidden
        When I am on the page '/search/brand-search-us'
        Then I expect that element 'SearchPageLocators > search_us_brand_input_field' becomes visible within '30' seconds
        And The element 'SearchPageLocators > search_us_brand_button' is displayed
        When I move to element 'SearchPageLocators > search_us_brand_input_field'
        And I set text 'pfizer' to field 'SearchPageLocators > search_us_brand_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_us_brand_button' is displayed
        When I am on the page '/search/brand-search-us?search=Pfizer'
        Then I expect that element 'SearchPageLocators > search_us_brand_input_field' becomes visible within '30' seconds
        Then The element 'SearchPageLocators > search_page_footer' is displayed
        Then I expect that element 'SearchPageLocators > search_results_counter_text' becomes visible within '30' seconds
        Then The element 'SearchPageLocators > search_results_title_prompt' is not displayed
