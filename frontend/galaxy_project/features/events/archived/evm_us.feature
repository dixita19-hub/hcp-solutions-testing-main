@nondestructive @events @archived
Feature: EVM US - Archived automated tests

  @TR-C207897 @automated @regression @prio1 @removable
    Scenario: Explore Content Section for US contain personalized cards like Events, Materials and Videos
        When I move to element 'USAbove > explore_content_section'
        And The element 'USAbove > explore_content_section_items' is displayed
        Then I expect element 'USAbove > explore_content_section_items' has items:
            | Events | Materials | Videos |

    @TR-C207953 @TR-C205264 @TR-C205265 @TR-C205266 @automated @regression @prio1 @removable
    Scenario Outline: Verify Go and Reset buttons are inactive by default
        When I move to element 'Common > explore_content_menu_item'
        And The element '<Locator>' is displayed
        And I click on item '<Locator>'
        Then I expect that element 'EventsLocators > menu_picker_ta_dropdown' is displayed
        And I expect that element 'EventsLocators > go-button-disabled' is displayed
        And I expect that element 'EventsLocators > clear-filters-disabled' is displayed
        Examples:
            | Locator                   |
            | Common > events_button    |
            | Common > materials_button |
            | Common > videos_button    |

    @TR-C208034 @automated @regression @prio1 @removable
    Scenario Outline: Selecting Therapy area and click on item Go button takes to microsite
        When I move to element 'Common > explore_content_menu_item'
        And The element '<Locator>' is displayed
        And I click on item '<Locator>'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > menu_picker_ta_dropdown'
        And I get text from element 'EventsLocators > menu_picker_ta_dropdown_item' and save as environment variable 'TA'
        And I click on item 'EventsLocators > menu_picker_ta_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        Then The page url contains 'acromegaly'
        Examples:
            | Locator                   |
            | Common > events_button    |
            | Common > materials_button |
            | Common > videos_button    |


    @TR-C208031  @automated @regression @prio1 @removable
    Scenario Outline: Selecting Product and click on item Go button takes to microsite
        When I move to element 'Common > explore_content_menu_item'
        And The element '<Locator>' is displayed
        And I click on item '<Locator>'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > menu_picker_product_dropdown'
        And I click on item 'EventsLocators > menu_picker_product_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        Then The page url contains 'besponsa'
        Examples:
            | Locator                   |
            | Common > events_button    |
            | Common > materials_button |
            | Common > videos_button    |


    @TR-C207953 @TR-C205254 @TR-C205255 @TR-C205256 @automated @regression @prio1 @removable
    Scenario Outline: Go and Reset is active when product is selected
        When I move to element 'Common > explore_content_menu_item'
        And The element '<Locator>' is displayed
        And I click on item '<Locator>'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > menu_picker_product_dropdown'
        And I click on item 'EventsLocators > menu_picker_product_dropdown_item'
        Then The element 'EventsLocators > go-button' is enabled
        And The element 'EventsLocators > clear-filters-link' is enabled
        Examples:
            | Locator                    |
            | Common > events_button     |
            | Common > materials_button  |
            | Common > videos_button     |

    @TR-C207953 @TR-C205251 @TR-C205252 @TR-C205253 @automated @regression @prio1 @removable
    Scenario Outline: Go and Reset is active when therapy area is selected
        When I move to element 'Common > explore_content_menu_item'
        And The element '<Locator>' is displayed
        And I click on item '<Locator>'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > menu_picker_ta_dropdown'
        And I click on item 'EventsLocators > menu_picker_ta_dropdown_item'
        Then The element 'EventsLocators > go-button' is enabled
        And The element 'EventsLocators > clear-filters-link' is enabled
        Examples:
            | Locator                   |
            | Common > events_button    |
            | Common > materials_button |
            | Common > videos_button    |

    @TR-C207953 @TR-C205248 @TR-C205249 @TR-C205250 @automated @regression @prio1 @removable
    Scenario Outline: Go and Reset are disabled on clicking reset after selecting therapy area
        When I move to element 'Common > explore_content_menu_item'
        And The element '<Locator>' is displayed
        And I click on item '<Locator>'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > menu_picker_ta_dropdown'
        And I click on item 'EventsLocators > menu_picker_ta_dropdown_item'
        And The element 'EventsLocators > clear-filters-link' is displayed
        And I click on item 'EventsLocators > clear-filters-link'
        And The element 'EventsLocators > menu_picker_ta_dropdown' is displayed
        Then I expect that element 'EventsLocators > go-button-disabled' is displayed
        And I expect that element 'EventsLocators > clear-filters-disabled' is displayed
        Examples:
            | Locator                    |
            | Common > events_button     |
            | Common > materials_button  |
            | Common > videos_button     |

    @TR-C208034 @automated @regression @prio1 @removable
    Scenario Outline: Selecting Therapy area and click on item Go button takes to the microsite
        When I move to element 'Common > explore_content_menu_item'
        And The element '<Locator>' is displayed
        And I click on item '<Locator>'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > menu_picker_ta_dropdown'
        And I click on item 'EventsLocators > menu_picker_ta_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        Then The page url contains 'acromegaly'
        Examples:
            | Locator                   |
            | Common > events_button    |
            | Common > materials_button |
            | Common > videos_button    |

    @TR-C207953 @TR-C205242 @TR-C205243 @TR-C205244 @automated @regression @prio1 @removable
    Scenario Outline: Go and Reset are disabled when reset button is clicked after selecting product
        When I move to element 'Common > explore_content_menu_item'
        And The element '<Locator>' is displayed
        And I click on item '<Locator>'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > menu_picker_product_dropdown'
        And I click on item 'EventsLocators > menu_picker_product_dropdown_item'
        And The element 'EventsLocators > clear-filters-link' is displayed
        And I click on item 'EventsLocators > clear-filters-link'
        And The element 'EventsLocators > menu_picker_ta_dropdown' is displayed
        Then I expect that element 'EventsLocators > go-button-disabled' is displayed
        And I expect that element 'EventsLocators > clear-filters-disabled' is displayed
        And The element 'EventsLocators > menu_picker_ta_default' text is 'Therapy Area'
        And The element 'EventsLocators > menu_picker_product_default' text is 'Product'
        Examples:
            | Locator                   |
            | Common > events_button    |
            | Common > materials_button |
            | Common > videos_button    |

    @TR-C207953 @TR-C205239 @TR-C205240 @TR-C205241 @automated @regression @prio1 @removable
    Scenario Outline: Product list is displayed in dropdown and underneath by clicking on Product box
        When I move to element 'Common > explore_content_menu_item'
        And The element '<Locator>' is displayed
        And I click on item '<Locator>'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > menu_picker_product_dropdown'
        And I move to element 'EventsLocators > menu_picker_product_dropdown_list'
        And The element 'EventsLocators > menu_picker_ta_dropdown' is displayed
        Then I expect that element 'EventsLocators > menu_picker_product_dropdown_list' is displayed
        And I expect that element 'EventsLocators > menu_picker_product_list' is displayed
        Examples:
            | Locator                   |
            | Common > events_button    |
            | Common > materials_button |
            | Common > videos_button    |

    @TR-C207952 @automated @regression @prio1 @removable @removable
    Scenario Outline:  Go and Reset buttons are inactive on clicking Product box
        When I move to element 'Common > explore_content_menu_item'
        And The element '<Locator>' is displayed
        And I click on item '<Locator>'
        And The element 'EventsLocators > go-button' is displayed
        And I click on item 'EventsLocators > menu_picker_product_dropdown'
        And The element 'EventsLocators > menu_picker_ta_dropdown' is displayed
        Then I expect that element 'EventsLocators > go-button-disabled' is displayed
        And I expect that element 'EventsLocators > clear-filters-disabled' is displayed
        Examples:
            | Locator                   |
            | Common > events_button    |
            | Common > materials_button |
            | Common > videos_button    |

    @TR-C208042 @automated @regression @prio1 @removable
    Scenario: Verify user selects therapy area
        Then The element 'EventsLocators > go-button-disabled' is displayed
        And I expect that element 'EventsLocators > clear-filters-disabled' is displayed
        When I click on item 'EventsLocators > menu_picker_ta_dropdown'
        And I get text from element 'EventsLocators > menu_picker_ta_dropdown_item' and save as environment variable 'TA'
        And I click on item 'EventsLocators > menu_picker_ta_dropdown_item'
        Then I expect that element 'EventsLocators > go-button' is displayed
        And I expect that element 'EventsLocators > clear-filters-link' is displayed

    @TR-C208042 @automated @regression @prio1 @removable
    Scenario: Verify user selects therapy area
        Given I am on the page '/events'
        And The browser resolution is '1920' per '1080'
        And The title is 'Events | Pfizer For Professionals'
        Then The element 'EventsLocators > go-button-disabled' is displayed
        And I expect that element 'EventsLocators > clear-filters-disabled' is displayed
        When I click on item 'EventsLocators > menu_picker_ta_dropdown'
        And I get text from element 'EventsLocators > menu_picker_ta_dropdown_item' and save as environment variable 'TA'
        And I click on item 'EventsLocators > menu_picker_ta_dropdown_item'
        Then I expect that element 'EventsLocators > go-button' is displayed
        And I expect that element 'EventsLocators > clear-filters-link' is displayed

