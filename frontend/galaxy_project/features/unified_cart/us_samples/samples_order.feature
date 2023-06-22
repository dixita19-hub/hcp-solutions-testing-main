@nondestructive @unifiedcart @usabove @unifiedcart_samples @uc_samples_order @samples_tabbed
Feature: US Galaxy Samples Tabbed Page

    Background:
        Given I am on the page '/'
        And  Browser is maximized
        When I click on element 'USAbove > sign_in'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%PFIZERPRO-OPTIN-MATERIALS-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-MATERIALS-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'USAbove > log_out' is displayed

    @TR-C379875 @automated @regression @prio1
    Scenario: Samples Cart - Samples tabbed contents/counts are correctly displayed (multi-cart)
        When  The element 'UnifiedCartLocators > order_menu' is displayed
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
        Given I am on the page '/'
        When The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        When I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        Then The element 'UnifiedCartLocators > cart_card_title' contains the text 'Product Samples (1)'
        When I click on item 'UnifiedCartLocators > add_third_item_to_cart'
        Then The element 'UnifiedCartLocators > cart_card_title2' contains the text 'Savings Cards (1)'
        And The element 'UnifiedCartLocators > cart_card_title' contains the text 'Product Samples (1)'
        And The element 'UnifiedCartLocators > listing_checkout_button' is displayed
        And The element 'UnifiedCartLocators > cart_basket_icon' text is '3'
        Given I am on the page '/cart/samples'
        And The element 'UnifiedCartLocators > cart_tabs_samples' is displayed
        Then The element 'UnifiedCartLocators > cart_tabs_samples' text is 'Samples & Savings (2)'
        When I click on element 'UnifiedCartLocators > cart_tabs_samples'
        Then The page url contains '/cart/samples'
        When The element 'UnifiedCartLocators > materials > remove_samples_link' is displayed
        And The element 'UnifiedCartLocators > materials > samples_tabbed_checkout_button' is displayed
        And The element 'UnifiedCartLocators > materials > samples_tabbed_add_more_items' is displayed
        And The element 'UnifiedCartLocators > materials > samples_tabbed_total_count' contains the text 'Samples & Savings Cards Cart (2)'
        And The element 'UnifiedCartLocators > materials > sample_total_count' contains the text '1'
        And The element 'UnifiedCartLocators > materials > copay_total_count' contains the text '1'
        When The element 'UnifiedCartLocators > materials > remove_samples_link' is displayed
        And I click on item 'UnifiedCartLocators > materials > remove_samples_link'
        And The element 'UnifiedCartLocators > materials > sample_total_count' contains the text '1'
        And The element 'UnifiedCartLocators > materials > samples_tabbed_total_count' contains the text 'Samples & Savings Cards Cart (1)'
        And I pause for '5' s
        And The element 'UnifiedCartLocators > materials > samples_tabbed_add_more_items' is enabled
        And I move to element 'UnifiedCartLocators > materials > samples_tabbed_add_more_items'
        And I click on element 'UnifiedCartLocators > materials > samples_tabbed_add_more_items'
        Given I am on the page '/cart'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        When I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        And The element 'UnifiedCartLocators > listing_checkout_button' is displayed
        Given I am on the page '/cart/samples'
        And The element 'UnifiedCartLocators > materials > samples_tabbed_checkout_button' is displayed
        And The element 'UnifiedCartLocators > materials > samples_tabbed_total_count' contains the text 'Samples & Savings Cards Cart (2)'
        And The element 'UnifiedCartLocators > materials > sample_total_count' contains the text '1'
        And The element 'UnifiedCartLocators > materials > copay_total_count' contains the text '1'
        And I click on item 'UnifiedCartLocators > materials > remove_samples_link'
        And I click on item 'UnifiedCartLocators > materials > remove_samples_link'
        And The element 'UnifiedCartLocators > materials > samples_tabbed_checkout_button' is displayed
        And The element 'UnifiedCartLocators > materials > empty_cart_screen' contains the text 'Your cart is empty'

    @TR-C392128 @automated @regression @prio1
    Scenario: Samples Cart - Samples tabbed contents/counts are correctly displayed (single-cart)
        When  The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        When I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        Then The element 'UnifiedCartLocators > cart_card_title' contains the text 'Product Samples (1)'
        When I click on item 'UnifiedCartLocators > add_third_item_to_cart'
        Then The element 'UnifiedCartLocators > cart_card_title2' contains the text 'Savings Cards (1)'
        And The element 'UnifiedCartLocators > cart_card_title' contains the text 'Product Samples (1)'
        And The element 'UnifiedCartLocators > listing_checkout_button' is displayed
        When I am on the page '/cart/samples'
        When The element 'UnifiedCartLocators > materials > remove_samples_link' is displayed
        And The element 'UnifiedCartLocators > materials > samples_tabbed_checkout_button' is displayed
        And The element 'UnifiedCartLocators > materials > samples_tabbed_add_more_items' is displayed
        And The element 'UnifiedCartLocators > materials > samples_tabbed_total_count' contains the text 'Samples & Savings Cards Cart (2)'
        And The element 'UnifiedCartLocators > materials > sample_total_count' contains the text '1'
        And The element 'UnifiedCartLocators > materials > copay_total_count' contains the text '1'
        When The element 'UnifiedCartLocators > materials > remove_samples_link' is displayed
        And I click on item 'UnifiedCartLocators > materials > remove_samples_link'
        And The element 'UnifiedCartLocators > materials > sample_total_count' contains the text '1'
        And The element 'UnifiedCartLocators > materials > samples_tabbed_total_count' contains the text 'Samples & Savings Cards Cart (1)'
        And I pause for '5' s
        And The element 'UnifiedCartLocators > materials > samples_tabbed_add_more_items' is enabled
        And I move to element 'UnifiedCartLocators > materials > samples_tabbed_add_more_items'
        And I click on element 'UnifiedCartLocators > materials > samples_tabbed_add_more_items'
        And I am on the page '/cart'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        When I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        And The element 'UnifiedCartLocators > listing_checkout_button' is displayed
        And I am on the page '/cart/samples'
        And The element 'UnifiedCartLocators > materials > samples_tabbed_checkout_button' is displayed
        And The element 'UnifiedCartLocators > materials > samples_tabbed_total_count' contains the text 'Samples & Savings Cards Cart (2)'
        And The element 'UnifiedCartLocators > materials > sample_total_count' contains the text '1'
        And The element 'UnifiedCartLocators > materials > copay_total_count' contains the text '1'
        And I click on item 'UnifiedCartLocators > materials > remove_samples_link'
        And I click on item 'UnifiedCartLocators > materials > remove_samples_link'
        And The element 'UnifiedCartLocators > materials > samples_tabbed_checkout_button' is displayed
        And The element 'UnifiedCartLocators > materials > empty_cart_screen' contains the text 'Your cart is empty'
        And The element 'UnifiedCartLocators > materials > samples_tabbed_checkout_button' is displayed
