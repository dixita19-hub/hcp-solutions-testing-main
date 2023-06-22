@nondestructive @unifiedcart @usabove @uc_materials_shipping
Feature: US Galaxy Materials Shipping Detail Page

    Background:
        Given I am on the page '/'
        And  Browser is maximized
        When I click on element 'USAbove > sign_in'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%PFIZERPRO-OPTIN-MATERIALS-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-MATERIALS-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'USAbove > log_out' is displayed

    @TR-C387250 @automated @regression @prio1
    Scenario: Shipping Form validation checks
        When The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_materials_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_materials_sub_menu'
        And The element 'EventsLocators > menu_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > menu_picker_ta_dropdown'
        And I click item 'Breast Cancer' for element 'EventsLocators > menu_picker_ta_dropdown_item_by_name'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > go-button'
        And The element 'UnifiedCartLocators > materials > access_material_button_third_card' is displayed
        And I click item '3' for element 'UnifiedCartLocators > materials > access_material_button_by_card_position'
        And The element 'UnifiedCartLocators > materials > click_on_add_to_cart' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_add_to_cart'
        And I pause for '15' s
        And The element 'UnifiedCartLocators > materials > click_on_go_to_cart' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_go_to_cart'
        Then I expect that the title is 'Materials | Pfizer For Professionals'
        When The element 'UnifiedCartLocators > materials > checkout_button' is displayed
        And I click on item 'UnifiedCartLocators > materials > checkout_button'
        Then The page url contains '/materials/checkout-shipping-details'
        Then I expect that the title is 'Checkout Shipping Details | Pfizer For Professionals'
        Then  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        Then  The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' is displayed
        Then The attribute 'value' of element 'UnifiedCartLocators > shipping_page > full_name_value' is the value 'Ashley Horner'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > phone_number_value' is the value '7403562800'
        And The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' text is '123 Malibu Street'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > address_line1_value' is the value '123 Malibu Street'
        Then  The element 'UnifiedCartLocators > shipping_page > city_value' is displayed
        Then  The element 'UnifiedCartLocators > shipping_page > zipCode_value' is displayed
        Then  The element 'UnifiedCartLocators > shipping_page > state_dropdown_value' is displayed
        When  I clear text from field 'UnifiedCartLocators > shipping_page > full_name'
        And   I press 'TAB'
        And   I pause for '2' s
        Then   The element 'UnifiedCartLocators > shipping_page > full_name_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > full_name_error' contains the text 'Please enter a name'
        When I set text 'Ashley Horner' to field 'UnifiedCartLocators > shipping_page > full_name'
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
        When I set text '123 Malibu Street' to field 'UnifiedCartLocators > shipping_page > address_line_1'
        And   The element 'UnifiedCartLocators > shipping_page > address_line_1_error' is not displayed
        And   I clear text from field 'UnifiedCartLocators > shipping_page > city'
        And   I press 'TAB'
        And   I pause for '2' s
        Then   The element 'UnifiedCartLocators > shipping_page > city_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > city_error' contains the text 'Please enter a city'
        When I set text 'JAMESTOWN' to field 'UnifiedCartLocators > shipping_page > city'
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
        And I set text 'test name' to field 'UnifiedCartLocators > shipping_page > full_name'
        And I set text '7894561232' to field 'UnifiedCartLocators > shipping_page > phone_number'
        When I am on the page '/cart/materials/checkout-shipping-details'
        Then I expect that the title is 'Checkout Shipping Details | Pfizer For Professionals'
        And  The element 'UnifiedCartLocators > shipping_page > full_name' is displayed
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > full_name_value' is the value 'test name'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > phone_number_value' is the value '17894561232'
        And The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' text is '123 Malibu Street'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > address_line1_value' is the value '123 Malibu Street'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > city_value' is the value 'JAMESTOWN'
        And The element 'UnifiedCartLocators > shipping_page > state_dropdown_value' text is 'Arizona'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > zipCode_value' is the value '54915'
        Given I am on the page '/cart/materials'
        Then I expect that the title is 'Materials | Pfizer For Professionals'
        When The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And I click on item 'UnifiedCartLocators > materials > remove_materials_link'
        And I pause for '5' s
