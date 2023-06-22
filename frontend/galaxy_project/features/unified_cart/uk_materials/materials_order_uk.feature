@nondestructive @unifiedcart @ukabove @uc_materials_order
Feature:  UK Galaxy Materials Order Automated Test Cases

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

    @TR-C364902-UK @automated @regression @prio1
    Scenario: GRV Validated HCP can place the materials order (single cart)
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
        And I click item '2' for element 'UnifiedCartLocators > materials > access_material_button_by_card_position'
        And The element 'UnifiedCartLocators > materials > click_on_add_to_cart_ben' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_add_to_cart_ben'
        And The element 'UnifiedCartLocators > materials > click_on_go_to_cart_ben' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_go_to_cart_ben'
        And The element 'UnifiedCartLocators > materials > add_more_items' is displayed
        And I move to element 'UnifiedCartLocators > materials > add_more_items'
        And I click on item 'UnifiedCartLocators > materials > add_more_items'
        Then The page url contains '/materials'
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
        And The element 'UnifiedCartLocators > materials > add_more_items' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' is displayed
        Then The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (2)'
        And The element 'UnifiedCartLocators > materials > helix_core_tabs_therapy_areas' text is 'Therapy Areas (1)'
        And The element 'UnifiedCartLocators > materials > add_more_items' is enabled
        And The element 'UnifiedCartLocators > materials > checkout_button' is enabled
        When The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And I click on item 'UnifiedCartLocators > materials > remove_materials_link'
        When I click on item 'UnifiedCartLocators > materials > checkout_button'
        Then I expect that the title is 'Checkout Shipping Details | PfizerPro UK'
        Then  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        Then  The element 'UnifiedCartLocators > shipping_page > address_dropdown_value' is displayed
        Then The attribute 'value' of element 'UnifiedCartLocators > shipping_page > full_name' is the value 'Integration Account'
        When The element 'UnifiedCartLocators > shipping_page > address_line2_value' is displayed
        And I move to element 'UnifiedCartLocators > shipping_page > address_line2_value'
        And I set text 'automation testing UK' to field 'UnifiedCartLocators > shipping_page > address_line2_value'
        When I set text '17403562800' to field 'UnifiedCartLocators > shipping_page > phone_number'
        When I set text '123 Malibu Street' to field 'UnifiedCartLocators > shipping_page > address_line_1'
        When I set text 'JAMESTOWN' to field 'UnifiedCartLocators > shipping_page > city'
        When  I click on element 'UnifiedCartLocators > shipping_page > state_dropdown_value'
        And   I select the value 'Arizona' from dropdown 'UnifiedCartLocators > shipping_page > state_dropdown'
        And   I clear text from field 'UnifiedCartLocators > shipping_page > zipCode'
        When I set text '54915' to field 'UnifiedCartLocators > shipping_page > zipCode'
        And The element 'UnifiedCartLocators > materials > place_order_button' is displayed
        And I move to element 'UnifiedCartLocators > materials > place_order_button'
        And I click on item 'UnifiedCartLocators > materials > place_order_button'
        And  The element 'UnifiedCartLocators > review_page > order_detail_heading' is displayed
        And I click on item 'UnifiedCartLocators > materials > review_page > place_order_button'
        And The element 'UnifiedCartLocators > materials > order_confirmation_page > heading' is displayed
        Then I expect that the title is 'Checkout Order Confirmation | PfizerPro UK'
        And The element 'UnifiedCartLocators > materials > order_confirmation_page > delivery_details' is displayed
        And I expect 'UnifiedCartLocators > materials > order_confirmation_page > confirmation_page_content' elements are displayed with innertext:
            | Integration Account | +1 (740) 356-2800 |

    @TR-C212338-UK @automated @regression @prio1
    Scenario: Materials tabbed contents/counts are correctly displayed (Single-cart)
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
        And I click item '2' for element 'UnifiedCartLocators > materials > access_material_button_by_card_position'
        And The element 'UnifiedCartLocators > materials > click_on_add_to_cart_ben' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_add_to_cart_ben'
        And The element 'UnifiedCartLocators > materials > click_on_go_to_cart_ben' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_go_to_cart_ben'
        And The element 'UnifiedCartLocators > materials > add_more_items' is displayed
        And I move to element 'UnifiedCartLocators > materials > add_more_items'
        And I click on item 'UnifiedCartLocators > materials > add_more_items'
        Then The page url contains '/materials'
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
        And The element 'UnifiedCartLocators > materials > add_more_items' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' is displayed
        Then The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (2)'
        And The element 'UnifiedCartLocators > materials > helix_core_tabs_therapy_areas' text is 'Therapy Areas (1)'
        And The element 'UnifiedCartLocators > materials > add_more_items' is enabled
        And The element 'UnifiedCartLocators > materials > checkout_button' is enabled
        When The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And I click on item 'UnifiedCartLocators > materials > remove_materials_link'
        Then The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        And The element 'UnifiedCartLocators > materials > product_info_link' is not displayed
        And The element 'UnifiedCartLocators > materials > checkout_button' is displayed
        Given I am on the page '/explore-content/materials-cart'
        Then I expect that the title is 'Materials | Explore Content | PfizerPro UK'
        And The page url contains 'materials'
        When The element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_btn' is displayed
        And The element 'UnifiedCartLocators > materials > access_material_button_third_card' is displayed
        And I click item '2' for element 'UnifiedCartLocators > materials > access_material_button_by_card_position'
        And The element 'UnifiedCartLocators > materials > click_on_add_to_cart_ben' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_add_to_cart_ben'
        And The element 'UnifiedCartLocators > materials > click_on_go_to_cart_ben' is displayed
        And I click on item 'UnifiedCartLocators > materials > click_on_go_to_cart_ben'
        And The element 'UnifiedCartLocators > materials > add_more_items' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        When I click on item 'UnifiedCartLocators > materials > increment_quantity'
        Then The attribute 'value' of element 'UnifiedCartLocators > materials > get_quantity' is the value '3'
        When The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And I click on item 'UnifiedCartLocators > materials > remove_materials_link'
        Then I expect that element 'UnifiedCartLocators > cart_empty_message' is displayed

    @TR-C212366-UK @automated @regression @prio1
    Scenario: Access any materials checkout page without fulfilling pre-requisite step
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
        When The element 'UnifiedCartLocators > materials > materials_cart_total' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        Given I am on the page '/cart/materials/checkout-review-order'
        Then I expect that the title is 'Materials | PfizerPro UK'
        When The element 'UnifiedCartLocators > materials > materials_cart_total' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        Given I am on the page '/cart/materials/checkout-order-confirmation'
        Then I expect that the title is 'Materials | PfizerPro UK'
        When The element 'UnifiedCartLocators > materials > materials_cart_total' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        When The element 'UnifiedCartLocators > materials > remove_materials_link' is displayed
        And I click on item 'UnifiedCartLocators > materials > remove_materials_link'

    @TR-C393176-UK @automated @regression @prio1
    Scenario: HCP should be able to edit and remove contents added to materials cart (Validated HCP)
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
        When The element 'UnifiedCartLocators > materials > materials_cart_total' is displayed
        And The element 'UnifiedCartLocators > materials > materials_cart_total' text is 'Materials Cart (1)'
        When The element 'UnifiedCartLocators > materials > checkout_button' is displayed
        And I click on item 'UnifiedCartLocators > materials > checkout_button'
        Then I expect that the title is 'Checkout Shipping Details | PfizerPro UK'
        Then  The element 'UnifiedCartLocators > shipping_page > full_name_value' is displayed
        When The element 'UnifiedCartLocators > checkout_edit_modal_pop > open_modal_link' is displayed
        And I click on item 'UnifiedCartLocators > checkout_edit_modal_pop > open_modal_link'
        Then The element 'UnifiedCartLocators > checkout_edit_modal_pop > product_info_link' is not displayed
        When I click on item 'UnifiedCartLocators > materials > increment_quantity'
        Then The attribute 'value' of element 'UnifiedCartLocators > materials > get_quantity' is the value '2'
        Then The element 'UnifiedCartLocators > checkout_edit_modal_pop > remove_link' is displayed
        When I click on item 'UnifiedCartLocators > checkout_edit_modal_pop > remove_link'
        Then The element 'UnifiedCartLocators > checkout_edit_modal_pop > return_to_home' is displayed
        When I click on item 'UnifiedCartLocators > checkout_edit_modal_pop > return_to_home'
        Then I expect that the title is 'Home | PfizerPro UK'
