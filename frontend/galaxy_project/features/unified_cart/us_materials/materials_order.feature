@nondestructive @unifiedcart @usabove @uc_materials_order
Feature:  US Galaxy Materials Order Automated Test Cases
    Background:
        Given I am on the page '/'
        And  Browser is maximized
        When I click on element 'USAbove > sign_in'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%PFIZERPRO-OPTIN-MATERIALS-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-MATERIALS-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'USAbove > log_out' is displayed

    @TR-C364902 @automated @regression @prio1
    Scenario: GRV Validated HCP can place the materials order (single cart)
        When The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        And I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        And The element 'UnifiedCartLocators > listing_checkout_button' is displayed
        And The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_materials_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_materials_sub_menu'
        And The element 'EventsLocators > menu_picker_product_dropdown' is displayed
        And I click on item 'EventsLocators > menu_picker_product_dropdown'
        And I click item 'BeneFIX® Coagulation' for element 'EventsLocators > menu_picker_ta_dropdown_item_by_name'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > go-button'
        And The element 'UnifiedCartLocators > materials > access_material_button_third_card' is displayed
        And I click item '3' for element 'UnifiedCartLocators > materials > access_material_button_by_card_position'
        And The element 'UnifiedCartLocators > materials > click_on_add_to_cart' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_add_to_cart'
        And The element 'UnifiedCartLocators > materials > click_on_go_to_cart' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_go_to_cart'
        And I pause for '10' s
        And The element 'UnifiedCartLocators > cart_tabs_materials' is displayed
        And The element 'UnifiedCartLocators > materials > add_more_items' is displayed
        And I move to element 'UnifiedCartLocators > materials > add_more_items'
        And I click on item 'UnifiedCartLocators > materials > add_more_items'
        Then The page url contains '/materials'
        When The element 'EventsLocators > menu_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > menu_picker_ta_dropdown'
        And I click item 'Breast Cancer' for element 'EventsLocators > menu_picker_ta_dropdown_item_by_name'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > go-button'
        And The element 'UnifiedCartLocators > materials > access_material_button_third_card' is displayed
        And I click item '3' for element 'UnifiedCartLocators > materials > access_material_button_by_card_position'
        And The element 'UnifiedCartLocators > materials > click_on_add_to_cart' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_add_to_cart'
        And The element 'UnifiedCartLocators > materials > click_on_go_to_cart' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_go_to_cart'
        And I pause for '10' s
        And The element 'UnifiedCartLocators > cart_tabs_materials' is displayed
        Then The element 'UnifiedCartLocators > cart_tabs_materials' text is 'Materials (2)'
        And The element 'UnifiedCartLocators > materials > materials_cart_total' is displayed
        Then The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (2)'
        And The element 'UnifiedCartLocators > materials > helix_core_tabs_therapy_areas' text is 'Therapy Areas (1)'
        And The element 'UnifiedCartLocators > materials > add_more_items' is enabled
        And The element 'UnifiedCartLocators > materials > checkout_button' is enabled
        When The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And I click on item 'UnifiedCartLocators > materials > remove_materials_link'
        When I click on item 'UnifiedCartLocators > materials > checkout_button'
        And I pause for '15' s
        Then The attribute 'value' of element 'UnifiedCartLocators > shipping_page > full_name' is the value 'Ashley Horner'
        When The element 'UnifiedCartLocators > shipping_page > address_line2_value' is displayed
        And I move to element 'UnifiedCartLocators > shipping_page > address_line2_value'
        And I set text 'automation testing' to field 'UnifiedCartLocators > shipping_page > address_line2_value'
        And The element 'UnifiedCartLocators > materials > place_order_button' is displayed
        And I move to element 'UnifiedCartLocators > materials > place_order_button'
        And I click on item 'UnifiedCartLocators > materials > place_order_button'
        And  The element 'UnifiedCartLocators > review_page > order_detail_heading' is displayed
        And I click on item 'UnifiedCartLocators > materials > review_page > place_order_button'
        And The element 'UnifiedCartLocators > materials > order_confirmation_page > heading' is displayed
        Then I expect that the title is 'Checkout Order Confirmation | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > materials > order_confirmation_page > delivery_details' is displayed
        And I expect 'UnifiedCartLocators > materials > order_confirmation_page > confirmation_page_content' elements are displayed with innertext:
            | Ashley Horner | +1 (740) 356-2800 |
        And The element 'UnifiedCartLocators > materials > order_confirmation_page > checkout_button' is displayed


    @TR-C212338 @automated @regression @prio1
    Scenario: Materials tabbed contents/counts are correctly displayed (multi-cart)
        When The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        And I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        And The element 'UnifiedCartLocators > listing_checkout_button' is displayed
        And The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_materials_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_materials_sub_menu'
        And The element 'EventsLocators > menu_picker_product_dropdown' is displayed
        And I click on item 'EventsLocators > menu_picker_product_dropdown'
        And I click item 'BeneFIX® Coagulation' for element 'EventsLocators > menu_picker_ta_dropdown_item_by_name'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > go-button'
        And The element 'UnifiedCartLocators > materials > access_material_button_third_card' is displayed
        And I click item '2' for element 'UnifiedCartLocators > materials > access_material_button_by_card_position'
        And The element 'UnifiedCartLocators > materials > click_on_add_to_cart_ben' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_add_to_cart_ben'
        And I pause for '15' s
        And The element 'UnifiedCartLocators > materials > click_on_go_to_cart_ben' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_go_to_cart_ben'
        And The element 'UnifiedCartLocators > cart_tabs_materials' is displayed
        And The element 'UnifiedCartLocators > materials > add_more_items' is displayed
        And I move to element 'UnifiedCartLocators > materials > add_more_items'
        And I click on item 'UnifiedCartLocators > materials > add_more_items'
        Then The page url contains '/materials'
        When The element 'EventsLocators > menu_picker_ta_dropdown' is displayed
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
        And The element 'UnifiedCartLocators > cart_tabs_materials' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' is displayed
        Then The element 'UnifiedCartLocators > cart_tabs_materials' text is 'Materials (2)'
        Then The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (2)'
        And The element 'UnifiedCartLocators > materials > helix_core_tabs_therapy_areas' text is 'Therapy Areas (1)'
        And The element 'UnifiedCartLocators > materials > add_more_items' is enabled
        And The element 'UnifiedCartLocators > materials > checkout_button' is enabled
        When The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And I click on item 'UnifiedCartLocators > materials > remove_materials_link'
        Then The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        And The element 'UnifiedCartLocators > materials > product_info_link' is displayed
        And The element 'UnifiedCartLocators > materials > checkout_button' is displayed
        When I move to element 'UnifiedCartLocators > materials > add_more_items'
        And The element 'UnifiedCartLocators > materials > add_more_items' is displayed
        And I click on item 'UnifiedCartLocators > materials > add_more_items'
        Then The page url contains '/materials'
        When The element 'EventsLocators > menu_picker_ta_dropdown' is displayed
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
        And The element 'UnifiedCartLocators > cart_tabs_materials' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' is displayed
        Then The element 'UnifiedCartLocators > cart_tabs_materials' text is 'Materials (2)'
        And The element 'UnifiedCartLocators > cart_tabs_samples' text is 'Samples & Savings (1)'
        And The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (2)'
        When I click on item 'UnifiedCartLocators > materials > increment_quantity'
        Then The attribute 'value' of element 'UnifiedCartLocators > materials > get_quantity' is the value '2'
        When The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And I click on item 'UnifiedCartLocators > materials > remove_materials_link'
        And I pause for '2' s
        And I click on item 'UnifiedCartLocators > materials > remove_materials_link'
        And I pause for '2' s
        Then I expect that element 'UnifiedCartLocators > cart_empty_message' is displayed

    @TR-C212366 @automated @regression @prio1
    Scenario: Access any materials checkout page without fulfilling pre-requisite step
        When The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        And I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        And The element 'UnifiedCartLocators > listing_checkout_button' is displayed
        And The element 'UnifiedCartLocators > order_menu' is displayed
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
        And I pause for '10' s
        And The element 'UnifiedCartLocators > materials > click_on_go_to_cart' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_go_to_cart'
        Then The element 'UnifiedCartLocators > cart_tabs_materials' is displayed
        Given I am on the page '/cart/materials/checkout-review-order'
        Then The element 'UnifiedCartLocators > cart_tabs_materials' is displayed
        Given I am on the page '/cart/materials/checkout-order-confirmation'
        Then The element 'UnifiedCartLocators > cart_tabs_materials' is displayed
         # Teardown step
        When The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And I click on item 'UnifiedCartLocators > materials > remove_materials_link'
        And I pause for '2' s

    @TR-C393176 @automated @regression @prio1
    Scenario: HCP should be able to edit and remove contents added to materials cart (Validated HCP)
        When The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        And The element 'UnifiedCartLocators > cart_loaded' is displayed
        And I click on item 'UnifiedCartLocators > add_first_item_to_cart'
        And The element 'UnifiedCartLocators > listing_checkout_button' is displayed
        And The element 'UnifiedCartLocators > order_menu' is displayed
        And I move to element 'UnifiedCartLocators > order_menu'
        And The element 'UnifiedCartLocators > request_materials_sub_menu' is displayed
        And I click on element 'UnifiedCartLocators > request_materials_sub_menu'
        And The element 'EventsLocators > menu_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > menu_picker_product_dropdown'
        And I click on item 'EventsLocators > menu_picker_product_dropdown_item'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > go-button'
        When The element 'UnifiedCartLocators > materials > access_material_button_third_card' is displayed
        And I click item '3' for element 'UnifiedCartLocators > materials > access_material_button_by_card_position'
        And The element 'UnifiedCartLocators > materials > click_on_add_to_cart' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_add_to_cart'
        And I pause for '10' s
        And The element 'UnifiedCartLocators > materials > click_on_go_to_cart' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_go_to_cart'
        And The element 'UnifiedCartLocators > cart_tabs_materials' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' is displayed
        Then The element 'UnifiedCartLocators > cart_tabs_materials' text is 'Materials (1)'
        And The element 'UnifiedCartLocators > cart_tabs_samples' text is 'Samples & Savings (1)'
        When The element 'UnifiedCartLocators > materials > checkout_button' is displayed
        And I click on item 'UnifiedCartLocators > materials > checkout_button'
        And The element 'UnifiedCartLocators > shipping_page > full_name' is displayed
        And The element 'UnifiedCartLocators > checkout_edit_modal_pop > open_modal_link' is displayed
        And I click on item 'UnifiedCartLocators > checkout_edit_modal_pop > open_modal_link'
        Then The element 'UnifiedCartLocators > checkout_edit_modal_pop > product_info_link' is displayed
        When I click on item 'UnifiedCartLocators > materials > increment_quantity'
        Then The attribute 'value' of element 'UnifiedCartLocators > materials > get_quantity' is the value '2'
        Then The element 'UnifiedCartLocators > checkout_edit_modal_pop > remove_link' is displayed
        When I click on item 'UnifiedCartLocators > checkout_edit_modal_pop > remove_link'
        Then The element 'UnifiedCartLocators > checkout_edit_modal_pop > return_to_home' is displayed
        When I click on item 'UnifiedCartLocators > checkout_edit_modal_pop > return_to_home'
        Then I expect that the title is 'Home | Pfizer For Professionals'
