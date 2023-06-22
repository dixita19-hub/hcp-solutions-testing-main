@nondestructive @medical @usabove
Feature: US Galaxy Mediical Regression


    Background:
        Given I am on the page '/'
        And The browser resolution is '1920' per '1080'
        When I move to element 'MedicalLocators > USVersion > consent_continue_button'
        And The element 'MedicalLocators > USVersion > consent_continue_button' is displayed
        And I click on item 'MedicalLocators > USVersion > consent_continue_button'


    @TR-C359051 @menuselector @prio1 @automated @regression
    Scenario: Menu Selector - Relative links are configured against Therapy Area
        Given The title is 'Homepage | US Medical'
        When The element 'MedicalLocators > therapy_area_top_dropdown_field' is displayed
        And I click on item 'MedicalLocators > therapy_area_top_dropdown_field'
        And I click item '2' for element 'MedicalLocators > therapy_area_top_dropdown_item'
        Then The page url contains '/biosimilars'
        When The title is 'biosimilars | US Medical'
        Then I expect 'MedicalLocators > therapy_area_top_dropdown_field' elements are present with innertext:
            | Biosimilars |
        When I click item 'publications' for element 'MedicalLocators > menu_items'
        Then The page url contains '/biosimilars/publications'
        And I expect 'MedicalLocators > therapy_area_top_dropdown_field' elements are present with innertext:
            | Biosimilars |
        When I click item 'resources' for element 'MedicalLocators > menu_items'
        Then The page url contains '/biosimilars/resources'
        And I expect 'MedicalLocators > therapy_area_top_dropdown_field' elements are present with innertext:
            | Biosimilars |
        When I click item 'congresses' for element 'MedicalLocators > menu_items'
        Then The page url contains '/biosimilars/congresses'
        And I expect 'MedicalLocators > therapy_area_top_dropdown_field' elements are present with innertext:
            | Biosimilars |
        When I click item 'productsanddiseases' for element 'MedicalLocators > menu_items'
        Then The page url contains '/biosimilars/productsanddiseases'
        And I expect 'MedicalLocators > therapy_area_top_dropdown_field' elements are present with innertext:
            | Biosimilars |


    @TR-C366569 @menuselector @prio1 @automated @regression
    Scenario: Menu Selector - Validate explore now button enable /disable functionality
        Given The title is 'Homepage | US Medical'
        When The element 'MedicalLocators > therapy_area_dropdown_field' is displayed
        And I click on item 'MedicalLocators > therapy_area_dropdown_field'
        And I click item '3' for element 'MedicalLocators > therapy_area_dropdown_item'
        And The element 'MedicalLocators > explore_now_button' is displayed
        And I move to element 'MedicalLocators > explore_now_button'
        And I click on item 'MedicalLocators > explore_now_button'
        Then The element 'MedicalLocators > therapy_area_top_dropdown_field' contains the text 'Cardiovascular'
        When I am on the url '/'
        And The element 'MedicalLocators > explore_now_button_disabled' is displayed


    @TR-C359054 @controllercomponent @prio1 @automated @regression
    Scenario: Controller Component - Message for no content available displayed on pages having no cards
        Given I am on the url '/custom-pages/product-and-disease-no-contant'
        When The title is 'Products and Diseases | US Medical'
        Then I expect 'MedicalLocators > no_content_display' elements are present with innertext:
            | No Products & Diseases currently available |
        Given I am on the url '/custom-pages/publications-no-content'
        When The title is 'Publications | US Medical'
        Then I expect 'MedicalLocators > no_content_display' elements are present with innertext:
            | No Publications currently available |
        Given I am on the url '/custom-pages/congress-no-content'
        When The title is 'Congresses | US Medical'
        Then I expect 'MedicalLocators > no_content_display' elements are present with innertext:
            | No Congresses currently available |
        Given I am on the url '/custom-pages/resource-no-content'
        When The title is 'Resources | US Medical'
        Then I expect 'MedicalLocators > no_content_display' elements are present with innertext:
            | No Resources currently available |


    @TR-C367281 @medicalsite @prio1 @automated @regression
    Scenario: Medical Site - View more link is properly accessible for US medical information kit
        When I move to element 'MedicalLocators > medical_brand_kit'
        And I click item 'medicalinformation' for element 'MedicalLocators > brand_kit_view_more'
        Then The page url contains 'medicalinformation'
        When I am on the url '/'
        And I pause for '3' s
        And I move to element 'MedicalLocators > medical_brand_kit'
        And I click item 'independent-grants' for element 'MedicalLocators > brand_kit_view_more'
        Then The page url contains 'grants'
        When I am on the url '/'
        And I pause for '3' s
        And I move to element 'MedicalLocators > medical_brand_kit'
        And I click item 'product-pipeline' for element 'MedicalLocators > brand_kit_view_more'
        Then The page url contains 'drug-product-pipeline'
        When I am on the url '/'
        And I pause for '3' s
        And I move to element 'MedicalLocators > medical_brand_kit'
        And I click item 'clinicaltrials' for element 'MedicalLocators > brand_kit_view_more'
        Then The page url contains 'clinicaltrials'


    @TR-C367282 @medicalsite @prio1 @automated @regression
    Scenario: Medical Site - Clicking on learn more for medical card will re-direct to appropriate link for each menu option (From home page)
        When I move to element 'MedicalLocators > main_cards'
        And I move to element 'MedicalLocators > medical_page_product_disease_learn_more'
        And I click item 'products-and-diseases' for element 'MedicalLocators > medical_page_product_disease_learn_more'
        Then The page url contains 'productsanddiseases'
        And I expect that element 'MedicalLocators > top_menu_activated' is displayed
        When I am on the url '/'
        And I move to element 'MedicalLocators > main_cards'
        And I move to element 'MedicalLocators > medical_page_resources_learn_more'
        And I click item 'resources' for element 'MedicalLocators > medical_page_resources_learn_more'
        Then The page url contains 'resources'
        And I expect that element 'MedicalLocators > top_menu_activated_resources' is displayed
        When I am on the url '/'
        And I move to element 'MedicalLocators > main_cards'
        And I move to element 'MedicalLocators > medical_page_publication_learn_more'
        And I click item 'publications' for element 'MedicalLocators > medical_page_publication_learn_more'
        Then The page url contains 'publications'
        And I expect that element 'MedicalLocators > top_menu_activated_publications' is displayed
        When I am on the url '/'
        And I move to element 'MedicalLocators > main_cards'
        And I move to element 'MedicalLocators > medical_page_congresses_learn_more'
        And I click item 'congresses' for element 'MedicalLocators > medical_page_congresses_learn_more'
        Then The page url contains 'congresses'
        And I expect that element 'MedicalLocators > top_menu_activated_congresses' is displayed


    @TR-C367262 @medicalsite @prio1 @automated @regression
    Scenario: Medical Site - Verify Menu categories, header data and footer data
        Given I am on the url '/'
        When The element 'MedicalLocators > therapy_area_top_dropdown_field' is displayed
        Then I expect element 'MedicalLocators > top_menu_items' has items:
            | Products & Diseases | Congresses | Publications | Resources | Contact |
        And The element 'MedicalLocators > pfizer_home_icon' is displayed
        When I click item 'publications' for element 'MedicalLocators > menu_items'
        And The title is 'Publications | US Medical'
        When I click item 'resources' for element 'MedicalLocators > menu_items'
        And The title is 'Resources | US Medical'
        When I click item 'congresses' for element 'MedicalLocators > menu_items'
        And The title is 'Congresses | US Medical'
        When I click item 'productsanddiseases' for element 'MedicalLocators > menu_items'
        And The title is 'Products and Diseases | US Medical'
        When I am on the url '/'
        And I move to element 'MedicalLocators > footer_end_section'
        And The element 'MedicalLocators > footer_end_section' is displayed
        And The element 'MedicalLocators > footer_pfizer_link' is displayed
        And The element 'MedicalLocators > footer_cookie_policy_link' is displayed
        And The element 'MedicalLocators > footer_privacy_policy_link' is displayed
        And The element 'MedicalLocators > footer_teams_of_use_link' is displayed
        And The element 'MedicalLocators > footer_report_adverse_events' is displayed
        And The element 'MedicalLocators > footer_signin_register_button' is displayed
        And The element 'MedicalLocators > footer_start_section' is displayed


    @TR-C367261 @mediacards @prio1 @automated @regression
    Scenario: Media Cards - Media cards are visible for each category and clicking on learn more redirects to configured link
        Given I am on the url '/'
        When The element 'MedicalLocators > therapy_area_top_dropdown_field' is displayed
        And I click on item 'MedicalLocators > therapy_area_top_dropdown_field'
        And I click item '3' for element 'MedicalLocators > therapy_area_top_dropdown_item'
        And I click item 'productsanddiseases' for element 'MedicalLocators > menu_items'
        And The element 'MedicalLocators > medical_listing_learn-more' is displayed
        And I click on item 'MedicalLocators > medical_listing_learn-more'
        And I switch to newly opened tab


    @TR-C368166 @recentdata @prio1 @automated @regression
    Scenario: Recent Data - Recent data cards are visible in TA home page
        Given I am on the url '/custom-pages/recent-data'
        When The element 'MedicalLocators > recent_data_heading' is displayed
        Then I expect 'MedicalLocators > recent_data_heading' elements are present with innertext:
            | Recent Data & Resources |
        When The element 'MedicalLocators > recent_data_cards_homepage' is displayed
        Then I expect '4' elements of 'MedicalLocators > recent_data_cards_homepage' are displayed


    @TR-C367114 @mediacards @prio1 @automated @regression
    Scenario: Media Cards - Verify that media card should display if no short description
        Given I am on the url '/oncology/oncology-publication'
        When I click on item 'MedicalLocators > disease_state_tabs'
        Then The element 'MedicalLocators > card' is displayed
        And Card title 'TC_367114_No_Short_Description' is present on the page where count is 'MedicalLocators > card_count' and header_path is 'MedicalLocators > card_header'


    @TR-C367113 @menuselector @prio1 @automated @regression
    Scenario: Menu Selector - Verify the page navigation is correct when we select the TA from secondary menu selector and navigate the top menu pages
        Given I am on the url '/'
        And The title is 'Homepage | US Medical'
        When The element 'MedicalLocators > therapy_area_dropdown_field' is displayed
        And I click on item 'MedicalLocators > therapy_area_dropdown_field'
        And I click item '3' for element 'MedicalLocators > therapy_area_dropdown_item'
        And I move to element 'MedicalLocators > explore_now_button'
        And I click on item 'MedicalLocators > explore_now_button'
        Then The element 'MedicalLocators > therapy_area_top_dropdown_field' contains the text 'Cardiovascular'
        When I click item 'publications' for element 'MedicalLocators > menu_items'
        And The title is 'Publications | US Medical'
        Then The page url contains '/cardiovascular/publications'
        And I expect 'MedicalLocators > therapy_area_top_dropdown_field' elements are present with innertext:
            | Cardiovascular |
        When I click item 'resources' for element 'MedicalLocators > menu_items'
        And The title is 'cardiovascular-resources | US Medical'
        Then The page url contains '/cardiovascular/resources'
        And I expect 'MedicalLocators > therapy_area_top_dropdown_field' elements are present with innertext:
            | Cardiovascular |
        When I click item 'congresses' for element 'MedicalLocators > menu_items'
        And The title is 'cardiovascular congresses | US Medical'
        Then The page url contains '/cardiovascular/congresses'
        And I expect 'MedicalLocators > therapy_area_top_dropdown_field' elements are present with innertext:
            | Cardiovascular |
        When I click item 'productsanddiseases' for element 'MedicalLocators > menu_items'
        And The title is 'Cardiovascular Products and Diseases | US Medical'
        Then The page url contains '/cardiovascular/productsanddiseases'
        And I expect 'MedicalLocators > therapy_area_top_dropdown_field' elements are present with innertext:
            | Cardiovascular |


    @TR-C368167 @menuselector @prio1 @automated @regression
    Scenario: Recent Data - Reactive Card is not visible under recent data
        Given I am on the url '/custom-pages/recent-data'
        When The element 'MedicalLocators > recent_data_heading' is displayed
        Then I expect 'MedicalLocators > recent_data_heading' elements are present with innertext:
            | Recent Data & Resources |
        When The element 'MedicalLocators > recent_data_cards_homepage' is displayed
        Then I expect '4' elements of 'MedicalLocators > recent_data_cards_homepage' are displayed
        When I pause for '5' s
        Then Card title 'C368167_Reactive_Card' is not present on the page and count is 'MedicalLocators > card_count_recent_data' and header_path is 'MedicalLocators > card_header_recent_data'


    @TR-C368168 @menuselector @prio1 @automated @regression
    Scenario: Recent Data - Non-promotional card is not visible under recent data
        Given I am on the url '/custom-pages/recent-data'
        When The element 'MedicalLocators > recent_data_heading' is displayed
        Then I expect 'MedicalLocators > recent_data_heading' elements are present with innertext:
            | Recent Data & Resources |
        When The element 'MedicalLocators > recent_data_cards_homepage' is displayed
        And I pause for '5' s
        Then I expect '4' elements of 'MedicalLocators > recent_data_cards_homepage' are displayed
        And Card title 'C368168_Non-promotional_Card' is not present on the page and count is 'MedicalLocators > card_count_recent_data' and header_path is 'MedicalLocators > card_header_recent_data'


     @TR-C359052 @tabdeactivation @prio1 @automated @regression
    Scenario: Tab Deactivation - Product and Disease State tabs are disabled
        Given I am on the url '/custom-pages/publications-no-content'
        When The title is 'Publications | US Medical'
        Then I expect element 'MedicalLocators > products_tabs' is not enabled
        And I expect element 'MedicalLocators > disease_state_tabs' is not enabled
        When I am on the url '/custom-pages/resource-no-content'
        And The title is 'Resources | US Medical'
        Then I expect element 'MedicalLocators > products_tabs' is not enabled
        And I expect element 'MedicalLocators > disease_state_tabs' is not enabled
        When I am on the url '/custom-pages/product-and-disease-no-contant'
        And The title is 'Products and Diseases | US Medical'
        Then I expect element 'MedicalLocators > products_tabs' is not enabled
        And I expect element 'MedicalLocators > disease_state_tabs' is not enabled


    @TR-C367263 @mediacards @prio1 @automated @regression
    Scenario: Media Cards - Product and disease state tabs are enabled if card available
        Given I am on the url '/oncology/oncology-publication'
        When The element 'MedicalLocators > therapy_area_top_dropdown_field' is displayed
        Then The element 'MedicalLocators > products_tabs' is enabled
        When I move to element 'MedicalLocators > products_tabs'
        And I click on item 'MedicalLocators > products_tabs'
        When The element 'MedicalLocators > product_value_1' is displayed
        And The element 'MedicalLocators > card' is displayed
        And The element 'MedicalLocators > disease_state_tabs' is enabled
        And I click on item 'MedicalLocators > disease_state_tabs'
        And The element 'MedicalLocators > product_value_1' is displayed
        And The element 'MedicalLocators > card' is displayed
        Given I am on the url '/oncology/oncology-resources'
        And I pause for '3' s
        Then The element 'MedicalLocators > products_tabs' is enabled
        When I move to element 'MedicalLocators > products_tabs'
        And I click on item 'MedicalLocators > products_tabs'
        And The element 'MedicalLocators > product_value_1' is displayed
        And The element 'MedicalLocators > card' is displayed
        And The element 'MedicalLocators > disease_state_tabs' is enabled
        And I click on item 'MedicalLocators > disease_state_tabs'
        And The element 'MedicalLocators > product_value_1' is displayed
        And The element 'MedicalLocators > card' is displayed
        Given I am on the url '/oncology/oncology-product-and-disease'
        When The element 'MedicalLocators > therapy_area_top_dropdown_field' is displayed
        Then The element 'MedicalLocators > products_tabs' is enabled
        When I move to element 'MedicalLocators > products_tabs'
        And I click on item 'MedicalLocators > products_tabs'
        And The element 'MedicalLocators > product_value_1' is displayed
        And The element 'MedicalLocators > card' is displayed
        And The element 'MedicalLocators > disease_state_tabs' is enabled
        And I click on item 'MedicalLocators > disease_state_tabs'
        And The element 'MedicalLocators > product_value_1' is displayed
        And The element 'MedicalLocators > card' is displayed


    @TR-C367283 @mediacards @automated @regression
    Scenario: Media Cards - Reactive Card is not visible under menu category
        Given I am on the url '/oncology/oncology-publication'
        When The element 'MedicalLocators > card' is displayed
        And I pause for '3' s
        Then Card title 'C367283_Reactive_card_Publication' is not present on the page and count is 'MedicalLocators > card_count' and header_path is 'MedicalLocators > card_header'
        When I move to element 'MedicalLocators > disease_state_tabs'
        And I click on item 'MedicalLocators > disease_state_tabs'
        Then Card title 'C367283_Reactive_card_Publication' is not present on the page and count is 'MedicalLocators > card_count' and header_path is 'MedicalLocators > card_header'
        When I am on the url '/oncology/oncology-publication?uuid=f5bfe7c7-d920-42f9-822c-1265512e6c6b'
        And I pause for '5' s
        Then Card title 'C367283_Reactive_card_Publication' is present on the page where count is 'MedicalLocators > card_count' and header_path is 'MedicalLocators > card_header'


    @TR-C367850 @automated @mediacards @prio1 @regression
    Scenario: Media Cards - Non-promotional card is visible under menu category
        Given I am on the url '/oncology/oncology-publication'
        When I click on item 'MedicalLocators > disease_state_tabs'
        Then The element 'MedicalLocators > card' is displayed
        When I pause for '5' s
        Then Card title 'C367850_Non_Promotional_card_publications' is present on the page where count is 'MedicalLocators > card_count' and header_path is 'MedicalLocators > card_header'


    @TR-C366204 @automated @sessiontimeout @prio1 @regression
    Scenario: Session timeout popup - Session timeout popup appears when popup configuration is enabled and user is inactive for configured time Medical
        Given I am on the url '/biosimilars/productsanddiseases'
        And I pause for '30' s
        When The element 'MedicalLocators > session_pop-up' is displayed
        And I pause for '10' s
        When The element 'MedicalLocators > session_pop-up' is displayed
        And I click on item 'MedicalLocators > session_pop-up_ok'
        Then The page url contains '/biosimilars/productsanddiseases'
        And I expect 'MedicalLocators > therapy_area_top_dropdown_field' elements are present with innertext:
            | Biosimilars |
        When I pause for '30' s
        And The element 'MedicalLocators > session_pop-up' is displayed
        And I click on item 'MedicalLocators > session_pop-up_cancel'
        Then The page url contains 'https://www.pfizerpro.com'


    @TR-C368169 @automated @expiredcards @prio1 @regression
    Scenario: Expired card should not display in the menu categories
        Given I am on the url '/oncology/oncology-publication'
        When I pause for '5' s
        Then The element 'MedicalLocators > card' is displayed
        And Card title 'TC_368169_Expired_Cards_publication' is not present on the page and count is 'MedicalLocators > card_count' and header_path is 'MedicalLocators > card_header'
        Given I am on the url '/oncology/oncology-resources'
        When I pause for '5' s
        Then The element 'MedicalLocators > card' is displayed
        And Card title 'TC_368169_Expired_Cards_resources' is not present on the page and count is 'MedicalLocators > card_count' and header_path is 'MedicalLocators > card_header'
        Given I am on the url '/oncology/oncology-product-and-disease'
        When I pause for '5' s
        Then The element 'MedicalLocators > card' is displayed
        And Card title 'TC_368169_Expired_Cards_product_disease' is not present on the page and count is 'MedicalLocators > card_count' and header_path is 'MedicalLocators > card_header'
        Given I am on the url '/congress-event'
        When I pause for '5' s
        Then The element 'MedicalLocators > congress_material_card' is displayed
        And Card title 'TC_368169_Expired_Cards_congress_material' is not present on the page and count is 'MedicalLocators > congress_material_count' and header_path is 'MedicalLocators > congress_material_header'


    @TR-C359155 @congressmaterial @proi1 @automated @regression
    Scenario: Congress Material - Congress event to Congress materials navigation and event page has all the info correctly populated
        Given I am on the url '/oncology/oncology-congress'
        Then I expect that the title is 'Congresses | US Medical'
        And The element 'MedicalLocators > congress_medical_listing' is displayed
        Given I am on the url '/congress-event'
        When The element 'MedicalLocators > material_banner' is displayed
        Then I expect 'MedicalLocators > congress_material_disease_state' elements are present with innertext:
            | Lung Cancer |
        Then I expect 'MedicalLocators > material_page_disease_detail' elements are present with innertext:
            | October 12, 2022 | Mohit_Congress | Lung Cancer |
        When I move to element 'MedicalLocators > congress_view_material'
        And I click on item 'MedicalLocators > congress_view_material'
        Then I expect 'MedicalLocators > congress_material_disease_state' elements are present with innertext:
            | copyright_popup |
        When I move to element 'MedicalLocators > copyright_popup_ok_button'
        And I click on item 'MedicalLocators > copyright_popup_ok_button'
        When I pause for '5' s
        Then The page url contains '/Test_PDF_E.pdf'


    @TR-C367852 @medicalsite @prio1 @automated @regression
    Scenario: Medical Site - Sign-in
        When The element 'MedicalLocators > USVersion > signin_button' is displayed
        And I click on item 'MedicalLocators > USVersion > signin_button'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on item 'USAbove > login > login_button'
        Then I expect that the title is 'Homepage | US Medical'


    @TR-C393308 @medicalsite @prio1 @automated @regression
    Scenario: Medical Site - Sign In from TA page
        When The element 'MedicalLocators > therapy_area_top_dropdown_field' is displayed
        And I click on item 'MedicalLocators > therapy_area_top_dropdown_field'
        And I click item '3' for element 'MedicalLocators > therapy_area_top_dropdown_item'
        And The element 'MedicalLocators > USVersion > signin_button' is displayed
        And I click on item 'MedicalLocators > USVersion > signin_button'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on item 'USAbove > login > login_button'
        Then I expect that the title is 'cardiovascular | US Medical'


    @TR-C367865 @medicalsite @prio1 @automated @regression
    Scenario: Medical Site - Sign Out
        When The element 'MedicalLocators > USVersion > signin_button' is displayed
        And I click on item 'MedicalLocators > USVersion > signin_button'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on item 'USAbove > login > login_button'
        And The element 'USAbove > login > logout_button' is displayed
        And I click on item 'USAbove > login > logout_button'
        Then I expect that the title contains 'US Medical'


    @TR-C393401 @medicalsite @prio1 @automated @regression
    Scenario: Medical - Sign Out from TA page
        When The element 'MedicalLocators > therapy_area_top_dropdown_field' is displayed
        And I click on item 'MedicalLocators > therapy_area_top_dropdown_field'
        And I click item '3' for element 'MedicalLocators > therapy_area_top_dropdown_item'
        And The element 'MedicalLocators > USVersion > signin_button' is displayed
        And I click on item 'MedicalLocators > USVersion > signin_button'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on item 'USAbove > login > login_button'
        And The element 'USAbove > login > logout_button' is displayed
        And I click on item 'USAbove > login > logout_button'
        Then I expect that the title contains 'US Medical'


    @TR-C359148 @usabove @pillsfilter @prio2 @automated @regression
    Scenario: Pills Filter - Display and sorting of pills filter
        Given I am on the url '/oncology/oncology-publication'
        And I pause for '5' s
        Then The element 'MedicalLocators > therapy_area_top_dropdown_field' is displayed
        And I expect 'MedicalLocators > product_value_1' elements are present with innertext:
            | Adrian Product (adrian) |
        And I expect 'MedicalLocators > product_value_2' elements are present with innertext:
            | Avelumab |
        Then The recent search items order is:
            | MedicalLocators > product_value_1 | MedicalLocators > product_value_2 | MedicalLocators > product_value_3 | MedicalLocators > product_value_4 | MedicalLocators > product_value_5 |
        When I move to element 'MedicalLocators > filter_text'
        And The element 'MedicalLocators > filter_text' is displayed
        And I click on item 'MedicalLocators > filter_text'
        Then The page url contains 'oncology/example.com'
        When I am on the url '/oncology/oncology-product-and-disease'
        And I pause for '5' s
        Then I expect 'MedicalLocators > product_value_1' elements are present with innertext:
            | Adrian Product (adrian) |
        And I expect 'MedicalLocators > product_value_2' elements are present with innertext:
            | Avelumab ||
        And The recent search items order is:
            | MedicalLocators > product_value_1 | MedicalLocators > product_value_2 | MedicalLocators > product_value_3 | MedicalLocators > product_value_4 |
        When I am on the url '/congress-event'
        And I pause for '3' s
        Then The element 'MedicalLocators > congress_material_filter' is displayed
        And The recent search items order is:
            | MedicalLocators > product_value_1 | MedicalLocators > product_value_2 |
        Given I am on the url '/oncology/oncology-resources'
        And I pause for '3' s
        Then I expect 'MedicalLocators > product_value_2' elements are present with innertext:
            | Adrian Product (adrian) |
        And I expect 'MedicalLocators > product_value_2' elements are present with innertext:
            | Avelumab |
        And The recent search items order is:
            | MedicalLocators > product_value_1 | MedicalLocators > product_value_2 | MedicalLocators > product_value_3 |


    @TR-C368197 @recentdata @prio1 @automated @regression
    Scenario: Recent Data - 4 recent cards in each product and disease state section
        Given I am on the url '/custom-pages/recent-data-with-tabs'
        When The element 'MedicalLocators > recent_data_heading' is displayed
        Then I expect 'MedicalLocators > recent_data_heading' elements are present with innertext:
            | Recent Data & Resources |
        When I move to element 'MedicalLocators > products_tabs'
        And I click on item 'MedicalLocators > products_tabs'
        Then I expect '4' elements of 'MedicalLocators > recent_data_cards_homepage' are displayed
        When I click on item 'MedicalLocators > disease_state_tabs'
        Then I expect '4' elements of 'MedicalLocators > recent_data_cards_homepage' are displayed


    @TR-C366284 @menuselector @prio1 @automated @regression
    Scenario: Child Site Menu - Verify Child site menu on medical page
        Given I am on the url '/custom-pages/child-site-menu'
        When The element 'MedicalLocators > child_site_menu_section' is displayed
        Then The element 'MedicalLocators > child_site_menu_header_subheader' is displayed
        And I expect '9' elements of 'MedicalLocators > child_site_menu_items' are displayed


    @TR-C378155 @megamenu @prio1 @automated @regression
    Scenario: Mega Menu - TA Selection and Navigation to menu category
        Given I am on the url '/med-mega-menu'
        When The element 'MedicalLocators > mega_menu_section' is displayed
        And The element 'MedicalLocators > mega_menu_dropdown_field' is displayed
        And I click on item 'MedicalLocators > mega_menu_dropdown_field'
        And I click item '3' for element 'MedicalLocators > mega_menu_dropdown_items'
        Then The page url contains '/oncology'
        And I expect 'MedicalLocators > mega_menu_dropdown_field' elements are present with innertext:
            | oncology |
        When I click item 'publications' for element 'MedicalLocators > menu_items'
        Then The page url contains '/publications'


    @TR-C378030 @megamenu @prio1 @automated @regression
    Scenario: Mega Menu - Clicking on any Menu category AND when no TA is selected, User directed to the Above TA homepage of that category
        Given I am on the url '/med-mega-menu'
        When The element 'MedicalLocators > mega_menu_dropdown_field' is displayed
        Then I expect 'MedicalLocators > mega_menu_dropdown_field' elements are present with innertext:
            | Therapy Area |
        When I click item 'publications' for element 'MedicalLocators > menu_items'
        Then The page url contains '/publications'
        And I expect 'MedicalLocators > therapy_area_top_dropdown_field' elements are present with innertext:
            | Select therapy area |


    @TR-C368137 @megamenu @prio1 @automated @regression
    Scenario: Mega Menu - Mega Menu Configured with all its configured elements_Desktop
        Given I am on the url '/med-mega-menu'
        When The element 'MedicalLocators > extras_medical_mega_menu_component' is displayed
        Then The element 'MedicalLocators > medical_menu_logo' is displayed
        And I expect '4' elements of 'MedicalLocators > child_site_menu_items' are displayed
        When I click item '4' for element 'MedicalLocators > mega_menu_options'
        Then I expect '2' elements of 'MedicalLocators > mega_menu_medical_asset_sub_menu_count' are displayed
        And The element 'MedicalLocators > medical_menu_sign_in_button' is displayed
        And The element 'MedicalLocators > mega_menu_dropdown_field' is displayed
        And I expect 'MedicalLocators > mega_menu_dropdown_field' elements are present with innertext:
            | Therapy Area |
        And The element 'MedicalLocators > medical_menu_language_toggle_text' is displayed
        And I expect 'MedicalLocators > medical_menu_language_toggle_text' elements are present with innertext:
            | EN |
        When I click on item 'MedicalLocators > medical_menu_language_toggle'
        And I pause for '3' s
        Then I expect 'MedicalLocators > medical_menu_language_toggle_text' elements are present with innertext:
            | X |
        Then The element 'MedicalLocators > language_drop_down_window' is displayed
        When I click on item 'MedicalLocators > medical_menu_language_toggle'
        And I pause for '2' s
        Then I expect that element 'MedicalLocators > language_drop_down_window' is not displayed
        And The element 'MedicalLocators > mega_menu_search_icon' is displayed
        When I click on item 'MedicalLocators > mega_menu_search_icon'
        And I pause for '2' s
        Then I expect 'MedicalLocators > medical_menu_language_toggle_text' elements are present with innertext:
            | X |
        Then The element 'MedicalLocators > mega_menu_search_window' is displayed
        When I click on item 'MedicalLocators > mega_menu_search_icon'
        And I pause for '2' s
        Then I expect that element 'MedicalLocators > mega_menu_search_window' is not displayed


    @TR-C365832 @fmd @prio1 @automated @regression
    Scenario: FMD - Verify that in FMD the /fmd and /therapeutic endpoints return data from Mule API respective endpoints
        Given I am on the url '/'
        And The title is 'Homepage | US Medical'
        When The element 'MedicalLocators > fmd_therapy_area_dropdown_field' is displayed
        And I click on 'MedicalLocators > fmd_therapy_area_dropdown_field'
        And I click item '10' for element 'MedicalLocators > fmd_therapy_area_dropdown_item'
        When The element 'MedicalLocators > fmd_disease_state_field' is displayed
        And I click on 'MedicalLocators > fmd_disease_state_field'
        And I click on element 'MedicalLocators > fmd_disease_state_item'
        When The element 'MedicalLocators > fmd_zip_code' is displayed
        And I type text '10001' in the input field 'MedicalLocators > fmd_zip_code'
        And I click on 'MedicalLocators > fmd_submit_button'
        When The element 'MedicalLocators > fmd_expert_email_address' is displayed
        Then I expect 'MedicalLocators > fmd_expert_email_address' elements are present with innertext:
            | janeen.azare@pfizer.com |


    @TR-C368153 @megamenu @prio1 @automated @regression
    Scenario: Mega Menu - Search bar and language toggle behaviour with TA selector and Sub-menu
        Given I am on the url '/med-mega-menu'
        When The title is 'Mega Menu | US Medical'
        Then The element 'MedicalLocators > extras_medical_mega_menu_component' is displayed
        When I click on item 'MedicalLocators > mega_menu_search_icon'
        Then The element 'MedicalLocators > mega_menu_search_window' is displayed
        When I click on item 'MedicalLocators > mega_menu_dropdown_field'
        And I click item '3' for element 'MedicalLocators > mega_menu_dropdown_items'
        Then The page url contains '/oncology'
        When I am on the url '/med-mega-menu'
        And I click on item 'MedicalLocators > mega_menu_search_icon'
        Then The element 'MedicalLocators > mega_menu_search_window' is displayed
        When I click on item 'MedicalLocators > mega_menu_dropdown_field'
        Then The element 'MedicalLocators > mega_menu_dropdown' is displayed
        When I click on item 'MedicalLocators > mega_menu_dropdown_field'
        Then I expect that element 'MedicalLocators > mega_menu_dropdown' is not displayed
        When I click item '4' for element 'MedicalLocators > mega_menu_options'
        And I click on item 'MedicalLocators > mega_menu_medical_asset_sub_menu1'
        Then The page url contains '/library'
        When I am on the url '/med-mega-menu'
        And I click on item 'MedicalLocators > mega_menu_search_icon'
        Then I expect 'MedicalLocators > medical_menu_language_toggle_text' elements are present with innertext:
            | X |
        Then The element 'MedicalLocators > mega_menu_search_window' is displayed
        When I click on item 'MedicalLocators > mega_menu_search_icon'
        Then I expect that element 'MedicalLocators > mega_menu_search_window' is not displayed
        When I click on item 'MedicalLocators > medical_menu_language_toggle'
        Then The element 'MedicalLocators > language_drop_down_window' is displayed
        When I click on item 'MedicalLocators > mega_menu_dropdown_field'
        And I click item '2' for element 'MedicalLocators > mega_menu_dropdown_items'
        Then The page url does not contain '/med-mega-menu'
        When I am on the url '/med-mega-menu'
        And I click on item 'MedicalLocators > medical_menu_language_toggle'
        Then The element 'MedicalLocators > language_drop_down_window' is displayed
        When I click on item 'MedicalLocators > mega_menu_dropdown_field'
        Then The element 'MedicalLocators > mega_menu_dropdown' is displayed
        When I click on item 'MedicalLocators > mega_menu_dropdown_field'
        Then I expect that element 'MedicalLocators > mega_menu_dropdown' is not displayed
        When I click item '4' for element 'MedicalLocators > mega_menu_options'
        And I click on item 'MedicalLocators > mega_menu_medical_asset_sub_menu1'
        Then The page url contains '/library'
        When I am on the url '/med-mega-menu'
        And I click on item 'MedicalLocators > medical_menu_language_toggle'
        Then The element 'MedicalLocators > language_drop_down_window' is displayed
        When I click on item 'MedicalLocators > mega_menu_search_icon'
        Then The element 'MedicalLocators > mega_menu_search_window' is displayed
        And I expect that element 'MedicalLocators > language_drop_down_window' is not displayed
        When I click on item 'MedicalLocators > medical_menu_language_toggle'
        Then I expect that element 'MedicalLocators > mega_menu_search_window' is not displayed
        And The element 'MedicalLocators > language_drop_down_window' is displayed


    @TR-C378272 @megamenu @prio1 @automated @regression
    Scenario: Mega Menu - GRV Behaviour on Mega Menu
        Given I am on the url '/med-mega-menu'
        When The title is 'Mega Menu | US Medical'
        And The element 'MedicalLocators > extras_medical_mega_menu_component' is displayed
        When I click on item 'MedicalLocators > mega_menu_sign_in'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I press 'TAB'
        And The element 'MedicalLocators > mega_menu_login_button' is displayed
        And I click on item 'MedicalLocators > mega_menu_login_button'
        Then The element 'MedicalLocators > extras_medical_mega_menu_component' is displayed
        And The element 'MedicalLocators > mega_menu_logout' is displayed
        And The element 'MedicalLocators > mega_menu_account_icon' is displayed
        When I click on item 'MedicalLocators > mega_menu_account_icon'
        Then The page url contains '/grv'
        When I press back button from browser
        Then The element 'MedicalLocators > extras_medical_mega_menu_component' is displayed
        When I click on item 'MedicalLocators > mega_menu_logout'
        Then I expect that element 'MedicalLocators > mega_menu_logout' is not displayed


    @TR-C386655 @inpage_ta_selector @prio1 @automated @regression
    Scenario: In-page TA selector - Verify that user is able to reselect the TA from In page TA selector and TA label is updated as per selection
        Given I am on the url '/inpage-ta-selector'
        When The title is 'Homepage | US Medical'
        Then The element 'MedicalLocators > mega_menu_inpage_ta_selector' is displayed
        When I click on item 'MedicalLocators > mega_menu_inpage_ta_dropdown_field'
        Then The element 'MedicalLocators > mega_menu_inpage_ta_dropdown' is displayed
        When I click item '4' for element 'MedicalLocators > mega_menu_inpage_ta_dropdown_items'
        Then I expect 'MedicalLocators > mega_menu_inpage_ta_dropdown_field' elements are present with innertext:
            | Oncology |
        When I click on item 'MedicalLocators > mega_menu_inpage_ta_dropdown_field'
        And I click item '3' for element 'MedicalLocators > mega_menu_inpage_ta_dropdown_items'
        Then I expect 'MedicalLocators > mega_menu_inpage_ta_dropdown_field' elements are present with innertext:
            | Endocrinology |
        And The element 'MedicalLocators > explore_now_button' is enabled
        When I click on item 'MedicalLocators > mega_menu_inpage_ta_dropdown_field'
        And I click item '1' for element 'MedicalLocators > mega_menu_inpage_ta_dropdown_items'
        And I pause for '2' s
        Then The element 'MedicalLocators > explore_now_button_disabled' is displayed


    @TR-C386650 @inpage_ta_selector @prio1 @automated @regression
    Scenario: In-page TA selector - Verify In page Therapy Area selector is visible with all its components and check navigation to selected Therapy Area
        Given I am on the url '/inpage-ta-selector'
        When The title is 'Homepage | US Medical'
        Then The element 'MedicalLocators > mega_menu_inpage_ta_selector' is displayed
        And I expect 'MedicalLocators > mega_menu_inpage_ta_dropdown_field' elements are present with innertext:
            | Select a Therapy Area |
        And The element 'MedicalLocators > explore_now_button_disabled' is displayed
        And The element 'MedicalLocators > mega_menu_ta_selector_get_started' is displayed
        When I click on item 'MedicalLocators > mega_menu_inpage_ta_dropdown_field'
        Then The element 'MedicalLocators > mega_menu_inpage_ta_dropdown' is displayed
        When I click item '4' for element 'MedicalLocators > mega_menu_inpage_ta_dropdown_items'
        Then I expect 'MedicalLocators > mega_menu_inpage_ta_dropdown_field' elements are present with innertext:
            | Oncology |
        And The element 'MedicalLocators > explore_now_button' is enabled
        When I click on item 'MedicalLocators > explore_now_button'
        Then The page url contains '/oncology'
        And I expect 'MedicalLocators > mega_menu_dropdown_field' elements are present with innertext:
            | Oncology |


    @TR-C386569 @ta_selector_search @prio1 @automated @regression
    Scenario: TA Selector Search - Verify re-enabling of TA selector search component when we re-click on disable button
        Given I am on the url '/ta-selector-search'
        And The title is 'Homepage | US Medical'
        When The element 'MedicalLocators > ta_selector_search' is displayed
        Then The element 'MedicalLocators > toggle_disabled' is displayed
        When I click on item 'MedicalLocators > toggle_disabled'
        And I click on item 'MedicalLocators > ta_selector_search_dropdown_field'
        Then I expect that element 'MedicalLocators > ta_selector_search_dropdown' is not displayed
        When I click on item 'MedicalLocators > toggle_disabled'
        Then The element 'MedicalLocators > ta_selector_search_dropdown_field' is displayed
        When I click on item 'MedicalLocators > ta_selector_search_dropdown_field'
        Then The element 'MedicalLocators > ta_selector_search_dropdown' is displayed


    @TR-C367851 @media_cards @prio1 @automated @regression
    Scenario: Media Cards - Read more and read less for media cards with PI and RMM
        Given I am on the url '/oncology/oncology-publication'
        And The title is 'Publications | US Medical'
        And The element 'MedicalLocators > data_resources_cards' is displayed
        When I click on item 'MedicalLocators > read_more_button'
        Then I expect 'MedicalLocators > long_description' elements are present with innertext:
            | This is the long description |
        When I click on item 'MedicalLocators > read_less_button'
        Then I expect 'MedicalLocators > long_description' elements are present with innertext:
            | This is the short description |
        When I click on item 'MedicalLocators > pi_link'
        Then The page url contains '/example.com'
        When I am on the url '/oncology/oncology-publication'
        And I click on item 'MedicalLocators > rmm_link'
        Then The page url contains '/example.com'
