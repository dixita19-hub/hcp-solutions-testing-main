@nondestructive @search @usabove @search_us
Feature: US Galaxy Automated Regression - Search Results

    Background:
        Given I am on the page '/'
        And Browser is maximized
        When I click on item 'UKAbove > search_icon'
        And The title is 'Home | Pfizer For Professionals'

    @TR-C365282 @automated @regression @prio1
    Scenario: Verify US Search results are displayed on clicking search button
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        And The element 'SearchPageLocators > search_button' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'Product' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_result_cards' is displayed
        Then I expect that element 'SearchPageLocators > search_result_cards' is displayed

    @TR-C365281 @automated @regression @prio1
    Scenario: Search results note displayed on searching the results
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        And The element 'SearchPageLocators > search_button' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        Then I expect that element 'SearchPageLocators > search_result_note' is displayed

    @TR-C365280 @automated @regression @prio1
    Scenario: Verify US search is re-directed to proper URL
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        And The element 'SearchPageLocators > search_button' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        Then I expect that the title is 'Search | Pfizer For Professionals'
        And The page url contains 'search=all'

    @TR-C365279 @automated @regression @prio1
    Scenario: Verify Pfizer Medical Site link in footer note is properly accessible
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        And The element 'SearchPageLocators > search_button' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_page_footer' is displayed
        Then I expect that element 'SearchPageLocators > search_result_note' is displayed
        When I move to element 'SearchPageLocators > footer_medical_site_link'
        And The element 'SearchPageLocators > footer_medical_site_link' is displayed
        And I click on item 'SearchPageLocators > footer_medical_site_link'
        And I switch to newly opened tab
        Then I expect that the title contains 'Medical'

    @TR-C211202 @automated @regression @prio1
    Scenario: Verify whether Search Tips block appears for the No Results page on US AboveBrand PfizerPro site
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        And The element 'SearchPageLocators > search_button' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'AllPfizerResults' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_page_footer' is displayed
        And The element 'SearchPageLocators > search_no_results_title' is displayed
        Then The element 'SearchPageLocators > search_tips_title' is displayed

    @TR-C211945 @automated @regression @prio1
    Scenario: Verify Search Results Counter
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        And The element 'SearchPageLocators > search_button' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        Then The element 'SearchPageLocators > search_page_footer' is displayed
        And The element 'SearchPageLocators > search_results_title' is displayed
        And The element 'SearchPageLocators > search_results_counter_text' is displayed
        When I get the total search results using 'SearchPageLocators > search_results_counter_text' and save as environment variable 'TOTAL_RESULTS_COUNT'
        Then The page url contains 'search=all'
        And The element 'SearchPageLocators > search_results_title' text is 'Your Results'
        And The element 'SearchPageLocators > search_results_counter_text' text is 'Showing 1 - 10 of {%TOTAL_RESULTS_COUNT%} results'

    @TR-C211191 @automated @regression @prio1
    Scenario: Verify Page Tabs does not display on AboveBrand PfizerPro on Search
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        And The element 'SearchPageLocators > search_button' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        Then The element 'SearchPageLocators > search_page_footer' is displayed
        And The element 'SearchPageLocators > search_results_title' is displayed
        And The element 'SearchPageLocators > search_tabs' is not displayed

    @TR-C211353 @automated @regression @prio1
    Scenario: Verify Search Query Encoding (EncodeURIComponent)
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all results' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%20results'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all!' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%21'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all@' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%40'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all#' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%23'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all#' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%23'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all%' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%25'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all^' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%5E'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all(' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%28'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all)' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%29'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all=' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%3D'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all+' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%2B'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all:' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%3A'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all;' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%3B'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all"' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%22'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all\' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%5C'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all?' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%3F'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all[' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%5B'
        When I navigate backward
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        When I set text 'all]' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > search_button' is displayed
        When I click on item 'SearchPageLocators > search_button'
        Then I should see element 'SearchPageLocators > search_page_footer' load with page url containing 'search=all%5D'

    @TR-C378023 @automated @regression @prio1
    Scenario: Verify (US Style) Search Input Field
        Then The element 'SearchPageLocators > search_icon_close' is displayed
        When I click on item 'SearchPageLocators > search_icon'
        Then The element 'SearchPageLocators > search_icon_search' is displayed
        When I click on item 'SearchPageLocators > search_icon'
        Then The element 'SearchPageLocators > search_icon_close' is displayed
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        And I expect that element 'SearchPageLocators > search_input_field_inactive' is displayed
        And I expect that attribute 'placeholder' for element 'SearchPageLocators > search_input_field' to be 'Search for product information and resources'
        When I click on item 'SearchPageLocators > search_input_field'
        Then I expect that element 'SearchPageLocators > search_input_field_active' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'Keyword' to field 'SearchPageLocators > search_input_field'
        Then I expect that attribute 'value' for element 'SearchPageLocators > search_input_field' to be 'Keyword'
        When I move to element 'SearchPageLocators > search_input_field'
        And I press backspace '7' times on field 'SearchPageLocators > search_input_field'
        Then I expect that attribute 'value' for element 'SearchPageLocators > search_input_field' to be ''
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'Keyword' to field 'SearchPageLocators > search_input_field'
        Then I expect that attribute 'value' for element 'SearchPageLocators > search_input_field' to be 'Keyword'
        When I click on item 'SearchPageLocators > search_clear_button'
        Then I expect that attribute 'value' for element 'SearchPageLocators > search_input_field' to be ''

    @TR-C396162 @automated @regression @prio1
    Scenario: Verify AutoComplete on (US Style) Search Input Field from Content Page
        When The element 'SearchPageLocators > search_input_field' is displayed
        And The element 'SearchPageLocators > search_button' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'pfi' to field 'SearchPageLocators > search_input_field'
        Then I expect that element 'SearchPageLocators > search_input_field_has_suggestions' becomes visible within '30' seconds
        And The element 'SearchPageLocators > search_input_field_suggestion_title' is displayed with innertext
            | Search suggestion |
        And The element 'SearchPageLocators > suggestion_item1' is displayed
        When I click on item 'SearchPageLocators > suggestion_item1'
        Then I expect that attribute 'value' for element 'SearchPageLocators > search_input_field' to be 'pfizer'
        When I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_results_section' is displayed
        Then The page url contains 'search=pfizer'
        # since the page has redirected we need to check for the input field before checking its value to
        # avoid a hard pause
        And I expect that element 'SearchPageLocators > search_results_counter_text' becomes visible within '30' seconds
        And The element 'SearchPageLocators > search_results_section' is displayed
        And I expect that element 'SearchPageLocators > search_input_field' becomes visible within '30' seconds
        #When I pause for '5' s
        Then I expect that attribute 'value' for element 'SearchPageLocators > search_input_field' to be 'pfizer'

    @TR-C396163 @automated @regression @prio1
    Scenario: Search PfizerPro - Verify Search Button
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And The element 'SearchPageLocators > search_button' is displayed with innertext
            | Search |
        When I click on item 'SearchPageLocators > search_input_field'
        Then I expect that element 'SearchPageLocators > search_input_field_active' is displayed
        And I expect element 'SearchPageLocators > search_button' is not enabled
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        Then I expect that element 'SearchPageLocators > search_button' is enabled
        When I click on item 'SearchPageLocators > search_clear_button'
        Then I expect element 'SearchPageLocators > search_button' is not enabled

    @TR-C874271 @automated @regression @prio1
    Scenario: Search PfizerPro US - Verify Partial Search Performed from Search Input Field from Content Page triggers DYM page
        When I set text 'Pfiza' to field 'SearchPageLocators > search_input_field'
        And I click on item 'SearchPageLocators > search_button'
        Then I expect that element 'SearchPageLocators > dym_message' is displayed
    
