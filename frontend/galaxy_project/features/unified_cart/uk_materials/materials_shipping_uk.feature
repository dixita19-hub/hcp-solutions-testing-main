@nondestructive @unifiedcart @ukabove @uc_materials_shipping
Feature: UK Galaxy Materials Shipping Detail Page

    Background:
        Given I am on the page '/'
        And Browser is maximized
        And The title is 'Home | PfizerPro UK'
        And The element 'UKAbove > cookie_accept_all_button' is displayed
        When I click on 'UKAbove > cookie_accept_all_button'
        And The element 'UKAbove > hcp_confirmation_yes' is displayed
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'UKAbove > signin_button' is displayed
        And I click on element 'UKAbove > signin_button'
        And The element 'UKAbove > login > email_id' is displayed
        And I set text '{%AUT2UK%}' to field 'UKAbove > login > email_id'
        And I set text '{%AUTOPASS1%}' to field 'UKAbove > login > pass_phrase'
        And I press 'TAB'
        And I click on element 'UKAbove > login > log_in_button'
        Then I expect that element 'UKAbove > login > logout_button' is displayed

    @TR-C387250-UK @automated @regression @prio1
    Scenario: Shipping Form validation checks
        When The element 'Common > explore_content_menu_item' is displayed
        And I move to element 'UKAbove > explore_content_section'
        And I click on element 'UKAbove > explore_content_materials_link'
        Then I expect that the title is 'Materials | Explore Content | PfizerPro UK'
        And The page url contains 'materials'
        When The element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_btn' is displayed
        Given I am on the page '/explore-content/materials-cart'
        Then I expect that the title is 'Materials | Explore Content | PfizerPro UK'
        And The page url contains 'materials'
        When The element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_btn' is displayed
        And The element 'UnifiedCartLocators > materials > access_material_button_third_card' is displayed
        And I click item '3' for element 'UnifiedCartLocators > materials > access_material_button_by_card_position'
        And The element 'UnifiedCartLocators > materials > click_on_add_to_cart' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_add_to_cart'
        And The element 'UnifiedCartLocators > materials > click_on_go_to_cart' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_go_to_cart'
        Then I expect that the title is 'Materials | PfizerPro UK'
        When The element 'UnifiedCartLocators > materials > checkout_button' is displayed
        And I click on item 'UnifiedCartLocators > materials > checkout_button'
        Then The page url contains '/materials/checkout-shipping-details'
        Then I expect that the title is 'Checkout Shipping Details | PfizerPro UK'
        Then  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        Then  The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' is displayed
        Then The attribute 'value' of element 'UnifiedCartLocators > shipping_page > full_name_value' is the value 'Integration Account'
        And The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' text is 'E1 6AN'
        When  I clear text from field 'UnifiedCartLocators > shipping_page > full_name'
        And   I press 'TAB'
        And   I pause for '2' s
        Then   The element 'UnifiedCartLocators > shipping_page > full_name_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > full_name_error' contains the text 'Please enter a name'
        When I set text 'Integration Account' to field 'UnifiedCartLocators > shipping_page > full_name'
        And   The element 'UnifiedCartLocators > shipping_page > full_name_error' is not displayed
        And   I clear text from field 'UnifiedCartLocators > shipping_page > phone_number'
        And   I press 'TAB'
        And   I pause for '2' s
        Then   The element 'UnifiedCartLocators > shipping_page > phone_number_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > phone_number_error' contains the text 'Please enter a phone number'
        When I set text '17403562800' to field 'UnifiedCartLocators > shipping_page > phone_number'
        And   The element 'UnifiedCartLocators > shipping_page > phone_number_error' is not displayed
        And   I clear text from field 'UnifiedCartLocators > shipping_page > address_line_1'
        And   I press 'TAB'
        And   I pause for '2' s
        Then   The element 'UnifiedCartLocators > shipping_page > address_line_1_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > address_line_1_error' contains the text 'Please enter an address'
        When I set text 'E1 6AN' to field 'UnifiedCartLocators > shipping_page > address_line_1'
        And   The element 'UnifiedCartLocators > shipping_page > address_line_1_error' is not displayed
        And   I clear text from field 'UnifiedCartLocators > shipping_page > city'
        And   I press 'TAB'
        And   I pause for '2' s
        Then   The element 'UnifiedCartLocators > shipping_page > city_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > city_error' contains the text 'Please enter a city'
        When I set text 'JAMESTOWN' to field 'UnifiedCartLocators > shipping_page > city'
        When   I click on element 'UnifiedCartLocators > shipping_page > state_dropdown_value'
        And   I select the value 'Arizona' from dropdown 'UnifiedCartLocators > shipping_page > state_dropdown'
        When   I click on element 'UnifiedCartLocators > shipping_page > state_dropdown_value'
        And   I select the value 'Select a state' from dropdown 'UnifiedCartLocators > shipping_page > state_dropdown'
        And   I pause for '2' s
        Then   The element 'UnifiedCartLocators > shipping_page > state_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > state_error' contains the text 'Please select a state'
        When  I click on element 'UnifiedCartLocators > shipping_page > state_dropdown_value'
        And   I select the value 'Arizona' from dropdown 'UnifiedCartLocators > shipping_page > state_dropdown'
        And   I clear text from field 'UnifiedCartLocators > shipping_page > zipCode'
        And   I press 'TAB'
        And   I pause for '2' s
        Then   The element 'UnifiedCartLocators > shipping_page > zipCode_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > zipCode_error' contains the text 'Please enter a zip code'
        When I set text '54915' to field 'UnifiedCartLocators > shipping_page > zipCode'
        When  I clear text from field 'UnifiedCartLocators > shipping_page > full_name'
        And  I clear text from field 'UnifiedCartLocators > shipping_page > phone_number'
        And I set text 'test name UK' to field 'UnifiedCartLocators > shipping_page > full_name'
        And I set text '7894561232' to field 'UnifiedCartLocators > shipping_page > phone_number'
        When I am on the page '/cart/materials/checkout-shipping-details'
        Then I expect that the title is 'Checkout Shipping Details | PfizerPro UK'
        And  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        And  The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' is displayed
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > full_name_value' is the value 'test name UK'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > phone_number_value' is the value '17894561232'
        And The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' text is 'E1 6AN'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > address_line1_value' is the value 'E1 6AN'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > city_value' is the value 'JAMESTOWN'
        And The element 'UnifiedCartLocators > shipping_page > state_dropdown_value' text is 'Arizona'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > zipCode_value' is the value '54915'
        Given I am on the page '/cart/materials'
        Then I expect that the title is 'Materials | PfizerPro UK'
        When The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And I click on item 'UnifiedCartLocators > materials > remove_materials_link'
