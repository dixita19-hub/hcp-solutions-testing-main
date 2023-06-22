@nondestructive @events @events_us @usabove

Feature: US Galaxy Automated Regression - Events

    @TR-C208386 @automated @regression @prio1
        Scenario: Verify Event speaker name and speaker details are hyperlinks
            Given I am on the page '/evm-auto/cards/event-cards'
            And The browser resolution is '1920' per '1080'
            And The title is 'events-auto | Pfizer For Professionals'
            Then I expect that element 'EventsLocators > EventCards > first_event_card' is displayed
            And I expect that element 'EventsLocators > EventCards > first_event_learn_more_btn' is displayed
            When I click on item 'EventsLocators > EventCards > first_event_learn_more_btn'
            And The element 'EventsLocators > EventsModal > event_details_modal' is displayed
            Then I expect 'EventsLocators > EventsModal > event_speakers_label' elements are displayed with innertext:
                | Event speakers |
            And I expect that element 'EventsLocators > EventsModal > event_speaker_link' is displayed
            When I click on item 'EventsLocators > EventsModal > event_speaker_link_btn'
            Then I expect that element 'EventsLocators > EventsModal > event_speaker_title' is displayed
            And I expect that element 'EventsLocators > EventsModal > event_speaker_content' is displayed

    @TR-C208350 @automated @regression @prio1
    Scenario: Events Modal - Verify that clicking on speaker link on events card takes user to speaker bios section in event modal
        Given I am on the page '/evm-auto/cards/event-cards'
        And The browser resolution is '1920' per '1080'
        And The title is 'events-auto | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > first_event_card' is displayed
        And I expect that element 'EventsLocators > EventCards > speakers_label_in_card' is displayed
        And I expect 'EventsLocators > EventCards > speakers_label_in_card' elements are displayed with innertext:
            |Speaker(s):|
        Then I expect that element 'EventsLocators > EventCards > first_speaker_in_card' is displayed
        When I get text from element 'EventsLocators > EventCards > first_speaker_in_card' and save as environment variable 'SPEAKER_NAME'
        And I click on item 'EventsLocators > EventCards > first_speaker_in_card'
        And The element 'EventsLocators > EventsModal > event_details_modal' is displayed
        Then I expect 'EventsLocators > EventsModal > event_speakers_label' elements are displayed with innertext:
            | Event speakers |
        And I expect that element 'EventsLocators > EventsModal > event_speaker_link' is displayed
        And The element 'EventsLocators > EventsModal > event_speaker_link' text is '{%SPEAKER_NAME%}'
        Then I expect that element 'EventsLocators > EventsModal > event_speaker_title' is displayed
        And The element 'EventsLocators > EventsModal > event_speaker_title' text is '{%SPEAKER_NAME%}'
        And I expect that element 'EventsLocators > EventsModal > event_speaker_content' is displayed

    @TR-C208381 @automated @regression @prio1
    Scenario: Events Modal - Verify the redirection from event detail card for a non-logged in user
        Given I am on the page '/evm-auto/cards/event-cards'
        And The browser resolution is '1920' per '1080'
        And The title is 'events-auto | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > first_event_card' is displayed
        And I expect that element 'EventsLocators > EventCards > first_event_register_btn' is displayed
        When I click on item 'EventsLocators > EventCards > first_event_register_btn'
        Then The page url contains '/grv-'
        And I expect that element 'USAbove > login > emailid' is displayed
        And I expect that element 'USAbove > login > passphrase' is displayed

    @TR-C208355 @automated @regression @prio1
    Scenario: Events Modal - Verify that the legal disclaimer is displayed for an event when it has a value in drupal
        Given I am on the page '/evm-auto/cards/event-cards'
        And The browser resolution is '1920' per '1080'
        And The title is 'events-auto | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > first_event_card' is displayed
        And I expect that element 'EventsLocators > EventCards > first_event_legal_disclaimer' is displayed
        And The element 'EventsLocators > EventCards > first_event_legal_disclaimer' text is 'Test legal disclaimer'
        And I expect that element 'EventsLocators > EventCards > third_event_card' is displayed
        And I expect that element 'EventsLocators > EventCards > third_event_legal_disclaimer' is not present

    @TR-C208351 @automated @regression @prio1
    Scenario: Events Modal - Verify that the event materials section is displayed in event detail modal
        Given I am on the page '/evm-auto/cards/event-cards-more'
        And The browser resolution is '1920' per '1080'
        And The title is 'Events cards count | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > first_event_card' is displayed
        And I expect that element 'EventsLocators > EventCards > first_event_learn_more_btn' is displayed
        When I click on item 'EventsLocators > EventCards > first_event_learn_more_btn'
        Then The element 'EventsLocators > EventsModal > event_details_modal' is displayed
        And The element 'EventsLocators > EventsModal > event_materials_link' text is 'Event materials'
        When I click on item 'EventsLocators > EventsModal > event_materials_link'
        Then I expect that element 'EventsLocators > EventsModal > event_materials_title' is displayed
        And The element 'EventsLocators > EventsModal > event_materials_title' text is 'Event materials'
        And I expect that element 'EventsLocators > EventsModal > event_materials_first_item_title' is displayed
        And The element 'EventsLocators > EventsModal > event_materials_first_item_title' contains the text 'Material-1:'

    @TR-C208353 @automated @regression @prio1
    Scenario: Events card - Verify that as an HCP user, I should be able to see registration close button disabled if the event is expired
        Given I am on the page '/evm-auto/cards/event-cards'
        And The browser resolution is '1920' per '1080'
        And The title is 'events-auto | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > first_event_card' is displayed
        And The element 'EventsLocators > EventCards > first_event_register_btn' text is 'Login'
        And I expect that element 'USAbove > sign_in' is displayed
        When I click on element 'USAbove > sign_in'
        Then The element 'USAbove > login > emailid' is displayed
        When I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        Then The element 'EventsLocators > EventCards > first_event_register_disabled_btn_elm' is displayed
        And The element 'EventsLocators > EventCards > first_event_register_disabled_btn' text is 'Registration Closed'
        When I click on item 'EventsLocators > EventCards > first_event_learn_more_btn'
        Then I expect that element 'EventsLocators > EventsModal > event_modal_register_btn' is displayed
        And The element 'EventsLocators > EventsModal > event_modal_register_btn' text is 'Registration Closed'

    @TR-C208356 @automated @regression @prio1
    Scenario: Verify - No events message if there are no events
        Given I am on the page '/evm-auto/cards/event-no-cards'
        And The browser resolution is '1920' per '1080'
        And The title is 'Events cards count | Pfizer For Professionals'
        Then The element 'EventsLocators > events_listing_container' is displayed
        And I expect that element 'EventsLocators > FilterPicker > no_events_available_heading' is displayed

    @TR-C208376 @automated @regression @prio1
    Scenario: Events card - Verify the redirection from speaker bios modal for a logged in user and event without a vendor signup url
        Given I am on the page '/evm-auto/cards/event-cards-registration'
        And The browser resolution is '1920' per '1080'
        And The title is 'event-cards-registration | Pfizer For Professionals'
        When I click on element 'EventsLocators > sign_in_header_btn'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        Then I expect that element 'USAbove > login > logout_button' becomes visible within '20' seconds
        And The element 'USAbove > login > logout_button' text is 'Log Out'
        And I expect that the title is 'event-cards-registration | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > first_event_card' is displayed
        When I scroll to view and click on 'EventsLocators > EventCards > first_speaker_in_card'
        Then The element 'EventsLocators > EventsModal > event_details_modal' is displayed
        And I expect that element 'EventsLocators > EventsModal > event_modal_register_btn' becomes visible within '10' seconds
        And The element 'EventsLocators > EventsModal > event_modal_register_btn' is displayed
        When I click on item 'EventsLocators > EventsModal > event_modal_register_btn'
        Then The page url contains '/evm-auto/cards/event-cards-registration'

    @TR-C208377 @automated @regression @prio1
    Scenario: Events card - Verify the redirection from speaker bios modal for a logged in user and event having a vendor signup url
        Given I am on the page '/evm-auto/cards/event-cards-registration'
        And The browser resolution is '1920' per '1080'
        And The title is 'event-cards-registration | Pfizer For Professionals'
        Then The element 'EventsLocators > sign_in_header_btn' is displayed
        When I click on element 'EventsLocators > sign_in_header_btn'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        Then I expect that element 'USAbove > login > logout_button' becomes visible within '10' seconds
        And The element 'USAbove > login > logout_button' text is 'Log Out'
        And I expect that the title is 'event-cards-registration | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > second_event_card' is displayed
        When I scroll to view and click on 'EventsLocators > EventCards > first_speaker_in_second_card'
        Then The element 'EventsLocators > EventsModal > event_details_modal' is displayed
        And I expect that element 'EventsLocators > EventsModal > event_modal_register_btn' becomes visible within '10' seconds
        And The element 'EventsLocators > EventsModal > event_modal_register_btn' is displayed
        When I click on item 'EventsLocators > EventsModal > event_modal_register_btn'
        Then The element 'EventsLocators > EventCards > leaving_pfizer_popup_title' is displayed
        And I expect that element 'EventsLocators > EventCards > leaving_pfizer_continue' becomes visible within '10' seconds
        When I click on item 'EventsLocators > EventCards > leaving_pfizer_continue'
        Then A new tab is opened
        And The url opened in new tab contains 'galaxywebinardemo1.vistream.tv/register'

    @TR-C208379 @automated @regression @prio1
    Scenario: Events card - Verify the redirection from event detail modal for a logged in user and event having a vendor signup url
        Given I am on the page '/evm-auto/cards/event-cards-registration'
        And The browser resolution is '1920' per '1080'
        And The title is 'event-cards-registration | Pfizer For Professionals'
        When I click on element 'EventsLocators > sign_in_header_btn'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        Then I expect that element 'USAbove > login > logout_button' becomes visible within '10' seconds
        And The element 'USAbove > login > logout_button' text is 'Log Out'
        And I expect that the title is 'event-cards-registration | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > second_event_card' is displayed
        When I scroll to view and click on 'EventsLocators > EventCards > second_event_learn_more_btn'
        Then The element 'EventsLocators > EventsModal > event_details_modal' is displayed
        And I expect that element 'EventsLocators > EventsModal > event_modal_register_btn' becomes visible within '10' seconds
        And The element 'EventsLocators > EventsModal > event_modal_register_btn' is displayed
        When I click on item 'EventsLocators > EventsModal > event_modal_register_btn'
        Then The element 'EventsLocators > EventCards > leaving_pfizer_popup_title' is displayed
        And I expect that element 'EventsLocators > EventCards > leaving_pfizer_continue' becomes visible within '10' seconds
        When I click on item 'EventsLocators > EventCards > leaving_pfizer_continue'
        Then A new tab is opened
        And The url opened in new tab contains 'galaxywebinardemo1.vistream.tv/register'

    @TR-C208380 @automated @regression @prio1
    Scenario: Events card - Verify the redirection from speaker bios modal for a non-logged in user
        Given I am on the page '/evm-auto/cards/event-cards-registration'
        And The browser resolution is '1920' per '1080'
        And The title is 'event-cards-registration | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > second_event_card' is displayed
        When I scroll to view and click on 'EventsLocators > EventCards > first_speaker_in_second_card'
        Then The element 'EventsLocators > EventsModal > event_details_modal' is displayed
        And I expect that element 'EventsLocators > EventsModal > event_modal_register_btn' becomes visible within '10' seconds
        And The element 'EventsLocators > EventsModal > event_modal_register_btn' is displayed
        When I click on item 'EventsLocators > EventsModal > event_modal_register_btn'
        Then The page url contains '/grv-'
        And I expect that element 'USAbove > login > emailid' is displayed
        And I expect that element 'USAbove > login > passphrase' is displayed

    @TR-C208383 @automated @regression @prio1
    Scenario: Events card - Verify the redirection from event page for a logged in user and event having a vendor signup url
        Given I am on the page '/evm-auto/cards/event-cards-registration'
        And The browser resolution is '1920' per '1080'
        And The title is 'event-cards-registration | Pfizer For Professionals'
        When I click on element 'EventsLocators > sign_in_header_btn'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        Then I expect that element 'USAbove > login > logout_button' becomes visible within '10' seconds
        And The element 'USAbove > login > logout_button' text is 'Log Out'
        And I expect that the title is 'event-cards-registration | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > second_event_card' is displayed
        When I scroll to view and click on 'EventsLocators > EventCards > second_event_register_btn'
        Then The element 'EventsLocators > EventCards > leaving_pfizer_popup_title' is displayed
        And I expect that element 'EventsLocators > EventCards > leaving_pfizer_continue' becomes visible within '10' seconds
        When I click on item 'EventsLocators > EventCards > leaving_pfizer_continue'
        Then A new tab is opened
        And The url opened in new tab contains 'galaxywebinardemo1.vistream.tv/register'

    @TR-C208337 @automated @regression @prio1
    Scenario: Events card - Verify as an HCP user, I check button sync behavior from speaker link on event card
        Given I am on the page '/evm-auto/cards/event-cards-registration'
        And The browser resolution is '1920' per '1080'
        And The title is 'event-cards-registration | Pfizer For Professionals'
        When I click on element 'EventsLocators > sign_in_header_btn'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        Then I expect that element 'USAbove > login > logout_button' becomes visible within '10' seconds
        And The element 'USAbove > login > logout_button' text is 'Log Out'
        And I expect that the title is 'event-cards-registration | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > first_event_card' is displayed
        When I scroll to view and click on 'EventsLocators > EventCards > first_speaker_in_card'
        Then The element 'EventsLocators > EventsModal > event_details_modal' is displayed
        And I expect that element 'EventsLocators > EventsModal > event_modal_register_btn' becomes visible within '10' seconds
        And The element 'EventsLocators > EventsModal > event_modal_register_btn' is displayed
        And The element 'EventsLocators > EventsModal > event_modal_register_btn' text is 'Register Here'
        When I click on item 'EventsLocators > EventsModal > event_modal_register_btn'
        And I pause for '5' s
        Then The page url contains '/evm-auto/cards/event-cards-registration'
        And The element 'EventsLocators > EventsModal > event_modal_register_btn' text is 'Thank you, Registration received.'
        And The element 'EventsLocators > EventsModal > close_icon' is displayed
        When I click on item 'EventsLocators > EventsModal > close_icon'
        And I pause for '5' s
        Then I expect that element 'EventsLocators > EventCards > first_event_register_btn' is displayed
        And The element 'EventsLocators > EventCards > first_event_register_btn' text is 'Thank you, Registration received.'

    @TR-C208338 @automated @regression @prio1
    Scenario: Events card - Verify as an HCP user, I check button sync behavior from "Register Here" button on event card
        Given I am on the page '/evm-auto/cards/event-cards-registration'
        And The browser resolution is '1920' per '1080'
        And The title is 'event-cards-registration | Pfizer For Professionals'
        When I click on element 'EventsLocators > sign_in_header_btn'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        Then I expect that element 'USAbove > login > logout_button' becomes visible within '10' seconds
        And The element 'USAbove > login > logout_button' text is 'Log Out'
        And I expect that the title is 'event-cards-registration | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > second_event_card' is displayed
        When I scroll to view and click on 'EventsLocators > EventCards > first_speaker_in_second_card'
        Then The element 'EventsLocators > EventsModal > event_details_modal' is displayed
        And I expect that element 'EventsLocators > EventsModal > event_modal_register_btn' becomes visible within '10' seconds
        And The element 'EventsLocators > EventsModal > event_modal_register_btn' text is 'Register Here'
        When I click on item 'EventsLocators > EventsModal > event_modal_register_btn'
        Then The element 'EventsLocators > EventCards > leaving_pfizer_popup_title' is displayed
        And I expect that element 'EventsLocators > EventCards > leaving_pfizer_continue' becomes visible within '10' seconds
        And The element 'EventsLocators > EventCards > leaving_pfizer_cancel' is displayed
        When I click on item 'EventsLocators > EventCards > leaving_pfizer_cancel'
        And I pause for '5' s
        Then The page url contains '/evm-auto/cards/event-cards-registration'
        And The element 'EventsLocators > EventsModal > event_modal_register_btn' text is 'Register Here'
        And The element 'EventsLocators > EventsModal > close_icon' is displayed
        When I click on item 'EventsLocators > EventsModal > close_icon'
        Then The element 'EventsLocators > EventCards > second_event_learn_more_btn' is displayed
        When I click on item 'EventsLocators > EventCards > second_event_learn_more_btn'
        Then The element 'EventsLocators > EventsModal > event_details_modal' is displayed
        And I expect that element 'EventsLocators > EventsModal > event_modal_register_btn' becomes visible within '10' seconds
        And The element 'EventsLocators > EventsModal > event_modal_register_btn' text is 'Register Here'

    @TR-C208420 @automated @regression @prio1
    Scenario: Events Modal - Verify if the HCP User is able to see a black triangle in Meeting agenda, Event Modal link of Events page for UK market and color triangle for Non-UK market
        When I am on the page '/evm-auto/cards/events-triangle'
        And The browser resolution is '1920' per '1080'
        And The title is 'events-triangle | Pfizer For Professionals'
#        For Non-UK style display
        Then I expect that element 'EventsLocators > EventCards > second_event_card' is displayed
        And I should see that 'color' from 'EventsLocators > EventCards > second_card_with_triangle_in_heading' matches active and in focus css as 'rgb(0, 0, 201)'
#        For UK style display
        And I expect that element 'EventsLocators > EventCards > first_event_card' is displayed
        And The element 'EventsLocators > EventCards > first_card_heading_triangle_symbol' is displayed
        And I should see that 'color' from 'EventsLocators > EventCards > first_card_heading_triangle_symbol' matches active and in focus css as 'rgb(0, 0, 0)'
        When I scroll to view and click on 'EventsLocators > EventCards > first_event_learn_more_btn'
        Then The element 'EventsLocators > EventsModal > event_details_modal' is displayed
        When I click on item 'EventsLocators > EventsModal > meeting_agenda_link'
        Then I expect that element 'EventsLocators > EventsModal > meeting_agenda_title' is displayed
        And The element 'EventsLocators > EventsModal > meeting_agenda_content_first_title' is displayed
        And I should see that 'color' from 'EventsLocators > EventsModal > meeting_agenda_content_first_title' matches active and in focus css as 'rgb(0, 0, 0)'

@TR-C213151 @automated @regression @prio1
    Scenario:  Verify if the HCP user is able to see his preferred TAs being reflected on the Cards
        Given I am on the page '/evm-auto/cards/us-preferred-ta'
        When Browser is maximized
        And The title is 'us-preferred-ta | Pfizer For Professionals'
        And The element 'EventsLocators > menu_picker_product_dropdown' is displayed
        Then The element 'EventsLocators > preferred_ta_listing_component' is not displayed
        When The element 'USAbove > sign_in' is displayed
        And I click on element 'USAbove > sign_in'
        Then The element 'USAbove > login > emailid' is displayed
        When I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'EventsLocators > menu_picker_product_dropdown' is displayed
        And I move to element 'EventsLocators > menu_picker_product_dropdown'
        And The element 'EventsLocators > preferred_ta_cards' is displayed
        And I save count of preferred TA cards 'EventsLocators > preferred_ta_cards' and save as environment variable 'TOTAL_TA_CARDS'
        And I click on element 'EventsLocators > preferred_ta_second_card'
        Then The page url contains 'breastcancer'
        Given I am on the page '/evm-auto/cards/us-preferred-ta'
        When The element 'EventsLocators > account_settings_button' is displayed
        And I click on element 'EventsLocators > account_settings_button'
        And The element 'EventsLocators > account_preferences_button' is displayed
        And I move to element 'EventsLocators > account_preferences_button'
        And I click on element 'EventsLocators > account_preferences_button'
        Then The count of preferred TAs 'TOTAL_TA_CARDS' is same as TA preferences 'EventsLocators > preferences_ta'

    @TR-C213165 @automated @regression @prio1
    Scenario: Menu Picker - Verify if the HCP Logged in user is able to see the new Listing component if user clicks the Product/TA dropdown
        Given I am on the page '/evm-auto/cards/us-preferred-ta'
        When Browser is maximized
        And The title is 'us-preferred-ta | Pfizer For Professionals'
        And The element 'USAbove > sign_in' is displayed
        And I click on element 'USAbove > sign_in'
        Then The element 'USAbove > login > emailid' is displayed
        When I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'EventsLocators > menu_picker_product_dropdown' is displayed
        And I click on element 'EventsLocators > menu_picker_product_dropdown'
        Then The element 'EventsLocators > preferred_ta_listing_component' is not displayed
        When The element 'EventsLocators > menu_picker_ta_dropdown' is displayed
        And I click on element 'EventsLocators > menu_picker_ta_dropdown'
        Then The element 'EventsLocators > preferred_ta_listing_component' is displayed

    @TR-C208342 @automated @regression @prio1
    Scenario: Verify the display of Learn More button on different conditions for event modal
        Given I am on the page '/evm-auto/cards/events-cards-learnmore-conditions'
        When Browser is maximized
        And The title is 'events-cards-learnmore-conditions | Pfizer For Professionals'
        And The element 'EventsLocators > EventCards > fourth_event_card' is displayed
        And I move to element 'EventsLocators > EventCards > fourth_event_card'
        And The element 'EventsLocators > EventCards > fourth_card_title' text is 'Has Speakers only - no learn more button'
        Then I expect that element 'EventsLocators > EventCards > fourth_event_learn_more_btn' is not present
        When The element 'EventsLocators > EventCards > fourth_card_first_speaker_link' is displayed
        And I click on element 'EventsLocators > EventCards > fourth_card_first_speaker_link'
        Then The element 'EventsLocators > EventsModal > event_modal' is displayed
        And The element 'EventsLocators > EventsModal > speaker_header' is displayed
        When I click on element 'EventsLocators > EventsModal > modal_close_icon'
        And I move to element 'EventsLocators > EventCards > second_card_title'
        And The element 'EventsLocators > EventCards > second_card_title' text is 'Has Meeting agenda and Event materials'
        Then The element 'EventsLocators > EventCards > second_event_learn_more_btn' is displayed
        When I click on element 'EventsLocators > EventCards > second_event_learn_more_btn'
        Then The element 'EventsLocators > EventsModal > meeting_agenda_header' is displayed
        When The element 'EventsLocators > EventsModal > second_link_label' is displayed
        And I click on element 'EventsLocators > EventsModal > second_link_label'
        Then The element 'EventsLocators > EventsModal > event_materials_header' is displayed
        When The element 'EventsLocators > EventsModal > modal_close_icon' is displayed
        And I click on element 'EventsLocators > EventsModal > modal_close_icon'
        And The element 'EventsLocators > EventCards > third_card_title' text is 'Has Event materials only'
        Then The element 'EventsLocators > EventCards > third_event_learn_more_btn' is displayed
        When I click on element 'EventsLocators > EventCards > third_event_learn_more_btn'
        Then The element 'EventsLocators > EventsModal > event_materials_header' is displayed
        When I move to element 'EventsLocators > EventCards > first_title'
        And The element 'EventsLocators > EventCards > first_title' text is 'Has Event details, Meeting agenda and Event materials'
        And I click on element 'EventsLocators > EventCards > first_event_learn_more_btn'
        And The element 'EventsLocators > EventsModal > event_modal' is displayed
        And The element 'EventsLocators > EventsModal > first_link_label' is displayed
        And I click on element 'EventsLocators > EventsModal > first_link_label'
        Then The element 'EventsLocators > EventsModal > event_details_header' is displayed
        When The element 'EventsLocators > EventsModal > second_link_label' is displayed
        And I click on element 'EventsLocators > EventsModal > second_link_label'
        Then The element 'EventsLocators > EventsModal > meeting_agenda_header' is displayed


@TR-C398095 @automated @regression @prio1
    Scenario: EVM - Aggregated - Explore Content - AB Events - Event card - Register here - Web Form Request - Logged in user
        Given I am on the page '/evm-auto/cards/event-cards-registration'
        And The browser resolution is '1920' per '1080'
        And The title is 'event-cards-registration | Pfizer For Professionals'
        When I click on element 'EventsLocators > sign_in_header_btn'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        Then I expect that element 'USAbove > login > logout_button' becomes visible within '20' seconds
        And The element 'USAbove > login > logout_button' text is 'Log Out'
        And I expect that the title is 'event-cards-registration | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > first_event_card' is displayed
        And I expect that element 'EventsLocators > EventCards > first_event_register_btn' becomes visible within '10' seconds
        And The element 'EventsLocators > EventCards > first_event_register_btn' text is 'Register here'
        When I scroll to view and click on 'EventsLocators > EventCards > first_event_register_btn'
        And I pause for '10' s
        Then I expect that element 'EventsLocators > EventCards > first_event_register_btn' is displayed
        And The element 'EventsLocators > EventCards > first_event_register_btn' text is 'Thank you, Registration received.'

@TR-C398116 @automated @regression @prio1
    Scenario: EVM - Aggregated - Explore Content - AB Events - Event card - Learn more - Events Details Modal - Register here - Web Form Request - Logged out user
        Given I am on the page '/evm-auto/cards/event-cards-registration'
        And The browser resolution is '1920' per '1080'
        And The title is 'event-cards-registration | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > first_event_card' is displayed
        And I expect that element 'EventsLocators > EventCards > first_event_learn_more_btn' is displayed
        When I scroll to view and click on 'EventsLocators > EventCards > first_event_learn_more_btn'
        Then The element 'EventsLocators > EventsModal > event_details_modal' is displayed
        And I expect that element 'EventsLocators > EventsModal > event_modal_register_btn' becomes visible within '10' seconds
        And The element 'EventsLocators > EventsModal > event_modal_register_btn' is displayed
        When I click on item 'EventsLocators > EventsModal > event_modal_register_btn'
        Then The page url contains '/grv-'
        And I expect that element 'USAbove > login > emailid' is displayed
        And I expect that element 'USAbove > login > passphrase' is displayed

    @TR-C208338 @automated @regression @prio1
    Scenario: EVM - Aggregated - Explore Content - AB Events - Event card - Register here - Live webinar - Logged in user
        Given I am on the page '/evm-auto/cards/event-cards-registration'
        And The browser resolution is '1920' per '1080'
        And The title is 'event-cards-registration | Pfizer For Professionals'
        When I click on element 'EventsLocators > sign_in_header_btn'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        Then I expect that element 'USAbove > login > logout_button' becomes visible within '10' seconds
        And The element 'USAbove > login > logout_button' text is 'Log Out'
        And I expect that the title is 'event-cards-registration | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > second_event_card' is displayed
        And The element 'EventsLocators > EventCards > second_event_register_btn' text is 'Register here'
        When I scroll to view and click on 'EventsLocators > EventCards > second_event_register_btn'
        Then The element 'EventsLocators > EventCards > leaving_pfizer_popup_title' is displayed
        And I expect that element 'EventsLocators > EventCards > leaving_pfizer_continue' becomes visible within '10' seconds
        And The element 'EventsLocators > EventCards > leaving_pfizer_cancel' is displayed
        When I click on item 'EventsLocators > EventCards > leaving_pfizer_cancel'
        And I pause for '5' s
        Then The page url contains '/evm-auto/cards/event-cards-registration'
        And The element 'EventsLocators > EventCards > second_event_register_btn' text is 'Register here'

    @TR-C398093 @automated @regression @prio1
    Scenario: EVM - Aggregated - Explore Content - AB Events - Event card - Register here - Live webinar - Logged out user
        Given I am on the page '/evm-auto/cards/event-cards-registration'
        And The browser resolution is '1920' per '1080'
        And The title is 'event-cards-registration | Pfizer For Professionals'
        Then I expect that element 'EventsLocators > EventCards > second_event_card' is displayed
        And The element 'EventsLocators > EventCards > second_event_register_btn' is displayed
        When I click on item 'EventsLocators > EventCards > second_event_register_btn'
        Then The page url contains '/grv-'
        And I expect that element 'USAbove > login > emailid' is displayed
        And I expect that element 'USAbove > login > passphrase' is displayed


