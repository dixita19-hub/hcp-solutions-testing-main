@nondestructive @events @archived
Feature: EVM UK - Archived automated tests

  @TR-C207984 @automated @regression @prio1 @removable
    Scenario: Sub Menu link Events under Explore Content Menu is properly accessible
        When The element 'Common > explore_content_menu_item' is displayed
        And I move to element 'Common > explore_content_menu_item'
        And The element 'Common > events_button' is displayed
        And I click on item 'Common > events_button'
        Then The page url contains 'events'

    @TR-C207899 @automated @regression @prio1 @removable
     Scenario: Sub Menu link Videos under Explore Content Menu is properly accessible
        When The element 'Common > explore_content_menu_item' is displayed
        And I move to element 'Common > explore_content_menu_item'
        And The element 'Common > videos_button' is displayed
        And I click on item 'Common > videos_button'
        Then The page url contains 'videos'

    @TR-C207898 @automated @regression @prio1 @removable
    Scenario: Sub Menu link Materials under Explore Content Menu is properly accessible
        When The element 'Common > explore_content_menu_item' is displayed
        And I move to element 'Common > explore_content_menu_item'
        And The element 'Common > materials_button' is displayed
        And I click on item 'Common > materials_button'
        Then The page url contains 'materials'
@TR-C207895 @automated @regression @prio1 @removable
    Scenario: Materials link under Explore Content Section is properly accessible
        When The element 'Common > explore_content_menu_item' is displayed
        And I move to element 'UKAbove > explore_content_section'
        And I click on element 'UKAbove > explore_content_materials_link'
        Then I expect that the title is 'Materials | Explore Content | PfizerPro UK'
        And The page url contains 'materials'

    @TR-C207894 @automated @regression @prio1 @removable
    Scenario: Video Resources link under Explore Content Section is properly accessible
        When The element 'Common > explore_content_menu_item' is displayed
        And I move to element 'UKAbove > explore_content_section'
        And I click on element 'UKAbove > explore_content_videos_link'
        Then I expect that the title is 'Videos | Explore Content | PfizerPro UK'
        And The page url contains 'videos'


      @TR-C207886 @automated @regression @prio1 @removable
    Scenario: Clicking on reset after selecting Multiple items in product
        When The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown'
        And The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown_no_materials' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown_no_materials'
        And I move to element 'EventsLocators > FilterPicker > filter_picker_product_dropdown_item'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_reset_button' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_reset_button'
        And The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown' is displayed
        Then I expect 'Please Select' in common element 'EventsLocators > FilterPicker > filters_default' with innertext:
            | Select Therapy Area | Select Product | Select Materials Type | Audience |

    @TR-C207880 @automated @regression @prio1 @removable
    Scenario: On Materials page, select Therapy Area and Cards related to selected Therapy Area are displayed
        When I click on item 'EventsLocators > FilterPicker > filter_picker_ta_default'
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item'
        And I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I expect that element 'EventsLocators > FilterPicker > materials_cards' is displayed


    @TR-C207879 @automated @regression @prio1 @removable
    Scenario: On Materials page, select two Therapy Area items and Cards related to selected Therapy Area items are displayed
        When I click on item 'EventsLocators > FilterPicker > filter_picker_ta_default'
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item2' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item2'
        And I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I expect that element 'EventsLocators > FilterPicker > materials_cards' is displayed


    @TR-C207878 @automated @regression @prio1 @removable
    Scenario: On Materials page, select Therapy Area, Product, Materials Type and Audience.Then Cards related to selected filter items are displayed.
        When I click on item 'EventsLocators > FilterPicker > filter_picker_ta_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_product_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown_item2'
        And The element 'EventsLocators > FilterPicker > filter_picker_mt_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_mt_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_mt_dropdown_item3'
        And The element 'EventsLocators > FilterPicker > filter_picker_audience_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_audience_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_audience_dropdown_item2'
        And I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I expect that element 'EventsLocators > FilterPicker > materials_cards' is displayed



    @TR-C208024 @events-material-type-filter @automated @regression @prio1 @removable
    Scenario: UK > In Materials page, unselect audience filter
        When I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_Audience_dropdown_btn'
        And The element 'MaterialsLocators > UK > FilterPicker > filter_picker_audience_dropdown_item_patient_resources' is displayed
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_audience_dropdown_item_patient_resources'
        When I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_reset_button'
        And The element 'MaterialsLocators > UK > material_card > card' is displayed


    @TR-C208025 @events-material-type-filter @automated @regression @prio1 @removable
    Scenario: UK > In Materials page, unselect type filter
        When I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_btn'
        And The element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_guide' is displayed
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_guide'
        When I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_reset_button'
        And The element 'MaterialsLocators > UK > material_card > card' is displayed


    @TR-C208030 @events-material-type-filter @automated @regression @prio1 @removable
    Scenario: UK > In Materials page, user selects audience filter
        When I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_btn'
        And The element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_guide' is displayed
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_guide'
        Then I expect that item 'Guide' for element 'MaterialsLocators > UK > material_card > tag' is displayed


    @TR-C207890 @automated @regression @prio1 @removable
    Scenario: Selecting TA item having no materials
        When The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item_no_materials' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item_no_materials'
        And I move to element 'EventsLocators > FilterPicker > no_materials_available_heading'
        Then The element 'EventsLocators > FilterPicker > no_materials_available_heading' text is 'No materials currently available'



    @TR-C207889 @automated @regression @prio1 @removable
    Scenario: Selecting Product having no materials
        When The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown'
        And The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown_no_materials' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown_no_materials'
        And The element 'EventsLocators > FilterPicker > no_materials_available_heading' is displayed
        And I move to element 'EventsLocators > FilterPicker > no_materials_available_heading'
        Then The element 'EventsLocators > FilterPicker > no_materials_available_heading' text is 'No materials currently available'

    @TR-C207887 @automated @regression @prio1 @removable
    Scenario: Clicking on reset after selecting item in Audience
        When The element 'EventsLocators > FilterPicker > filter_picker_audience_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_audience_dropdown'
        And The element 'EventsLocators > FilterPicker > filter_picker_audience_dropdown_item' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_audience_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_reset_button' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_reset_button'
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        Then I expect 'Please Select' in common element 'EventsLocators > FilterPicker > filters_default' with innertext:
            | Select Therapy Area | Select Product | Select Materials Type | Audience |

    @TR-C207869 @events-material-type-filter @automated @regression @prio1 @removable
    Scenario: UK > In Materials page, select multiple items in Materials type filter
        When The element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_btn' is displayed
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_btn'
        And The element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_guide' is displayed
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_guide'
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_item_brochure'
        And I click on item 'MaterialsLocators > UK > FilterPicker > filter_picker_type_dropdown_btn'
        Then I expect that item 'Guide' for element 'MaterialsLocators > UK > FilterPicker > filter_picker_type_selected_item' is displayed


    @TR-C207885 @automated @regression @prio1 @removable
    Scenario: In videos page, clicking on reset after selecting item in TA
        When The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item_no_materials' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item_no_materials'
        And The element 'EventsLocators > FilterPicker > filter_picker_reset_button' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_reset_button'
        And The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown' is displayed
        Then I expect 'Please Select' in common element 'EventsLocators > FilterPicker > filters_default' with innertext:
            | Select Therapy Area | Select Product | Select Materials Type | Audience |

    @TR-C207883 @automated @regression @prio1 @removable
    Scenario: In videos page, Selecting TA item having no videos
        When I move to element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And I move to element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown_item'
        And I move to element 'EventsLocators > FilterPicker > no_videos_available_heading'
        Then The element 'EventsLocators > FilterPicker > no_videos_available_heading' text is 'No videos currently available'

    @TR-C207876 @automated @regression @prio1 @removable
    Scenario: On Videos page, all filters are unselected and all cards displayed by default
        When The element 'EventsLocators > FilterPicker > filter_picker_ta_default' is displayed
        Then I expect that element 'EventsLocators > FilterPicker > filter_picker_product_default' is displayed
        And I expect that element 'EventsLocators > FilterPicker > filter_picker_vt_default' is displayed
        And I expect that element 'EventsLocators > FilterPicker > filter_picker_audience_default' is displayed
        When I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I expect that element 'EventsLocators > FilterPicker > videos_cards' is displayed


    @TR-C207875 @automated @regression @prio1 @removable
    Scenario: On Videos page, select Therapy Area and Cards related to selected Therapy Area are displayed
        When I click on item 'EventsLocators > FilterPicker > filter_picker_ta_default'
        And The element 'EventsLocators > FilterPicker > filter_picker_vta_dropdown_item' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_vta_dropdown_item'
        And I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I expect that element 'EventsLocators > FilterPicker > videos_cards' is displayed


    @TR-C207874 @automated @regression @prio1 @removable
    Scenario: On Videos page, select two Therapy Area items and Cards related to selected Therapy Area items are displayed
        When I click on item 'EventsLocators > FilterPicker > filter_picker_ta_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_vta_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_vta_dropdown_item2' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_vta_dropdown_item2'
        And I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I expect that element 'EventsLocators > FilterPicker > videos_cards' is displayed


    @TR-C207873 @automated @regression @prio1 @removable
    Scenario: On Videos page, select Therapy Area, Product, Materials Type and Audience.Then Cards related to selected filter items are displayed.
        When I click on item 'EventsLocators > FilterPicker > filter_picker_ta_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_vta_dropdown_item2'
        And The element 'EventsLocators > FilterPicker > filter_picker_product_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_vproduct_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_vt_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_vt_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_vt_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_audience_default' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_audience_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_audience_consultants_item'
        And I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I expect that element 'EventsLocators > FilterPicker > videos_cards' is displayed


    @TR-C207872 @automated @regression @prio1 @removable
    Scenario: On Videos page, select two Video Type items and Cards related to selected Video Type items are displayed
        When I click on item 'EventsLocators > FilterPicker > filter_picker_vt_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_vt_dropdown_item'
        And The element 'EventsLocators > FilterPicker > filter_picker_vt_dropdown_item2' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_vt_dropdown_item2'
        And I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I expect that element 'EventsLocators > FilterPicker > videos_cards' is displayed

