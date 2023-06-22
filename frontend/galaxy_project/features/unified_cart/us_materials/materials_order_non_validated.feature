@nondestructive @unifiedcart @usabove @uc_materials_order_non-validated
Feature:  US Galaxy Materials Order with non-validated

    Background:
        Given I am on the page '/'
        And  Browser is maximized
        When I click on element 'USAbove > sign_in'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%PFIZERPRO-NONVALIDATED-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'USAbove > log_out' is displayed

    @TR-C364903 @automated @regression @prio1
    Scenario: Materials Cart - GRV Non-Validated HCP can place the materials order
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
        And The element 'UnifiedCartLocators > materials > checkout_button' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        And The element 'UnifiedCartLocators > materials > therapy_area_materials_count' text is '1'
        And The element 'UnifiedCartLocators > materials > materials_tabbed_add_more_items' is displayed
        And The element 'UnifiedCartLocators > materials > helix_core_tabs_therapy_areas' is displayed
        When I move to element 'UnifiedCartLocators > materials > gcma_code'
        Then The element 'UnifiedCartLocators > materials > gcma_code' text is 'PP-UNP-USA-0290'
        When I click on item 'UnifiedCartLocators > materials > checkout_button'
        Then I expect that the title is 'Checkout Shipping Details | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > materials > materials_tabbed_add_more_items' is displayed
        And The element 'UnifiedCartLocators > materials > therapy_area_materials_count' text is '1'
        And  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        And  The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' is displayed
        When I set text '16312890300' to field 'UnifiedCartLocators > shipping_page > phone_number'
        When I move to element 'UnifiedCartLocators > shipping_page > address_line2_value'
        And   I clear text from field 'UnifiedCartLocators > shipping_page > address_line2_value'
        And I set text 'testing address 563' to field 'UnifiedCartLocators > shipping_page > address_line2_value'
        When I move to element 'UnifiedCartLocators > materials > gcma_code'
        Then The element 'UnifiedCartLocators > materials > gcma_code' text is 'PP-UNP-USA-0290'
        When I move to element 'UnifiedCartLocators > materials > materials_shipping_place_order'
        And The element 'UnifiedCartLocators > materials > materials_shipping_place_order' is displayed
        And I click on item 'UnifiedCartLocators > materials > materials_shipping_place_order'
        Then  The element 'UnifiedCartLocators > review_page > order_detail_heading' is displayed
        And The element 'UnifiedCartLocators > materials > therapy_area_materials_count' text is '1'
        And I expect that the title is 'Checkout Review Order | Pfizer For Professionals'
        Then The element 'UnifiedCartLocators > materials > review_page > name_review_content' contains the text 'Tauqir Sarwar'
        And The element 'UnifiedCartLocators > materials > review_page > phone_review_content' contains the text '+1 (631) 289-0300'
        When I click on item 'UnifiedCartLocators > materials > review_page > place_order_button'
        And The element 'UnifiedCartLocators > materials > order_confirmation_page > heading' is displayed
        Then I expect that the title is 'Checkout Order Confirmation | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > materials > order_confirmation_page > delivery_details' is displayed
        And I expect 'UnifiedCartLocators > materials > order_confirmation_page > confirmation_page_content' elements are displayed with innertext:
            | Tauqir Sarwar | +1 (631) 289-0300 |
        And The element 'UnifiedCartLocators > materials > order_confirmation_page > find_samples_button' is displayed
        When I move to element 'UnifiedCartLocators > materials > gcma_code'
        Then The element 'UnifiedCartLocators > materials > gcma_code' text is 'PP-UNP-USA-0290'

    @TR-C378288 @automated @regression @prio1
    Scenario: Verify that materials added items should be removed from cart when user logoff or close the browser session
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
        And The element 'UnifiedCartLocators > materials > checkout_button' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        And The element 'UnifiedCartLocators > materials > therapy_area_materials_count' text is '1'
        And The element 'UnifiedCartLocators > materials > materials_tabbed_add_more_items' is displayed
        When I am on the page '/'
        And The element 'USAbove > log_out' is displayed
        And I click on element 'USAbove > log_out'
        And The element 'USAbove > sign_in' is displayed
        When I click on element 'USAbove > sign_in'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%PFIZERPRO-NONVALIDATED-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'USAbove > log_out' is displayed
        When I am on the page '/cart/materials'
        Then I expect that the title is 'Materials | Pfizer For Professionals'
        And I expect that element 'UnifiedCartLocators > cart_empty_message' is displayed
        And The element 'UnifiedCartLocators > materials > materials_tabbed_add_more_items' is displayed

    @TR-C212347 @automated @regression @prio1
    Scenario: Materials Cart - HCP should be able to edit and remove contents added to materials cart
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
        And I pause for '10' s
        And The element 'UnifiedCartLocators > materials > click_on_go_to_cart' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_go_to_cart'
        Then I expect that the title is 'Materials | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > materials > checkout_button' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        And The element 'UnifiedCartLocators > materials > therapy_area_materials_count' text is '1'
        And The element 'UnifiedCartLocators > materials > helix_core_tabs_therapy_areas' is displayed
        When I click on item 'UnifiedCartLocators > materials > checkout_button'
        Then I expect that the title is 'Checkout Shipping Details | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > materials > therapy_area_materials_count' text is '1'
        And  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        And  The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' is displayed
        And  The element 'UnifiedCartLocators > materials > TA_edit_modal_link' is displayed
        When I click on item 'UnifiedCartLocators > materials > TA_edit_modal_link'
        And The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And The attribute 'value' of element 'UnifiedCartLocators > materials > quantity_value' is the value '1'
        And The element 'UnifiedCartLocators > materials > edit_modal_close' is displayed
        When I click on item 'UnifiedCartLocators > materials > TA_edit_modal_link'
        And The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And The element 'UnifiedCartLocators > materials > quantity_increment' is displayed
        When I click on item 'UnifiedCartLocators > materials > quantity_increment'
        And The element 'UnifiedCartLocators > materials > quantity_increment' is displayed
        And I click on item 'UnifiedCartLocators > materials > quantity_increment'
        And The attribute 'value' of element 'UnifiedCartLocators > materials > quantity_value' is the value '3'
        And The element 'UnifiedCartLocators > materials > edit_modal_close' is displayed
        When I click on item 'UnifiedCartLocators > materials > TA_edit_modal_link'
        And The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And The attribute 'value' of element 'UnifiedCartLocators > materials > quantity_value' is the value '3'
        And The element 'UnifiedCartLocators > materials > quantity_increment' is displayed
        When I click on item 'UnifiedCartLocators > materials > quantity_decrement'
        And The element 'UnifiedCartLocators > materials > edit_modal_close' is displayed
        When I click on item 'UnifiedCartLocators > materials > TA_edit_modal_link'
        And The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        Then The attribute 'value' of element 'UnifiedCartLocators > materials > quantity_value' is the value '2'
        When I click on item 'UnifiedCartLocators > materials > remove_materials_link'
        And The element 'UnifiedCartLocators > materials > return_home_materials_button' is displayed
        And The element 'UnifiedCartLocators > materials > materials_link_empty_modal' is displayed
        And The element 'UnifiedCartLocators > materials > cart_empty_modal' is displayed
        And The element 'UnifiedCartLocators > materials > return_home_materials_button' is displayed
        When I click on item 'UnifiedCartLocators > materials > return_home_materials_button'
        And The element 'USAbove > log_out' is displayed
        Then I expect that the title contains 'Home | Pfizer For Professionals'
