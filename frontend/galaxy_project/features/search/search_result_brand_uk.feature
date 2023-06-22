@nondestructive @search @ukabove @search_brand_uk
Feature: UK Brand Galaxy Automated Regression - Search Results

    Background:
        Given I am on the page '/'
        And Browser is maximized
        When I click on item 'UKAbove > hcp_confirmation_yes'
        When I click on item 'UKAbove > cookie_accept_all_button'
        And I click on item 'UKAbove > search_icon'
        # we have to wait for the search field animation to finish
        And I pause for '1' s
        And The title is 'Home | PfizerPro UK'

    @TR-C210962 @automated @regression @prio1
    Scenario: Search PfizerPro - Verify PfizerPro Search Tabs Deep-Linking
        When I am on the page '/besponsa-homepage'
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '30' seconds
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'Besponsa' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        Then The page url contains '&brand=Besponsa'
        And The element 'SearchPageLocators > search_tabs' is displayed
        When I click on item 'SearchPageLocators > search_tabs_all'
        Then The page url contains '&brand=Besponsa&hash=search-all#search-all'
        When I click on item 'SearchPageLocators > search_tabs_brand'
        Then The page url contains '&brand=Besponsa#search-brand'
        When I navigate backward
        Then The page url contains '&brand=Besponsa&hash=search-all#search-all'
        When I navigate backward
        Then The page url contains '&brand=Besponsa'

    @TR-C872322 @automated @regression @prio1
    Scenario: Search PfizerPro - Verify PfizerPro Search Tabs Deep-Linking with Pagination
        When I am on the page '/search/static/uk-brand-search?search=Besponsa&brand=Besponsa'
        Then The element 'SearchPageLocators > search_tabs' is displayed
        And I expect that element 'SearchPageLocators > search_pagination' is displayed
        And The page url contains 'search=Besponsa'
        When I click on item 'SearchPageLocators > search_tabs_all'
        Then The page url contains '&brand=Besponsa&hash=search-all#search-all'
        When I click on item 'SearchPageLocators > search_tabs_brand'
        Then The page url contains '&brand=Besponsa#search-brand'
        When I click on page number value '2' for element 'SearchPageLocators > search_pagination_page_no_button'
        And I pause for '3' s
        Then The page url contains 'search=Besponsa&brand=Besponsa#search-brand&page=2'
        When I click on page number value '1' for element 'SearchPageLocators > search_pagination_page_no_button'
        And I pause for '3' s
        Then The page url contains 'search=Besponsa&brand=Besponsa#search-brand'
        And The element 'SearchPageLocators > search_tabs' is displayed
        When I click on item 'SearchPageLocators > search_tabs_all'
        And I pause for '3' s
        Then The page url contains 'search=Besponsa&brand=Besponsa&hash=search-all#search-all'
        When I click on page number value '2' for element 'SearchPageLocators > search_pagination_page_no_button'
        And I pause for '3' s
        Then I expect value '2' is enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        Then The page url contains 'search=Besponsa&brand=Besponsa&hash=search-all#search-all&page=2'
        When I click on page number value '1' for element 'SearchPageLocators > search_pagination_page_no_button'
        And I pause for '3' s
        Then The page url contains 'search=Besponsa&brand=Besponsa&hash=search-all#search-all'
        When I navigate backward
        #Added wait as there is no element to wait for
        And I pause for '2' s
        Then The page url contains 'search=Besponsa&brand=Besponsa&hash=search-all#search-all&page=2'
        When I navigate backward
        And I pause for '2' s
        Then The page url contains 'search=Besponsa&brand=Besponsa&hash=search-all#search-all'
        When I navigate backward
        And I pause for '2' s
        Then The page url contains 'search=Besponsa&brand=Besponsa'
        When I navigate backward
        And I pause for '2' s
        Then The page url contains 'search=Besponsa&brand=Besponsa#search-brand&page=2'
        When I navigate backward
        And I pause for '2' s
        Then The page url contains 'search=Besponsa&brand=Besponsa'

    @TR-C872323 @automated @regression @prio1
    Scenario: Search PfizerPro - Verify PfizerPro Search Tabs Deep-Linking with Search History
        When I am on the page '/besponsa-homepage'
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '30' seconds
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'Besponsa' to field 'SearchPageLocators > search_input_field'
        And I click on item 'SearchPageLocators > search_button'
        And The element 'SearchPageLocators > search_results_section' is displayed
        Then The page url contains 'search=Besponsa&brand=Besponsa'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'Besponsa®▼ results'
        When I click on item 'SearchPageLocators > search_tabs_all'
        Then The page url contains '?search=Besponsa&brand=Besponsa&hash=search-all#search-all'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'All results'
        When I click on item 'SearchPageLocators > search_clear_button'
        And I set text 'Pfizer' to field 'SearchPageLocators > search_input_field'
        And I click on item 'SearchPageLocators > search_button'
        Then The page url contains '?search=Pfizer&brand=Besponsa&hash=search-all#search-all'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'All results'
        When I click on item 'SearchPageLocators > search_clear_button'
        And I set text 'Patient' to field 'SearchPageLocators > search_input_field'
        And I click on item 'SearchPageLocators > search_button'
        Then The page url contains '?search=Patient&brand=Besponsa&hash=search-all#search-all'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'All results'
        When I click on item 'SearchPageLocators > rs_item3'
        And I pause for '2' s
        Then The page url contains '?search=Besponsa&brand=Besponsa&hash=search-all#search-all'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'All results'
        When I click on item 'SearchPageLocators > search_tabs_brand'
        Then The page url contains '?search=Besponsa&brand=Besponsa#search-brand'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'Besponsa®▼ results'
        When I click on item 'SearchPageLocators > search_clear_button'
        And I set text 'Guide' to field 'SearchPageLocators > search_input_field'
        And I click on item 'SearchPageLocators > search_button'
        Then The page url contains '?search=Guide&brand=Besponsa'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'Besponsa®▼ results'
        When I click on item 'SearchPageLocators > search_clear_button'
        And I set text 'Pharmacy' to field 'SearchPageLocators > search_input_field'
        And I click on item 'SearchPageLocators > search_button'
        Then The page url contains '?search=Pharmacy&brand=Besponsa'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'Besponsa®▼ results'
        #Added wait as there is no element to wait for
        When I pause for '3' s
        When I click on item 'SearchPageLocators > rs_item2'
        And I pause for '5' s
        Then The page url contains '?search=Guide&brand=Besponsa'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'Besponsa®▼ results'
        When I navigate backward
        Then The page url contains '?search=Pharmacy&brand=Besponsa'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'Besponsa®▼ results'
        When I navigate backward
        Then The page url contains '?search=Guide&brand=Besponsa'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'Besponsa®▼ results'
        When I navigate backward
        Then The page url contains '?search=Besponsa&brand=Besponsa#search-brand'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'Besponsa®▼ results'
        When I navigate backward
        Then The page url contains '?search=Besponsa&brand=Besponsa&hash=search-all#search-all'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'All results'
        When I navigate backward
        Then The page url contains '?search=Patient&brand=Besponsa&hash=search-all#search-all'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'All results'
        When I navigate backward
        Then The page url contains '?search=Pfizer&brand=Besponsa&hash=search-all#search-all'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'All results'
        When I navigate backward
        Then The page url contains '?search=Besponsa&brand=Besponsa&hash=search-all#search-all'
        And I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'All results'

    @TR-C211190 @automated @regression
    Scenario: Search PfizerPro - Verify searching on Brand PfizerPro renders with 'Brand' tab and 'All results' tab
        When I am on the page '/besponsa-homepage'
        When I click on item 'UKAbove > search_icon'
        Then I expect that element 'SearchPageLocators > search_input_field' becomes visible within '30' seconds
        When I move to element 'SearchPageLocators > search_input_field'
        And I set text 'Besponsa' to field 'SearchPageLocators > search_input_field'
        And I press 'SPACE'
        And The element 'SearchPageLocators > search_button' is displayed
        And I click on item 'SearchPageLocators > search_button'
        When I click on item 'SearchPageLocators > search_tabs_all'
        Then I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'All results'
        And The page url contains '&brand=Besponsa&hash=search-all#search-all'

    @TR-C211192 @automated @regression @prio1
    Scenario: Search Results - Verify that website brand name is specified on URL parameter
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
        When I click on item 'SearchPageLocators > search_tabs_all'
        Then I expect that attribute 'title' for element 'SearchPageLocators > search_tabs_active_tab' to be 'All results'
        And The page url contains '&brand=Besponsa&hash=search-all#search-all'

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

    @TR-C872360 @automated @regression @prio1
    Scenario: Search PfizerPro UK - HCP: Verify PfizerPro Brand Search History retains queries for Brand Tab and All Results Tab
        When I am on the page '/search/static/uk-brand-search?search=Besponsa&brand=Besponsa'
        Then The element 'SearchPageLocators > search_tabs' is displayed
        Then The page url contains '?search=Besponsa&brand=Besponsa' 
        When I click on item 'SearchPageLocators > search_tabs_all'
        Then The page url contains '?search=Besponsa&brand=Besponsa&hash=search-all#search-all'
        When I click on item 'SearchPageLocators > search_clear_button'
        And I set text 'Pfizer' to field 'SearchPageLocators > search_input_field'
        And I click on item 'SearchPageLocators > search_button'
        And I pause for '3' s
        Then The page url contains '?search=Pfizer&brand=Besponsa&hash=search-all#search-all'
        When I click on item 'SearchPageLocators > search_clear_button'
        And I set text 'All' to field 'SearchPageLocators > search_input_field'
        And I click on item 'SearchPageLocators > search_button'
        And I pause for '3' s
        Then The page url contains '?search=All&brand=Besponsa&hash=search-all#search-all'
        When I click on item 'SearchPageLocators > search_tabs_brand'
        And I pause for '3' s
        Then The page url contains '?search=All&brand=Besponsa#search-brand'
        When I click on item 'SearchPageLocators > search_clear_button'
        And I set text 'Information' to field 'SearchPageLocators > search_input_field'
        And I click on item 'SearchPageLocators > search_button'
        And I pause for '3' s
        Then The page url contains '?search=Information&brand=Besponsa'
        Then The element 'SearchPageLocators > rs_item1' text is 'Information'
        Then The element 'SearchPageLocators > rs_item2' text is 'All'
        Then The element 'SearchPageLocators > rs_item3' text is 'Pfizer'
        Then The element 'SearchPageLocators > rs_item4' text is 'Besponsa'
        When I click on item 'SearchPageLocators > rs_item4'
        And I pause for '3' s
        Then The element 'SearchPageLocators > rs_item1' text is 'Besponsa'
        When I click on item 'SearchPageLocators > rs_item4'
        And I pause for '3' s
        Then The element 'SearchPageLocators > rs_item1' text is 'Pfizer'
        When I click on item 'SearchPageLocators > rs_item4'
        And I pause for '3' s
        Then The element 'SearchPageLocators > rs_item1' text is 'All'
        When I click on item 'SearchPageLocators > rs_item4'
        And I pause for '3' s
        Then The element 'SearchPageLocators > rs_item1' text is 'Information'
