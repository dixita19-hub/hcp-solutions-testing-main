@nondestructive @unifiedcart @unifiedcart_samples @usabove @uc_samples_esig
Feature: US Galaxy Samples E-signature flow

    Background:
        Given I am on the page '/'
        And  Browser is maximized
        When I click on element 'USAbove > sign_in'

    @TR-C363173 @automated @regression @prio1
    Scenario: Samples Cart - HCP (Opt-Out) user can place the order with Faster Checkouts
        When I set text '{%PFIZERPRO-OPTOUT-MATERIALS-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-MATERIALS-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'USAbove > log_out' is displayed
        And  The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        Then I expect that element 'UnifiedCartLocators > cart_listing_empty_message' is displayed
        And The element 'UnifiedCartLocators > cart_listing_empty_message' contains the text 'Your cart is empty'
        When I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        Then The element 'UnifiedCartLocators > add_first_item_to_cart' contains the text 'Added'
        And The element 'UnifiedCartLocators > cart_card_title' contains the text 'Product Samples (1)'
        And The element 'UnifiedCartLocators > cart_basket_icon' text is '1'
        When The element 'UnifiedCartLocators > listing_checkout_button' is displayed
        And I click on item 'UnifiedCartLocators > listing_checkout_button'
        Then I expect that the title is 'Checkout Shipping Details | Pfizer For Professionals'
        And  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        Then The element 'UnifiedCartLocators > review_page > cart_summary_header' contains the text 'Product Samples (1)'
        When   I clear text from field 'UnifiedCartLocators > shipping_page > phone_number'
        And I set text '17403562800' to field 'UnifiedCartLocators > shipping_page > phone_number'
        And   I press 'TAB'
        And   I pause for '2' s
        And The element 'UnifiedCartLocators > review_page > add_more_items' is displayed
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        When I click on item 'UnifiedCartLocators > shipping_page > place_order_button'
        And The element 'UnifiedCartLocators > review_page > order_detail_heading' is displayed
        Then I expect that the title is 'Checkout Review Order | Pfizer For Professionals'
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        And The element 'UnifiedCartLocators > review_page > edit_link_review' is displayed
        And The element 'UnifiedCartLocators > review_page > name_review_content' contains the text 'Test Stelma'
        And The element 'UnifiedCartLocators > review_page > add_more_items' is enabled
        And The element 'UnifiedCartLocators > review_page > cart_summary_header' contains the text 'Product Samples (1)'
        When I click on item 'UnifiedCartLocators > review_page > place_order_button'
        Then The element 'UnifiedCartLocators > instructions_page > faster_checkouts_field_opt_out' is displayed
        And The element 'UnifiedCartLocators > instructions_page > place_order_button' is not enabled
        And I expect that the title is 'Checkout Order Instructions | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > review_page > add_more_items' is enabled
        And The element 'UnifiedCartLocators > review_page > cart_summary_header' contains the text 'Product Samples (1)'
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        And The element 'UnifiedCartLocators > instructions_page > legal_notice' contains the text 'Legal Notice'
        When I click on item 'UnifiedCartLocators > instructions_page > faster_checkouts_field_opt_out'
        Then The element 'UnifiedCartLocators > instructions_page > place_order_button' is enabled
        When I click on item 'UnifiedCartLocators > instructions_page > faster_checkout_undo_button_opt_out'
        Then The element 'UnifiedCartLocators > instructions_page > validation_error_opt_out' text is 'No signature detected'
        And The element 'UnifiedCartLocators > instructions_page > place_order_button' is not enabled
        When I click on item 'UnifiedCartLocators > instructions_page > faster_checkouts_field_opt_out'
        Then The element 'UnifiedCartLocators > instructions_page > place_order_button' is enabled
        And The element 'UnifiedCartLocators > instructions_page > validation_message_opt_out' text is 'Signature accepted'
        And The element 'UnifiedCartLocators > instructions_page > esignature_enrollment' is displayed
        When I click on item 'UnifiedCartLocators > instructions_page > enrollment_status_checkbox'
        And I click on item 'UnifiedCartLocators > instructions_page > place_order_button'
        Then The element 'UnifiedCartLocators > order_confirmation_page > heading' is displayed
        And The element 'UnifiedCartLocators > review_page > cart_summary_header' contains the text 'Product Samples (1)'
        And I expect that the title is 'Checkout Order Confirmation | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > review_page > name_review_content' contains the text 'Test Stelma'
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        Then The element 'UnifiedCartLocators > order_confirmation_page > find_materials_button' is enabled

    @TR-C363171 @automated @regression @prio1
    Scenario: Samples Cart - HCP (Opted-In) can place the order with "Faster Checkouts"
        When I set text '{%PFIZERPRO-OPTIN-MATERIALS-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-MATERIALS-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'USAbove > log_out' is displayed
        And  The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        Then I expect that element 'UnifiedCartLocators > cart_listing_empty_message' is displayed
        And The element 'UnifiedCartLocators > cart_listing_empty_message' contains the text 'Your cart is empty'
        When I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        Then The element 'UnifiedCartLocators > add_first_item_to_cart' contains the text 'Added'
        And The element 'UnifiedCartLocators > cart_card_title' contains the text 'Product Samples (1)'
        And The element 'UnifiedCartLocators > cart_basket_icon' text is '1'
        When The element 'UnifiedCartLocators > listing_checkout_button' is displayed
        And I click on item 'UnifiedCartLocators > listing_checkout_button'
        Then I expect that the title is 'Checkout Shipping Details | Pfizer For Professionals'
        And  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        And The element 'UnifiedCartLocators > review_page > cart_summary_header' contains the text 'Product Samples (1)'
        And The element 'UnifiedCartLocators > review_page > add_more_items' is displayed
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        When I click on item 'UnifiedCartLocators > shipping_page > place_order_button'
        And The element 'UnifiedCartLocators > review_page > order_detail_heading' is displayed
        Then I expect that the title is 'Checkout Review Order | Pfizer For Professionals'
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        And The element 'UnifiedCartLocators > review_page > edit_link_review' is displayed
        And The element 'UnifiedCartLocators > review_page > name_review_content' contains the text 'Ashley Horner'
        And The element 'UnifiedCartLocators > review_page > add_more_items' is enabled
        And The element 'UnifiedCartLocators > review_page > cart_summary_header' contains the text 'Product Samples (1)'
        When I click on item 'UnifiedCartLocators > review_page > place_order_button'
        Then The element 'UnifiedCartLocators > instructions_page > faster_checkouts_field' is displayed
        And The element 'UnifiedCartLocators > instructions_page > place_order_button' is not enabled
        And I expect that the title is 'Checkout Order Instructions | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > instructions_page > legal_notice' contains the text 'Legal Notice'
        And The element 'UnifiedCartLocators > review_page > add_more_items' is enabled
        And The element 'UnifiedCartLocators > review_page > cart_summary_header' contains the text 'Product Samples (1)'
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        When I move to element 'UnifiedCartLocators > instructions_page > faster_checkouts_field'
        And I click on item 'UnifiedCartLocators > instructions_page > faster_checkouts_field'
        Then The element 'UnifiedCartLocators > instructions_page > place_order_button' is enabled
        When I click on item 'UnifiedCartLocators > instructions_page > faster_checkout_undo_button'
        Then The element 'UnifiedCartLocators > instructions_page > validation_error' text is 'No signature detected'
        And The element 'UnifiedCartLocators > instructions_page > place_order_button' is not enabled
        When I click on item 'UnifiedCartLocators > instructions_page > faster_checkouts_field'
        Then The element 'UnifiedCartLocators > instructions_page > place_order_button' is enabled
        And The element 'UnifiedCartLocators > instructions_page > validation_message' text is 'Signature accepted'
        And The element 'UnifiedCartLocators > instructions_page > esignature_enrollment' is not displayed
        When I click on item 'UnifiedCartLocators > instructions_page > place_order_button'
        Then The element 'UnifiedCartLocators > order_confirmation_page > heading' is displayed
        And The element 'UnifiedCartLocators > review_page > cart_summary_header' contains the text 'Product Samples (1)'
        And I expect that the title is 'Checkout Order Confirmation | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > review_page > name_review_content' contains the text 'Ashley Horner'
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        And The element 'UnifiedCartLocators > order_confirmation_page > find_materials_button' is enabled

    @TR-C363775 @automated @regression @prio1
    Scenario: Samples Cart - HCP (Opted-In) can place the order with "Sign via esignature credentials"
        When I set text '{%PFIZERPRO-OPTIN-MATERIALS-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-MATERIALS-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'USAbove > log_out' is displayed
        And  The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        Then I expect that element 'UnifiedCartLocators > cart_listing_empty_message' is displayed
        And The element 'UnifiedCartLocators > cart_listing_empty_message' contains the text 'Your cart is empty'
        When I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        Then The element 'UnifiedCartLocators > add_first_item_to_cart' contains the text 'Added'
        And The element 'UnifiedCartLocators > cart_card_title' contains the text 'Product Samples (1)'
        And The element 'UnifiedCartLocators > cart_basket_icon' text is '1'
        When The element 'UnifiedCartLocators > listing_checkout_button' is displayed
        And I click on item 'UnifiedCartLocators > listing_checkout_button'
        Then I expect that the title is 'Checkout Shipping Details | Pfizer For Professionals'
        And  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        And The element 'UnifiedCartLocators > review_page > cart_summary_header' contains the text 'Product Samples (1)'
        And The element 'UnifiedCartLocators > review_page > add_more_items' is displayed
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        When I click on item 'UnifiedCartLocators > shipping_page > place_order_button'
        And The element 'UnifiedCartLocators > review_page > order_detail_heading' is displayed
        Then I expect that the title is 'Checkout Review Order | Pfizer For Professionals'
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        And The element 'UnifiedCartLocators > review_page > edit_link_review' is displayed
        And The element 'UnifiedCartLocators > review_page > name_review_content' contains the text 'Ashley Horner'
        And The element 'UnifiedCartLocators > review_page > add_more_items' is enabled
        And The element 'UnifiedCartLocators > review_page > cart_summary_header' contains the text 'Product Samples (1)'
        When I click on item 'UnifiedCartLocators > review_page > place_order_button'
        And The element 'UnifiedCartLocators > instructions_page > faster_checkouts_field' is displayed
        Then The element 'UnifiedCartLocators > instructions_page > place_order_button' is not enabled
        When I set text 'test@test.com' to field 'UnifiedCartLocators > instructions_page > username'
        And I set text '{%PFIZERPRO-TESTPASSWORD%}' to field 'UnifiedCartLocators > instructions_page > password'
        And I click on item 'UnifiedCartLocators > instructions_page > submit_button'
        Then The element 'UnifiedCartLocators > instructions_page > username_validation_error' is displayed
        Then The element 'UnifiedCartLocators > instructions_page > place_order_button' is not enabled
        And The element 'UnifiedCartLocators > instructions_page > submit_button' is not enabled
        When I clear text from field 'UnifiedCartLocators > instructions_page > username'
        And I type text ' ' in the input field 'UnifiedCartLocators > instructions_page > username'
        And I press 'BACKSPACE'
        Then The element 'UnifiedCartLocators > instructions_page > username_validation_error' text is 'Please enter an email address'
        When I clear text from field 'UnifiedCartLocators > instructions_page > password'
        And I type text ' ' in the input field 'UnifiedCartLocators > instructions_page > password'
        And I press 'BACKSPACE'
        Then The element 'UnifiedCartLocators > instructions_page > password_validation_error' text is 'Please enter correct password'
        When I clear text from field 'UnifiedCartLocators > instructions_page > username'
        When I set text '{%PFIZERPRO-OPTIN-MATERIALS-TESTUSER%}' to field 'UnifiedCartLocators > instructions_page > username'
        And I clear text from field 'UnifiedCartLocators > instructions_page > password'
        And I set text '{%PFIZERPRO-MATERIALS-TESTPASSWORD%}' to field 'UnifiedCartLocators > instructions_page > password'
        And The element 'UnifiedCartLocators > instructions_page > submit_button' is enabled
        And I click on item 'UnifiedCartLocators > instructions_page > submit_button'
        And I pause for '15' s
        And The element 'UnifiedCartLocators > instructions_page > place_order_button' is enabled
        And I click on item 'UnifiedCartLocators > instructions_page > place_order_button'
        Then The element 'UnifiedCartLocators > order_confirmation_page > heading' is displayed
        And The element 'UnifiedCartLocators > review_page > cart_summary_header' contains the text 'Product Samples (1)'
        And I expect that the title is 'Checkout Order Confirmation | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > review_page > name_review_content' contains the text 'Ashley Horner'
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        And The element 'UnifiedCartLocators > order_confirmation_page > find_materials_button' is enabled
