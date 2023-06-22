@nondestructive @events @materials_us @usabove

Feature: US Galaxy Automated Regression - Materials

    Background:
        Given I am on the page '/materials'
        And The browser resolution is '1920' per '1080'
        And The title is 'Materials | Pfizer For Professionals'

    @TR-C363854 @automated @regression @prio1
    Scenario: Verify mandatory sections on the material detail modal
        When The element 'MaterialsLocators > US > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'MaterialsLocators > US > FilterPicker > filter_picker_ta_dropdown'
        And The element 'MaterialsLocators > US > FilterPicker > filter_picker_ta_dropdown_item_acromegaly' is displayed
        And I click on item 'MaterialsLocators > US > FilterPicker > filter_picker_ta_dropdown_item_acromegaly'
        And I click on item 'MaterialsLocators > go-button'
        And The element 'MaterialsLocators > US > material_card > email' is displayed
        And The element 'MaterialsLocators > US > material_card > image' is displayed
        And The element 'MaterialsLocators > US > material_card > tag' is displayed
        And The element 'MaterialsLocators > US > material_card > body' is displayed
        And The element 'MaterialsLocators > US > material_card > download' is displayed




