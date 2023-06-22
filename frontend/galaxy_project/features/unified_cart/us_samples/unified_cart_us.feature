@nondestructive @unifiedcart @usabove @unifiedcart_samples @uc_sanity
Feature: US Galaxy Automated Regression - Unified Cart

    Background:
        Given I am on the page '/'
        And   Browser is maximized
        When  The element 'UnifiedCartLocators > order_menu' is displayed
        And   I move to element 'UnifiedCartLocators > order_menu'
        And   The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And   I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        And The title is 'Request Samples | Pfizer For Professionals'
        And   The element 'USAbove > sign_in2' is displayed
        And   I move to element 'USAbove > sign_in2'
        And  I click on element 'USAbove > sign_in2'
        And   The element 'USAbove > login > emailid' is displayed
        And I set text '{%PFIZERPRO-OPTIN-MATERIALS-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-MATERIALS-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And   I click on element 'USAbove > login > login_button'
        And The title is 'Request Samples | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed

    @TR-C363172 @automated @regression @prio1 @samples_add_remove
    Scenario: Samples Cart - HCP is able to "Add/Remove" allocations (samples/co-pay) in the cart
        Given The title is 'Request Samples | Pfizer For Professionals'
        When I move to element 'UnifiedCartLocators > cart_section'
        Then I expect that element 'UnifiedCartLocators > cart_listing_empty_message' is displayed
        And The element 'UnifiedCartLocators > cart_listing_empty_message' contains the text 'Your cart is empty'
        And The element 'UnifiedCartLocators > listing_checkout_button' is not enabled
        When I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        Then The element 'UnifiedCartLocators > cart_card_title' contains the text 'Product Samples (1)'
        When I click on item 'UnifiedCartLocators > add_third_item_to_cart'
        Then The element 'UnifiedCartLocators > cart_card_title2' contains the text 'Savings Cards (1)'
        And The element 'UnifiedCartLocators > cart_card_title' contains the text 'Product Samples (1)'
        And The element 'UnifiedCartLocators > cart_basket_icon' text is '2'
        Then The element 'UnifiedCartLocators > remove_link' is displayed
        When I move to element 'UnifiedCartLocators > remove_link'
        And I click on element 'UnifiedCartLocators > remove_link'
        And I click on element 'UnifiedCartLocators > remove_link'
        Then I expect that element 'UnifiedCartLocators > cart_listing_empty_message' is displayed
        And The element 'UnifiedCartLocators > cart_listing_empty_message' contains the text 'Your cart is empty'
        And The element 'UnifiedCartLocators > listing_checkout_button' is not enabled
        When The element 'UnifiedCartLocators > add_all_to_cart_button' is displayed
        And I click on element 'UnifiedCartLocators > add_all_to_cart_button'
        And The element 'UnifiedCartLocators > cart_card_title' is displayed
        Then The element 'UnifiedCartLocators > cart_card_title3' contains the text 'Savings Cards (2)'
        And The element 'UnifiedCartLocators > cart_card_title' contains the text 'Product Samples (4)'
        And The element 'UnifiedCartLocators > cart_basket_icon' text is '6'
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        Then The element 'UnifiedCartLocators > remove_link' is displayed
        When I move to element 'UnifiedCartLocators > remove_link'
        And I click on element 'UnifiedCartLocators > remove_link'
        Then The element 'UnifiedCartLocators > cart_card_title4' contains the text 'Savings Cards (2)'
        And The element 'UnifiedCartLocators > cart_card_title' contains the text 'Product Samples (3)'
        And The element 'UnifiedCartLocators > cart_basket_icon' text is '5'
        When I click item '1' for element 'UnifiedCartLocators > product_information_link'
        Then The url 'https://labeling.pfizer.com/ShowLabeling.aspx?id=884' is opened in a new tab
        When I switch to parent tab
        When  The element 'USAbove > log_out' is displayed
        And  I click on element 'USAbove > log_out'
        And  The element 'USAbove > sign_in' is displayed
        And   I move to element 'USAbove > sign_in'
        And  I click on element 'USAbove > sign_in'
        And  The element 'USAbove > login > emailid' is displayed
        And I set text '{%PFIZERPRO-OPTIN-MATERIALS-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-MATERIALS-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And   I click on element 'USAbove > login > login_button'
        When  The element 'UnifiedCartLocators > order_menu' is displayed
        And   I move to element 'UnifiedCartLocators > order_menu'
        And   The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And   I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        And The title is 'Request Samples | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        When I move to element 'UnifiedCartLocators > cart_section'
        Then I expect that element 'UnifiedCartLocators > cart_listing_empty_message' is displayed
        And The element 'UnifiedCartLocators > cart_listing_empty_message' contains the text 'Your cart is empty'
        And The element 'UnifiedCartLocators > listing_checkout_button' is not enabled

    @TR-C2124151 @automated @regression @prio1 @samples_shipping
    Scenario: Samples Cart - Shipping Form validation checks
        Given The title is 'Request Samples | Pfizer For Professionals'
        When I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        And The element 'UnifiedCartLocators > cart_card_title' is displayed
        Then The element 'UnifiedCartLocators > listing_checkout_button' is enabled
        When I click on element 'UnifiedCartLocators > listing_checkout_button'
        Then I expect that the title is 'Checkout Shipping Details | Pfizer For Professionals'
        Then  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        Then  The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' is displayed
        And The element 'UnifiedCartLocators > cart_basket_icon' text is '1'
        Then The attribute 'value' of element 'UnifiedCartLocators > shipping_page > full_name_value' is the value 'Ashley Horner'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > phone_number_value' is the value '7403562800'
        And The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' text is '123 Malibu Street'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > address_line1_value' is the value '123 Malibu Street'
        Then  The element 'UnifiedCartLocators > shipping_page > city_value' is displayed
        Then  The element 'UnifiedCartLocators > shipping_page > zipCode_value' is displayed
        Then  The element 'UnifiedCartLocators > shipping_page > license_value' is displayed
        Then  The element 'UnifiedCartLocators > shipping_page > state_dropdown_value' is displayed
        When  I clear text from field 'UnifiedCartLocators > shipping_page > full_name'
        And   I press 'TAB'
        And   I pause for '2' s
        Then  The element 'UnifiedCartLocators > shipping_page > place_order_button' is not enabled
        And   The element 'UnifiedCartLocators > shipping_page > full_name_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > full_name_error' contains the text 'Please enter a name'
        When I set text 'Ashley Horner' to field 'UnifiedCartLocators > shipping_page > full_name'
        And   The element 'UnifiedCartLocators > shipping_page > full_name_error' is not displayed
        And   I clear text from field 'UnifiedCartLocators > shipping_page > phone_number'
        And   I press 'TAB'
        And   I pause for '2' s
        Then  The element 'UnifiedCartLocators > shipping_page > place_order_button' is not enabled
        And   The element 'UnifiedCartLocators > shipping_page > phone_number_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > phone_number_error' contains the text 'Please enter a phone number'
        When I set text '17403562800' to field 'UnifiedCartLocators > shipping_page > phone_number'
        And   The element 'UnifiedCartLocators > shipping_page > phone_number_error' is not displayed
        And   I clear text from field 'UnifiedCartLocators > shipping_page > address_line_1'
        And   I press 'TAB'
        And   I pause for '2' s
        Then  The element 'UnifiedCartLocators > shipping_page > place_order_button' is not enabled
        And   The element 'UnifiedCartLocators > shipping_page > address_line_1_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > address_line_1_error' contains the text 'Please enter an address'
        When I set text '123 Malibu Street' to field 'UnifiedCartLocators > shipping_page > address_line_1'
        And   The element 'UnifiedCartLocators > shipping_page > address_line_1_error' is not displayed
        And   I clear text from field 'UnifiedCartLocators > shipping_page > city'
        And   I press 'TAB'
        And   I pause for '2' s
        Then  The element 'UnifiedCartLocators > shipping_page > place_order_button' is not enabled
        And   The element 'UnifiedCartLocators > shipping_page > city_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > city_error' contains the text 'Please enter a city'
        When I set text 'JAMESTOWN' to field 'UnifiedCartLocators > shipping_page > city'
        When   I click on element 'UnifiedCartLocators > shipping_page > state_dropdown_value'
        And   I select the value 'Select a state' from dropdown 'UnifiedCartLocators > shipping_page > state_dropdown'
        And   I pause for '2' s
        Then  The element 'UnifiedCartLocators > shipping_page > place_order_button' is not enabled
        And   The element 'UnifiedCartLocators > shipping_page > state_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > state_error' contains the text 'Please select a state'
        When  I click on element 'UnifiedCartLocators > shipping_page > state_dropdown_value'
        And   I select the value 'Arizona' from dropdown 'UnifiedCartLocators > shipping_page > state_dropdown'
        And   I clear text from field 'UnifiedCartLocators > shipping_page > zipCode'
        And   I press 'TAB'
        And   I pause for '2' s
        Then  The element 'UnifiedCartLocators > shipping_page > place_order_button' is not enabled
        And   The element 'UnifiedCartLocators > shipping_page > zipCode_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > zipCode_error' contains the text 'Please enter a zip code'
        When I set text '54915' to field 'UnifiedCartLocators > shipping_page > zipCode'
        And   I clear text from field 'UnifiedCartLocators > shipping_page > license'
        And   I press 'TAB'
        And   I pause for '2' s
        Then  The element 'UnifiedCartLocators > shipping_page > place_order_button' is not enabled
        And   The element 'UnifiedCartLocators > shipping_page > license_error' is displayed
        And   The element 'UnifiedCartLocators > shipping_page > license_error' contains the text 'Please enter a license number'
        When I set text 'D0915' to field 'UnifiedCartLocators > shipping_page > license'
        When  I clear text from field 'UnifiedCartLocators > shipping_page > full_name'
        And  I clear text from field 'UnifiedCartLocators > shipping_page > phone_number'
        And I set text 'test name' to field 'UnifiedCartLocators > shipping_page > full_name'
        And I set text '7894561232' to field 'UnifiedCartLocators > shipping_page > phone_number'
        And The element 'UnifiedCartLocators > shipping_page > place_order_button' is displayed
        And I click on element 'UnifiedCartLocators > shipping_page > place_order_button'
        Then I expect that the title is 'Checkout Review Order | Pfizer For Professionals'
        When I am on the page '/cart/checkout-shipping-details'
        Then I expect that the title is 'Checkout Shipping Details | Pfizer For Professionals'
        And  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        And The element 'UnifiedCartLocators > cart_basket_icon' text is '1'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > full_name_value' is the value 'test name'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > phone_number_value' is the value '17894561232'
        And The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' text is '123 Malibu Street'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > address_line1_value' is the value '123 Malibu Street'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > city_value' is the value 'JAMESTOWN'
        When I move to element 'UnifiedCartLocators > shipping_page > state_dropdown_value'
        Then The element 'UnifiedCartLocators > shipping_page > state_dropdown_value' text is 'Arizona'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > zipCode_value' is the value '54915'
        And The attribute 'value' of element 'UnifiedCartLocators > shipping_page > license_value' is the value 'D0915'
        When I move to element 'UnifiedCartLocators > shipping_page > place_order_button'
        Then The element 'UnifiedCartLocators > shipping_page > place_order_button' is enabled
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'

    @TR-C387251 @automated @regression @prio1 @samples_routing
    Scenario: Samples Cart - User moves to samples listing page when trying to access any samples checkout page without fulfilling pre-requisite step
        Given The title is 'Request Samples | Pfizer For Professionals'
        When I move to element 'UnifiedCartLocators > cart_section'
        Then I expect that element 'UnifiedCartLocators > cart_listing_empty_message' is displayed
        And The element 'UnifiedCartLocators > cart_listing_empty_message' contains the text 'Your cart is empty'
        And The element 'UnifiedCartLocators > listing_checkout_button' is not enabled
        When I am on the page '/cart/checkout-shipping-details'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        And The title is 'Request Samples | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > cart_listing_empty_message' contains the text 'Your cart is empty'
        When I am on the page '/cart/checkout-order-instructions'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        And The title is 'Request Samples | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > cart_listing_empty_message' contains the text 'Your cart is empty'
        When I am on the page '/cart/checkout-review-order'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        And The title is 'Request Samples | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > cart_listing_empty_message' contains the text 'Your cart is empty'
        When I am on the page '/cart/checkout-order-confirmation'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        And The title is 'Request Samples | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > cart_listing_empty_message' contains the text 'Your cart is empty'

    @TR-C386987 @automated @regression @prio1 @samples_edit_modal
    Scenario: Samples Cart - HCP should be able to edit/remove contents added to samples cart
        Given The title is 'Request Samples | Pfizer For Professionals'
        When I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        And I click on item 'UnifiedCartLocators > add_third_item_to_cart'
        And The element 'UnifiedCartLocators > cart_card_title' is displayed
        Then The element 'UnifiedCartLocators > listing_checkout_button' is enabled
        When  I move to element 'UnifiedCartLocators > listing_checkout_button'
        And I click on element 'UnifiedCartLocators > listing_checkout_button'
        Then I expect that the title is 'Checkout Shipping Details | Pfizer For Professionals'
        Then  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        Then  The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' is displayed
        And The element 'UnifiedCartLocators > shipping_page > sample_remove_link' is displayed
        When I click on element 'UnifiedCartLocators > shipping_page > sample_remove_link'
        And The element 'UnifiedCartLocators > shipping_page > sample_remove_link' is displayed
        Then The element 'UnifiedCartLocators > cart_card_title' contains the text 'Savings Cards (1)'
        When I click on element 'UnifiedCartLocators > shipping_page > sample_remove_link'
        When The element 'UnifiedCartLocators > shipping_page > samples_empty_modal' is displayed
        And The element 'UnifiedCartLocators > shipping_page > modal_return_to_home' is displayed
        And I click on element 'UnifiedCartLocators > shipping_page > modal_return_to_home'
        And The title is 'Home | Pfizer For Professionals'
