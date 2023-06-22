@nondestructive @events @menu_picker_uk @ukabove
Feature: UK Galaxy Automated Regression - Common

    Background:
        Given I am on the page '/'
        And Browser is maximized
        When The element 'UKAbove > hcp_confirmation_yes' is displayed
        And The element 'UKAbove > cookie_accept_all_button' is displayed
        And I click on 'UKAbove > cookie_accept_all_button'
        And I click on item 'UKAbove > hcp_confirmation_yes'
        Then I expect that the title is 'Home | PfizerPro UK'


    @TR-C207897 @automated @prio1
    Scenario: Explore Content Section for UK contain personalized cards like Events, Materials and Videos
        When The element 'Common > explore_content_menu_item' is displayed
        And I move to element 'UKAbove > explore_content_section'
        And The element 'UKAbove > explore_content_section_items' is displayed
        Then I expect element 'UKAbove > explore_content_section_items' has items:
            | Events | Materials | Video Resources |

    @TR-C207896 @automated @regression @prio1
    Scenario: Events link under Explore Content Section is properly accessible
        When The element 'Common > explore_content_menu_item' is displayed
        And I move to element 'UKAbove > explore_content_section'
        And I click on element 'UKAbove > explore_content_events_link'
        Then I expect that the title is 'Event | PfizerPro UK'
        Then The page url contains 'events'
