@nondestructive @events @menu_picker_us @usabove
Feature: US Galaxy Automated Regression - Common

    Background:
        Given I am on the page '/'
        And Browser is maximized
        And The element 'Common > explore_content_menu_item' is displayed


    @TR-C207984 @TR-C207898 @TR-C207899 @automated @regression @prio1
    Scenario Outline: Events Sub Menu links under Explore Content Menu are properly accessible
        When I move to element 'Common > explore_content_menu_item'
        And The element '<Locator>' is displayed
        And I click on item '<Locator>'
        Then I expect that the title contains '<Text>'
        And The page url contains '<Page>'
        Examples:
            | Locator                   | Page      | Text                 |
            | Common > events_button    | events    | Events               |
            | Common > materials_button | materials | Materials            |
            | Common > videos_button    | videos    | Videos               |


    @TR-C207984 @TR-C207898 @TR-C207899 @automated @regression @prio1
    Scenario Outline: Links under Explore Content Section are properly accessible( Personalised Cards default)
        When I move to element 'USAbove > explore_content_section'
        And The element 'USAbove > explore_content_section_items' is displayed
        Then I expect element 'USAbove > explore_content_section_items' has items:
            | Events | Materials | Videos |
        And The element 'Common > explore_content_menu_item' is displayed
        When The element '<Locator>' is displayed
        And I click on item '<Locator>'
        Then I expect that the title contains '<Text>'
        And The page url contains '<Page>'
        Examples:
            | Locator                                  | Page      | Text                 |
            | USAbove > explore_content_events_link    | events    | Events               |
            | USAbove > explore_content_materials_link | materials | Materials            |
            | USAbove > explore_content_videos_link    | videos    | Videos               |


    @TR-C207952 @automated @regression @prio1
    Scenario Outline:  Menu picker- Dropdown selection and Go/Reset button behavior
        When I move to element 'Common > explore_content_menu_item'
        And The element '<Locator>' is displayed
        And I click on item '<Locator>'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > menu_picker_product_dropdown'
        And The element 'EventsLocators > menu_picker_ta_dropdown' is displayed
        Then I expect that element 'EventsLocators > go-button-disabled' is displayed
        And I expect that element 'EventsLocators > clear-filters-disabled' is displayed
        When I click on item 'EventsLocators > menu_picker_ta_dropdown'
        And I click on item 'EventsLocators > menu_picker_ta_dropdown_item'
        Then The element 'EventsLocators > go-button' is enabled
        And The element 'EventsLocators > clear-filters-link' is enabled
        When The element 'EventsLocators > clear-filters-link' is displayed
        And I click on item 'EventsLocators > clear-filters-link'
        And I click on item 'EventsLocators > menu_picker_product_dropdown'
        And I click on item 'EventsLocators > menu_picker_product_dropdown_item'
        Then The element 'EventsLocators > go-button' is enabled
        And The element 'EventsLocators > clear-filters-link' is enabled
        When The element 'EventsLocators > clear-filters-link' is displayed
        And I click on item 'EventsLocators > clear-filters-link'
        Then I expect that element 'EventsLocators > go-button-disabled' is displayed
        And I expect that element 'EventsLocators > clear-filters-disabled' is displayed
        And The element 'EventsLocators > menu_picker_ta_default' text is 'Therapy Area'
        And The element 'EventsLocators > menu_picker_product_default' text is 'Product'
        When I click on item 'EventsLocators > menu_picker_ta_dropdown'
        And I click on item 'EventsLocators > menu_picker_ta_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        Then The page url contains 'acromegaly'

        Examples:
            | Locator                   |
            | Common > events_button    |
            | Common > materials_button |
            | Common > videos_button    |

