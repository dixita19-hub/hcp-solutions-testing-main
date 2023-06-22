@nondestructive @search @ukabove
Feature: UK Galaxy Automated Regression - Search Results

    Background:
        Given I am on the page '/'
        And Browser is maximized
        When I click on item 'UKAbove > hcp_confirmation_yes'
        When I click on item 'UKAbove > cookie_accept_all_button'
        And I click on item 'UKAbove > search_icon'
        # we have to wait for the search field animation to finish
        And I pause for '1' s
        And The title is 'Home | PfizerPro UK'

    @TR-C211623 @automated @regression @prio1
    Scenario: Search for 'all'
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_results_title' is displayed
        And The element 'SearchPageLocators > search_results_counter_text' is displayed
        And I get the total search results using 'SearchPageLocators > search_results_counter_text' and save as environment variable 'TOTAL_RESULTS_COUNT'
        Then The page url contains 'search=all'
        And The element 'SearchPageLocators > search_results_title' text is 'Your Results'
        And The element 'SearchPageLocators > search_results_counter_text' text is 'Showing 1 - 10 of {%TOTAL_RESULTS_COUNT%} results'
        And The element 'SearchPageLocators > PI_title' text is 'Prescribing Information can be found on individual pages about our medicines'
        And I expect '10' elements of 'SearchPageLocators > search_result_cards' are displayed

    @TR-C365291 @automated @regression @prio1
    Scenario: Verify search is re-directed to proper URL
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        Then I expect that the title is 'all brand search | PfizerPro UK'
        And The page url contains 'search=all'

    @TR-C365292 @automated @regression @prio1
    Scenario: Verify pagination if there are more than 10 search results
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_results_title' is displayed
        And The element 'SearchPageLocators > search_results_counter_text' is displayed
        And I get the total search results using 'SearchPageLocators > search_results_counter_text' and save as environment variable 'TOTAL_RESULTS_COUNT'
        And I calculate the last page no. given 'TOTAL_RESULTS_COUNT' and save as environment variable 'LAST_PAGE_NO'
        Then I expect that element 'SearchPageLocators > search_pagination' is displayed
        And I expect element 'SearchPageLocators > search_pagination_back_button' is not enabled
        And I expect value '1' is not enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        And I expect value '2' is enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        When I move to element 'SearchPageLocators > p_last_number'
        Then The last page number 'SearchPageLocators > p_last_number' is displayed according to '{%LAST_PAGE_NO%}'

    @TR-C365293 @automated @regression @prio1
    Scenario: No search results are found from the search criteria
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'Chantix' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_no_results_title' is displayed
        Then The element 'SearchPageLocators > search_no_results_title' text is 'No results found'

    @TR-C365294 @automated @regression @prio1
    Scenario: Recent Searches section is properly displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'Word1' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > recent_searches_section' is displayed
        Then I expect that element 'SearchPageLocators > recent_searches_section' is displayed

    @TR-C365295 @automated @regression @prio1
    Scenario: Entered search value is always displayed as first recent search item
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'Word1' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > rs_item1' is displayed
        Then The element 'SearchPageLocators > rs_item1' contains the text 'Word1'
        When I click on item 'SearchPageLocators > search_clear_button'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'Word2' to field 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And I move to element 'SearchPageLocators > rs_item1'
        And The element 'SearchPageLocators > rs_item1' is displayed
        Then The element 'SearchPageLocators > rs_item1' contains the text 'Word2'

    @TR-C365296 @automated @regression @prio1
    Scenario: User is re-directed to appropriate link after clicking on recent search item
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I enter '2' terms of 'Word' to field 'SearchPageLocators > search_input_field' and click element 'SearchPageLocators > search_button'
        And I move to element 'SearchPageLocators > rs_item1'
        And I click on item 'SearchPageLocators > rs_item1'
        Then I expect that the title is 'all brand search | PfizerPro UK'
        And The page url contains 'search=Word2'

    @TR-C365297 @automated @regression @prio1
    Scenario: Randomly clicked search item is displayed at first recent search item position and user re-directed to appropriate url
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I enter '3' terms of 'Word' to field 'SearchPageLocators > search_input_field' and click element 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > random_search_item' is displayed
        And I click on item 'SearchPageLocators > random_search_item'
        And The element 'SearchPageLocators > rs_item1' is displayed
        Then I expect that element 'SearchPageLocators > search_no_results_title' becomes visible within '10' seconds
        Then I expect that the title is 'all brand search | PfizerPro UK'
        When I set text 'WordTest' to field 'SearchPageLocators > search_input_field'
        Then The element 'SearchPageLocators > rs_item1' contains the text 'Word1'
        And The page url contains 'search=Word1'

    @TR-C365298 @automated @regression @prio1
    Scenario: After entering six items, the sixth item is displayed at first position and fourth position item is displayed at fifth position
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '30' seconds
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I enter '6' terms of 'Word' to field 'SearchPageLocators > search_input_field' and click element 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > rs_item1' is displayed
        Then The element 'SearchPageLocators > rs_item1' contains the text 'Word6'
        When I move to element 'SearchPageLocators > rs_item5'
        Then The element 'SearchPageLocators > rs_item5' contains the text 'Word2'

    @TR-C365299 @automated @regression @prio1
    Scenario: Verify recent search items order
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I enter '5' terms of 'Word' to field 'SearchPageLocators > search_input_field' and click element 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > recent_searches_section' is displayed
        Then The recent search items order is:
            | SearchPageLocators > rs_item1 | SearchPageLocators > rs_item2 | SearchPageLocators > rs_item3 | SearchPageLocators > rs_item4 | SearchPageLocators > rs_item5 |

    @TR-C365300 @automated @regression @prio1
    Scenario: Search result displayed in proper format
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'information' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_results_section' is displayed
        And I move to element 'SearchPageLocators > search_results_section'
        Then I expect that element 'SearchPageLocators > search_results_heading' is displayed
        And I expect that element 'SearchPageLocators > search_results_content' is displayed

    @TR-C365301 @automated @regression @prio1
    Scenario: Verify search box and search button are active after entering text in the search box
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'Bosulif' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        Then I expect that element 'SearchPageLocators > search_input_field_active' is displayed
        And The element 'SearchPageLocators > search_button' is enabled

    @TR-C365302 @automated @regression @prio1
    Scenario: Verify pagination buttons enable/disable feature
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'information' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_pagination_back_button' is displayed
        And I move to element 'SearchPageLocators > search_pagination_back_button'
        And I click on page number value '3' for element 'SearchPageLocators > search_pagination_page_no_button'
        # needs for pagination, we don't have an element to wait for
        And I pause for '2' s
        Then I expect that element 'SearchPageLocators > search_pagination_back_button' is enabled
        And I expect value '1' is enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        And I expect value '3' is not enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        And I expect element 'SearchPageLocators > search_pagination_forward_button' is not enabled

    @TR-C365303 @automated @regression @prio1
    Scenario: Verify pagination forward navigation
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_results_title' is displayed
        And The element 'SearchPageLocators > search_results_counter_text' is displayed
        And I get the total search results using 'SearchPageLocators > search_results_counter_text' and save as environment variable 'TOTAL_RESULTS_COUNT'
        And I move to element 'SearchPageLocators > search_pagination'
        And I click on item 'SearchPageLocators > search_pagination_forward_button'
        # needs for pagination, we don't have an element to wait for
        And I pause for '2' s
        And I move to element 'SearchPageLocators > search_results_counter_text'
        Then The element 'SearchPageLocators > search_results_counter_text' text is 'Showing 11 - 20 of {%TOTAL_RESULTS_COUNT%} results'
        When I move to element 'SearchPageLocators > search_pagination'
        Then I expect value '2' is not enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        And I expect value '1' is enabled for element 'SearchPageLocators > search_pagination_page_no_button'

    @TR-C365304 @automated @regression @prio1
    Scenario: Verify pagination back navigation
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_results_title' is displayed
        And The element 'SearchPageLocators > search_results_counter_text' is displayed
        And I get the total search results using 'SearchPageLocators > search_results_counter_text' and save as environment variable 'TOTAL_RESULTS_COUNT'
        And I move to element 'SearchPageLocators > search_pagination'
        And I click on page number value '2' for element 'SearchPageLocators > search_pagination_page_no_button'
        # needs for pagination, we don't have an element to wait for
        And I pause for '2' s
        And I move to element 'SearchPageLocators > search_results_counter_text'
        And The element 'SearchPageLocators > search_results_counter_text' is displayed
        Then The element 'SearchPageLocators > search_results_counter_text' text is 'Showing 11 - 20 of {%TOTAL_RESULTS_COUNT%} results'
        When I move to element 'SearchPageLocators > search_pagination'
        Then I expect value '2' is not enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        And I expect value '1' is enabled for element 'SearchPageLocators > search_pagination_page_no_button'

    @TR-C365305 @automated @regression @prio1
    Scenario: Verify pagination functionality for Adhoc Visible Point
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_results_title' is displayed
        And The element 'SearchPageLocators > search_results_counter_text' is displayed
        And I get the total search results using 'SearchPageLocators > search_results_counter_text' and save as environment variable 'TOTAL_RESULTS_COUNT'
        And I move to element 'SearchPageLocators > search_pagination_forward_button'
        Then The last page number 'SearchPageLocators > p_last_number' is displayed according to 'TOTAL_RESULTS_COUNT'
        When I click on page number value '2' for element 'SearchPageLocators > search_pagination_page_no_button'
        # needs for pagination, we don't have an element to wait for
        And I pause for '2' s
        And I move to element 'SearchPageLocators > search_results_counter_text'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And The element 'SearchPageLocators > search_results_counter_text' is displayed
        Then The element 'SearchPageLocators > search_results_counter_text' text is 'Showing 11 - 20 of {%TOTAL_RESULTS_COUNT%} results'

    @TR-C365306 @automated @regression @prio1
    Scenario: Verify pagination functionality for last page link
        When I move to element 'SearchPageLocators > search_input_field'
        And The element 'SearchPageLocators > search_input_field' is displayed
        And I set text 'all' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_results_title' is displayed
        And The element 'SearchPageLocators > search_results_counter_text' is displayed
        And I get the total search results using 'SearchPageLocators > search_results_counter_text' and save as environment variable 'TOTAL_RESULTS_COUNT'
        And I move to element 'SearchPageLocators > p_last_number'
        And I click on item 'SearchPageLocators > p_last_number'
        # needs for pagination, we don't have an element to wait for
        And I pause for '2' s
        And The element 'SearchPageLocators > search_results_counter_text' is displayed
        And I move to element 'SearchPageLocators > search_results_counter_text'
        Then The last page results counter 'SearchPageLocators > search_results_counter_text' is displayed according to 'TOTAL_RESULTS_COUNT'
        When I move to element 'SearchPageLocators > search_pagination_back_button'
        Then I expect value '2' is not enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        And I expect value '1' is enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        And The last page number 'SearchPageLocators > p_last_number' is displayed according to 'TOTAL_RESULTS_COUNT'

    @TR-C211201 @automated @regression @prio1
    Scenario: Verify whether no Search Tips block appears for the No Results page on UK AboveBrand PfizerPro site
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '3' seconds
        And The element 'SearchPageLocators > search_button' is displayed
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'AllPfizerResults' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_page_footer' is displayed
        And The element 'SearchPageLocators > search_no_results_title' is displayed
        Then The element 'SearchPageLocators > search_tips_title' is not displayed

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

    @TR-C211193 @automated @regression @prio1
    Scenario: Search PfizerPro UK - Verify that Brand Name is specified on Brand Tab when using Website Brand MetaTag
        When I am on the page '/besponsa-homepage'
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '30' seconds
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'All' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        Then The page url contains '&brand=Besponsa'
        And The element 'SearchPageLocators > search_tabs_brand' is displayed
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'Besponsa®▼ results'


