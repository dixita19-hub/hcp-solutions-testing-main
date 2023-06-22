@nondestructive @unifiedcart @ukabove @uc_materials_order_non-validated
Feature:  UK Galaxy Materials Order with non-validated

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

    @TR-C364903-UK @automated @regression @prio1
    Scenario: Materials Cart - GRV Non-Validated HCP can place the materials order
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
        And The element 'UnifiedCartLocators > materials > checkout_button' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        And The element 'UnifiedCartLocators > materials > therapy_area_materials_count' text is '1'
        And The element 'UnifiedCartLocators > materials > materials_tabbed_add_more_items' is displayed
        And The element 'UnifiedCartLocators > materials > helix_core_tabs_therapy_areas' is displayed
        When I move to element 'UnifiedCartLocators > materials > gcma_code'
        Then The element 'UnifiedCartLocators > materials > gcma_code' text is 'PP-UNP-USA-0290'
        When I click on item 'UnifiedCartLocators > materials > checkout_button'
        Then I expect that the title is 'Checkout Shipping Details | PfizerPro UK'
        And The element 'UnifiedCartLocators > materials > materials_tabbed_add_more_items' is displayed
        And The element 'UnifiedCartLocators > materials > therapy_area_materials_count' text is '1'
        Then  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        Then  The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' is displayed
        Then The attribute 'value' of element 'UnifiedCartLocators > shipping_page > full_name' is the value 'Integration Account'
        When The element 'UnifiedCartLocators > shipping_page > address_line2_value' is displayed
        And I move to element 'UnifiedCartLocators > shipping_page > address_line2_value'
        And I set text 'automation testing UK' to field 'UnifiedCartLocators > shipping_page > address_line2_value'
        When I set text '16312890300' to field 'UnifiedCartLocators > shipping_page > phone_number'
        When I set text '123 Malibu Street' to field 'UnifiedCartLocators > shipping_page > address_line_1'
        When I set text 'JAMESTOWN' to field 'UnifiedCartLocators > shipping_page > city'
        When  I click on element 'UnifiedCartLocators > shipping_page > state_dropdown_value'
        And   I select the value 'Arizona' from dropdown 'UnifiedCartLocators > shipping_page > state_dropdown'
        And   I clear text from field 'UnifiedCartLocators > shipping_page > zipCode'
        When I set text '54915' to field 'UnifiedCartLocators > shipping_page > zipCode'
        When I move to element 'UnifiedCartLocators > materials > gcma_code'
        Then The element 'UnifiedCartLocators > materials > gcma_code' text is 'PP-UNP-USA-0290'
        When I move to element 'UnifiedCartLocators > materials > materials_shipping_place_order'
        And The element 'UnifiedCartLocators > materials > materials_shipping_place_order' is displayed
        And I click on item 'UnifiedCartLocators > materials > materials_shipping_place_order'
        Then  The element 'UnifiedCartLocators > review_page > order_detail_heading' is displayed
        And The element 'UnifiedCartLocators > materials > therapy_area_materials_count' text is '1'
        And I expect that the title is 'Checkout Review Order | PfizerPro UK'
        And The element 'UnifiedCartLocators > materials > review_page > name_review_content' contains the text 'Integration Account'
        And The element 'UnifiedCartLocators > materials > review_page > phone_review_content' contains the text '+1 (631) 289-0300'
        When I click on item 'UnifiedCartLocators > materials > review_page > place_order_button'
        And The element 'UnifiedCartLocators > materials > order_confirmation_page > heading' is displayed
        Then I expect that the title is 'Checkout Order Confirmation | PfizerPro UK'
        And The element 'UnifiedCartLocators > materials > order_confirmation_page > delivery_details' is displayed
        And I expect 'UnifiedCartLocators > materials > order_confirmation_page > confirmation_page_content' elements are displayed with innertext:
            | Integration Account | +1 (631) 289-0300 |
        When I move to element 'UnifiedCartLocators > materials > gcma_code'
        Then The element 'UnifiedCartLocators > materials > gcma_code' text is 'PP-UNP-USA-0290'

    @TR-C378288-UK @automated @regression @prio1
    Scenario: Verify that materials added items should be removed from cart when user logoff or close the browser session
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
        And The element 'UnifiedCartLocators > materials > checkout_button' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        And The element 'UnifiedCartLocators > materials > therapy_area_materials_count' text is '1'
        And The element 'UnifiedCartLocators > materials > materials_tabbed_add_more_items' is displayed
        When I am on the page '/'
        And The element 'UKAbove > logout_button' is displayed
        And I click on element 'UKAbove > logout_button'
        And The element 'UKAbove > signin_button' is displayed
        And I click on element 'UKAbove > signin_button'
        And The element 'UKAbove > login > email_id' is displayed
        And I set text '{%AUT2UK%}' to field 'UKAbove > login > email_id'
        And I set text '{%AUTOPASS1%}' to field 'UKAbove > login > pass_phrase'
        And I press 'TAB'
        And I click on element 'UKAbove > login > log_in_button'
        Then I expect that element 'UKAbove > login > logout_button' is displayed
        When I am on the page '/cart/materials'
        Then I expect that the title is 'Materials | PfizerPro UK'
        And I expect that element 'UnifiedCartLocators > cart_empty_message' is displayed
        And The element 'UnifiedCartLocators > materials > materials_tabbed_add_more_items' is displayed

    @TR-C212347-UK @automated @regression @prio1
    Scenario: Materials Cart - HCP should be able to edit and remove contents added to materials cart
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
        And The element 'UnifiedCartLocators > materials > checkout_button' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        And The element 'UnifiedCartLocators > materials > therapy_area_materials_count' text is '1'
        And The element 'UnifiedCartLocators > materials > helix_core_tabs_therapy_areas' is displayed
        When I click on item 'UnifiedCartLocators > materials > checkout_button'
        Then I expect that the title is 'Checkout Shipping Details | PfizerPro UK'
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
        Then I expect that the title is 'Home | PfizerPro UK'
