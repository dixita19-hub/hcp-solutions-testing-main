@nondestructive @events @visualregression
Feature: Events - Visual regression automated tests

    Background:
        Given I am on the page 'https://www.pfizerpro.com'
        And Browser is maximized
        #When I click on 'UKAbove > cookie_accept_all_button'
        #And I click on 'UKAbove > hcp_confirmation_yes'
        When I pause for '5' s


    @001 @automated @usabove @menupicker
    Scenario: Explore Content Section for US containing personalized cards is not visually regressed
        Given The title is 'Home | Pfizer For Professionals'
        When I move to element 'USAbove > explore_content_section'
        And I pause for '5' s
        Then I verify that element 'USAbove > explore_content_section' is not visually regressed:
            | base_image                            |
            | home_page_explore_content_section.png |

    @002 @automated @usabove @menupicker
    Scenario Outline: Menu picker items are not visually regressed
        Given The title is 'Home | Pfizer For Professionals'
        When I move to element 'Common > explore_content_menu_item'
        And I press 'DOWN'
        And I pause for '2' s
        And I click on '<Locator>'
        And I pause for '2' s
        Then I verify that element 'EventsLocators > menu_picker_items' is not visually regressed:
            | base_image            |
            | menu_picker_items.png |
        Examples:
            | Locator                   |
            | Common > events_button    |
            | Common > materials_button |
            | Common > videos_button    |

    @003 @automated @ukabove @menupicker
    Scenario: Explore Content Section for UK containing personalized cards is not visually regressed
        Given The title is 'Home | PfizerPro UK'
        When I move to element 'UKAbove > explore_content_section'
        And I pause for '5' s
        Then I verify that element 'UKAbove > explore_content_section' is not visually regressed:
            | base_image                            |
            | home_page_explore_content_section_uk.png |

    @004 @automated @prio1 @ukabove @filterpicker
    Scenario: Cards display format on Materials page is not visually regressed
        Given The title is 'Home | PfizerPro UK'
        When I move to element 'Common > explore_content_menu_item'
        And I click on 'Common > materials_button'
        And I pause for '3' s
        And I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I verify that element 'EventsLocators > FilterPicker > materials_cards' is not visually regressed:
            | base_image            |
            | materials_cards.png   |

    @005 @automated @prio1 @ukabove @filterpicker
    Scenario: Cards display format on Videos page is not visually regressed
        Given The title is 'Home | PfizerPro UK'
        When I move to element 'Common > explore_content_menu_item'
        And I click on 'Common > videos_button'
        And I pause for '3' s
        And I move to element 'EventsLocators > FilterPicker > cards_section'
        Then I verify that element 'EventsLocators > FilterPicker > videos_cards' is not visually regressed:
            | base_image            |
            | videos_cards.png      |
