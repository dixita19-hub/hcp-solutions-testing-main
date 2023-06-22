@nondestructive @medical @usabove
Feature: US Medical Galaxy Regression - Medical Search Results

    Background:
        Given I am on the page '/'
        And Browser is maximized
        When I pause for '3' s
        And The element 'SearchPageLocators > MedicalUS > consent_continue_button' is displayed
        And I move to element 'SearchPageLocators > MedicalUS > consent_continue_button'
        And The element 'SearchPageLocators > MedicalUS > consent_continue_button' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > consent_continue_button'

    @TR-C210988 @automated @regression @prio1
    Scenario: Verify TA List from Medical Page
        Given The title is 'Homepage | US Medical'
        When The element 'MedicalLocators > therapy_area_top_dropdown_field' is displayed
        And I click on item 'MedicalLocators > therapy_area_top_dropdown_field'
        And I get all of the TA options from 'SearchPageLocators > MedicalUS > med_page_ta_items' and save as environment variable 'TA_COUNT'
        And I click item '{%TA_COUNT%}' for element 'SearchPageLocators > MedicalUS > med_page_ta_select'
        And The element 'MedicalLocators > therapy_area_top_dropdown_field' is displayed
        Then The element 'MedicalLocators > therapy_area_top_dropdown_field' contains the text 'Cardiovascular'

    @TR-C210987 @automated @regression @prio1
    Scenario: Verify searching on Medical Search with no TA selected
        Given The title is 'Homepage | US Medical'
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        And The element 'SearchPageLocators > MedicalUS > medical_search_input_field' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I set text 'Efficacy' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_cta'
        Then The element 'SearchPageLocators > MedicalUS > medical_your_results' is displayed

    @TR-C210990 @automated @regression @prio1
    Scenario: Verify Medical Search Results Page when selecting a TA
        Given The title is 'Homepage | US Medical'
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        Then The element 'SearchPageLocators > MedicalUS > medical_search_input_field' is displayed
        When I click on item 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I set text 'Efficacy' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_cta'
        Then The element 'SearchPageLocators > MedicalUS > medical_your_results' is displayed
        And The element 'SearchPageLocators > MedicalUS > search_ta_dropdown_field' is displayed
        When I click on item 'SearchPageLocators > MedicalUS > search_ta_dropdown_field'
        And I get all of the TA options from 'SearchPageLocators > MedicalUS > search_ta_items' and save as environment variable 'TA_COUNT'
        And I click item '{%TA_COUNT%}' for element 'SearchPageLocators > MedicalUS > search_ta_select'
        Then I expect that element 'SearchPageLocators > search_input_field_disabled' becomes invisible within '30' seconds
        Then The page url contains 'Cardiovascular'

    @TR-C210989 @automated @regression @prio1
    Scenario: Verify searching from Medical Page with TA selected
        Given The title is 'Homepage | US Medical'
        When The element 'MedicalLocators > therapy_area_top_dropdown_field' is displayed
        And I click on item 'MedicalLocators > therapy_area_top_dropdown_field'
        And I get all of the TA options from 'SearchPageLocators > MedicalUS > med_page_ta_items' and save as environment variable 'TA_COUNT'
        And I click item '{%TA_COUNT%}' for element 'SearchPageLocators > MedicalUS > med_page_ta_select'
        And The element 'MedicalLocators > therapy_area_top_dropdown_field' is displayed
        Then I see that url contains 'Cardiovascular'
        And The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I expect that element 'SearchPageLocators > MedicalUS > medical_search_icon' becomes visible within '10' seconds
        When I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        Then I expect that element 'SearchPageLocators > MedicalUS > medical_search_input_field' becomes visible within '10' seconds
        And The element 'SearchPageLocators > MedicalUS > medical_search_input_field' is displayed
        When I trigger focus on 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I set text 'Efficacy' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then I expect that element 'SearchPageLocators > MedicalUS > medical_search_cta' becomes visible within '60' seconds
        When I click on item 'SearchPageLocators > MedicalUS > medical_search_cta'
        When I trigger focus on 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then The element 'SearchPageLocators > MedicalUS > search_ta_dropdown_field' is displayed
        And I should see element 'SearchPageLocators > MedicalUS > medical_search_input_field' load with page url containing 'search=Efficacy&inc=ta:Cardiovascular'

    @TR-C211041 @automated @regression @prio1
    Scenario: Verify on Medical 'Search-Results' page that the first (products) tab with 1 or more count is selected by default
        Given The title is 'Homepage | US Medical'
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I set text 'Efficacy' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_cta'
        Then The element 'SearchPageLocators > MedicalUS > medical_your_results' is displayed
        And The element 'SearchPageLocators > MedicalUS > search_products_tab' is displayed
        And I expect the text element in 'SearchPageLocators > MedicalUS > search_products_tab_text' to match predefined text as 'Products'
        And The element 'SearchPageLocators > MedicalUS > search_diseases_tab' is displayed
        And I expect the count element in 'SearchPageLocators > MedicalUS > search_products_tab_text' to be more than one
        And I should see that 'color' from 'SearchPageLocators > MedicalUS > search_products_tab' matches active and in focus css as 'rgb(255, 255, 255)'
        And I should see that 'color' from 'SearchPageLocators > MedicalUS > search_diseases_tab' matches active but not in focus css as 'rgb(6, 29, 55)'

    @TR-C211017 @automated @regression @prio1
    Scenario: Verify on Medical Search Results whether tab is disabled on count zero
        Given The title is 'Homepage | US Medical'
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        Then The element 'SearchPageLocators > MedicalUS > medical_search_input_field' is displayed
        When I click on item 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I set text 'Efficacy' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_cta'
        Then I expect that element 'SearchPageLocators > MedicalUS > medical_your_results' becomes visible within '60' seconds
        Then The element 'SearchPageLocators > MedicalUS > medical_your_results' is displayed
        When I click on item 'SearchPageLocators > MedicalUS > search_ta_dropdown_field'
        And I get Endocrinology TA option from 'SearchPageLocators > MedicalUS > search_ta_items' and save as environment variable 'TA_COUNT'
        And I click item '{%TA_COUNT%}' for element 'SearchPageLocators > MedicalUS > search_ta_select'
        Then The page url contains 'Endocrinology'
        Then The element 'SearchPageLocators > MedicalUS > medical_search_input_field' is displayed
        When I trigger focus on 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing 'search=Efficacy&inc=ta%3AEndocrinology#search-products'
        And I expect that element 'SearchPageLocators > MedicalUS > search_products_tab_text' becomes visible within '10' seconds
        And I expect the count element in 'SearchPageLocators > MedicalUS > search_products_tab_text' to be zero
        And I should see that 'color' from 'SearchPageLocators > MedicalUS > search_products_tab' matches disabled css as 'rgba(111, 111, 111, 1)'

    @TR-C211038 @automated @regression @prio1
    Scenario: Verify Medical Search Results page when both tabs yields no result
        Given The title is 'Homepage | US Medical'
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        Then The element 'SearchPageLocators > MedicalUS > medical_search_input_field' is displayed
        When I click on item 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I set text 'EfficacyNoneTest' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_cta'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_search_input_field' load with page url containing 'EfficacyNoneTest'
        When I trigger focus on 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then I expect that element 'SearchPageLocators > MedicalUS > search_products_tab_text' is not displayed
        And I expect that element 'SearchPageLocators > MedicalUS > search_diseases_tab_text' is not displayed
        And I expect the text element in 'SearchPageLocators > MedicalUS > med_no_results_found_text' to match predefined text as 'No results found'

    @TR-C211138 @automated @regression @prio1
    Scenario: Verify Pagination on Medical Site for Products Tab
        Given The title is 'Homepage | US Medical'
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        When I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        Then The element 'SearchPageLocators > MedicalUS > medical_search_input_field' is displayed
        When I click on item 'SearchPageLocators > MedicalUS > medical_search_input_field'
        When I set text 'Efficacy' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        When I click on item 'SearchPageLocators > MedicalUS > medical_search_cta'
        Then The element 'SearchPageLocators > MedicalUS > medical_your_results' is displayed
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I move to element 'SearchPageLocators > search_pagination'
        When I click on page number value '3' for element 'SearchPageLocators > search_pagination_page_no_button'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-products&page=3'
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I click on page number value '4' for element 'SearchPageLocators > search_pagination_page_no_button'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-products&page=4'
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I click on page number value '5' for element 'SearchPageLocators > search_pagination_page_no_button'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-products&page=5'

    @TR-C211019 @automated @regression @prio1
    Scenario: Verify whether back navigation on medical site are deep-linked for Products-Tab
        Given The title is 'Homepage | US Medical'
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        Then The element 'SearchPageLocators > MedicalUS > medical_search_input_field' is displayed
        When I click on item 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I set text 'Efficacy' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_cta'
        Then The element 'SearchPageLocators > MedicalUS > medical_your_results' is displayed
        And The element 'SearchPageLocators > MedicalUS > search_products_tab' is displayed
        And I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-products'
        And I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I click on page number value '5' for element 'SearchPageLocators > search_pagination_page_no_button'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-products&page=5'
        And I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I click on page number value '3' for element 'SearchPageLocators > search_pagination_page_no_button'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-products&page=3'
        And I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I click on page number value '1' for element 'SearchPageLocators > search_pagination_page_no_button'
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I trigger focus on 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing 'search=Efficacy'
        And I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-products'
        And I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I click on page number value '2' for element 'SearchPageLocators > search_pagination_page_no_button'
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I trigger focus on 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing 'search=Efficacy&page=2'
        And I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I trigger focus on 'SearchPageLocators > MedicalUS > medical_search_input_field'
        When I navigate backward
        And The element 'SearchPageLocators > search_pagination_page_no_button_preloader' is not displayed
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        And I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing 'search=Efficacy#search-products'
        When I trigger focus on 'SearchPageLocators > MedicalUS > medical_search_input_field'
        When I navigate backward
        And The element 'SearchPageLocators > search_pagination_page_no_button_preloader' is not displayed
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        And I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-products&page=3'
        And I expect value '3' is enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        When I trigger focus on 'SearchPageLocators > MedicalUS > medical_search_input_field'
        When I navigate backward
        And The element 'SearchPageLocators > search_pagination_page_no_button_preloader' is not displayed
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        And I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-products&page=5'
        And I expect value '5' is enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        When I trigger focus on 'SearchPageLocators > MedicalUS > medical_search_input_field'
        When I navigate backward
        And The element 'SearchPageLocators > search_pagination_page_no_button_preloader' is not displayed
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        And I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-products'
        And I expect value '1' is enabled for element 'SearchPageLocators > search_pagination_page_no_button'

    @TR-C368251 @automated @regression @prio1
    Scenario: Verify whether back navigation on medical site are deep-linked for Diseases-Tab
        Given The title is 'Homepage | US Medical'
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        Then The element 'SearchPageLocators > MedicalUS > medical_search_input_field' is displayed
        When I click on item 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I set text 'Efficacy' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_cta'
        Then The element 'SearchPageLocators > MedicalUS > medical_your_results' is displayed
        When I click on item 'SearchPageLocators > MedicalUS > search_diseases_tab'
        Then The element 'SearchPageLocators > MedicalUS > search_diseases_tab' is displayed
        And The page url contains '#search-diseases'
        And I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-diseases'
        And I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I click on page number value '5' for element 'SearchPageLocators > search_pagination_page_no_button'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-diseases&page=5'
        And I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I move to element 'SearchPageLocators > search_pagination'
        And I click on page number value '3' for element 'SearchPageLocators > search_pagination_page_no_button'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-diseases&page=3'
        And I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I click on page number value '1' for element 'SearchPageLocators > search_pagination_page_no_button'
        And I refresh page
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-diseases'
        And I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I click on page number value '2' for element 'SearchPageLocators > search_pagination_page_no_button'
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I trigger focus on 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-diseases&page=2'
        And I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        When I trigger focus on 'SearchPageLocators > MedicalUS > medical_search_input_field'
        When I navigate backward
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        And I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-diseases'
        And I expect value '1' is enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        When I navigate backward
        And The element 'SearchPageLocators > search_pagination_page_no_button_preloader' is not displayed
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        And I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-diseases&page=3'
        And I expect value '3' is enabled for element 'SearchPageLocators > search_pagination_page_no_button'
        When I navigate backward
        Then I expect that element 'SearchPageLocators > search_pagination' becomes visible within '60' seconds
        And I should see element 'SearchPageLocators > MedicalUS > medical_your_results' load with page url containing '#search-diseases&page=5'
        And I expect value '5' is enabled for element 'SearchPageLocators > search_pagination_page_no_button'

    @TR-C872860 @automated @regression @prio1
    Scenario: Verify Search Button
        Given The title is 'Homepage | US Medical'
        When The element 'SearchPageLocators > MedicalUS > medical_search_icon' is displayed
        And I click on item 'SearchPageLocators > MedicalUS > medical_search_icon'
        Then The element 'SearchPageLocators > MedicalUS > medical_search_input_field' is displayed
        And The element 'SearchPageLocators > MedicalUS > medical_search_cta' is displayed with innertext
            | Search |
        And I expect element 'SearchPageLocators > MedicalUS > medical_search_cta' is not enabled
        When I move to element 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I set text 'all' to field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then I expect that element 'SearchPageLocators > MedicalUS > medical_search_cta' is enabled
        When I move to element 'SearchPageLocators > MedicalUS > medical_search_input_field'
        And I press backspace '3' times on field 'SearchPageLocators > MedicalUS > medical_search_input_field'
        Then I expect element 'SearchPageLocators > MedicalUS > medical_search_cta' is not enabled
