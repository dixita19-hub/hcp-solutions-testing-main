@nondestructive @events @events_uk @ukabove

Feature: US Galaxy Automated Regression - Events

    Background:
        Given I am on the page '/events'
        And The browser resolution is '1920' per '1080'
        And The title is 'Events | Pfizer For Professionals'

    @TR-C208042 @regression @prio1
    Scenario: Verify user selects therapy area
        Then The element 'EventsLocators > go-button-disabled' is displayed
        And I expect that element 'EventsLocators > clear-filters-disabled' is displayed
        When I click on item 'EventsLocators > menu_picker_ta_dropdown'
        And I get text from element 'EventsLocators > menu_picker_ta_dropdown_item' and save as environment variable 'TA'
        And I click on item 'EventsLocators > menu_picker_ta_dropdown_item'
        Then I expect that element 'EventsLocators > go-button' is displayed
        And I expect that element 'EventsLocators > clear-filters-link' is displayed