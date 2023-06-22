@nondestructive @events @materials_uk @ukabove
Feature: UK Galaxy Automated Regression - Materials

    Background:
        Given I am on the page '/explore-content/materials'
        And The browser resolution is '1920' per '1080'
        When The element 'UKAbove > hcp_confirmation_yes' is displayed
        And The element 'UKAbove > cookie_accept_all_button' is displayed
        And I click on 'UKAbove > cookie_accept_all_button'
        And I click on item 'UKAbove > hcp_confirmation_yes'
        Then I expect that the title is 'Materials | Explore Content | PfizerPro UK'


    @TR-C208023 @events-material-type-filter @automated @regression @prio1
    Scenario: UK > In Materials page, select multiple items in Materials type filter
        When I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_btn'
        And The element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_guide' is displayed
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_guide'
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_Audience_dropdown_btn'
        And The element 'MaterialsLocators > UK > FilterPicker > filter_picker_audience_dropdown_item_patient_resources' is displayed
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_audience_dropdown_item_patient_resources'
        Then I expect that item 'Guide' for element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_selected_item' is displayed
        Then I expect that item 'Patient resources' for element 'MaterialsLocators > UK > FilterPicker > filter_picker_audience_selected_item' is displayed


    @TR-C208026 @events-material-type-filter @automated @regression @prio1
    Scenario: UK > In Materials page, selection is cleared on clicking reset
        When I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_btn'
        And The element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_guide' is displayed
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_guide'
        Then I expect that item 'Guide' for element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_selected_item' is displayed
        When I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_reset_button'
        Then I expect that item 'Please Select' for element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_selected_item' is displayed


    @TR-C208027 @events-material-type-filter @automated @regression @prio1
    Scenario: UK > In Materials page, verify no materials card for selection
        When I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_btn'
        And The element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_flashcard' is displayed
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_flashcard'
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_Audience_dropdown_btn'
        And The element 'MaterialsLocators > UK > FilterPicker > filter_picker_audience_dropdown_item_patient_resources' is displayed
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_audience_dropdown_item_patient_resources'
        And The element 'MaterialsLocators > no_cards_message' is displayed

    @TR-C207888 @automated @regression @prio1
    Scenario: Clicking on reset after selecting item in TA
        When The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item_no_materials' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item_no_materials'
        And The element 'EventsLocators > FilterPicker > filter_picker_reset_button' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_reset_button'
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        Then I expect 'Please Select' in common element 'EventsLocators > FilterPicker > filters_default' with innertext:
            | Select Therapy Area | Select Product | Select Materials Type | Audience |

     @TR-C207881 @automated @regression @prio1
    Scenario: On Materials page, all filters are unselected and all cards displayed by default
        Then I expect that element 'EventsLocators > FilterPicker > filter_picker_ta_default' is displayed
        And I expect that element 'EventsLocators > FilterPicker > filter_picker_product_default' is displayed
        And I expect that element 'EventsLocators > FilterPicker > filter_picker_mt_default' is displayed
        And I expect that element 'EventsLocators > FilterPicker > filter_picker_audience_default' is displayed
        When I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I expect that element 'EventsLocators > FilterPicker > materials_cards' is displayed


        @TR-C207877 @automated @regression @prio1
    Scenario: On Materials page, select all filters and click on Reset button.Then All Cards are displayed irrespective of selected filters.
        When I click on item 'EventsLocators > FilterPicker > filter_picker_ta_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_product_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown_item2'
        And The element 'EventsLocators > FilterPicker > filter_picker_mt_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_mt_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_mt_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_audience_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_audience_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_audience_dropdown_item2'
        And I move to element 'EventsLocators > FilterPicker > reset_button'
        And I click on item 'EventsLocators > FilterPicker > reset_button'
        And I move to element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        Then I expect that element 'EventsLocators > FilterPicker > filter_picker_ta_default' is displayed
        And I expect that element 'EventsLocators > FilterPicker > filter_picker_product_default' is displayed
        And I expect that element 'EventsLocators > FilterPicker > filter_picker_mt_default' is displayed
        And I expect that element 'EventsLocators > FilterPicker > filter_picker_audience_default' is displayed
        When I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I expect that element 'EventsLocators > FilterPicker > materials_cards' is displayed
        Then I expect 'Please Select' in common element 'EventsLocators > FilterPicker > filters_default' with innertext:
            | Select Therapy Area | Select Product | Select Materials Type | Audience |


    @TR-C207870 @automated @regression @prio1
    Scenario: On Materials page, clicking reset after selecting Therapy Area, Product, Materials Type and Audience.
        When I click on item 'EventsLocators > FilterPicker > filter_picker_ta_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_product_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown_item2'
        And The element 'EventsLocators > FilterPicker > filter_picker_mt_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_mt_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_mt_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_audience_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_audience_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_audience_dropdown_item2'
        And The element 'EventsLocators > FilterPicker > filter_picker_reset_button' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_reset_button'
        And The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown' is displayed
        Then I expect 'Please Select' in common element 'EventsLocators > FilterPicker > filters_default' with innertext:
            | Select Therapy Area | Select Product | Select Materials Type | Audience |


    @TR-C207869 @automated @regression @prio1
    Scenario: In Materials page, select multiple items in  Materials type filter
        When The element 'EventsLocators > FilterPicker > filter_picker_mt_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_mt_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_mt_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_mt_dropdown_item2' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_mt_dropdown_item2'
        And I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I expect 'EventsLocators > FilterPicker > filter_picker_materials_badge' elements are present with innertext:
            | PDF | Booklet |
