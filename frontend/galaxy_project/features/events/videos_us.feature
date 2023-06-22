@nondestructive @events @videos_us @usabove

Feature: US Galaxy Automated Regression - Videos

    Background:
        Given I am on the page '/videos'
        And The browser resolution is '1920' per '1080'
        And The title is 'Videos | Pfizer For Professionals'

    @TR-C208403 @automated @regression @prio1
    Scenario: Verify mandatory sections on the video detail modal
        When The element 'VideosLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        When I click on item 'VideosLocators > FilterPicker > filter_picker_ta_dropdown'
        And The element 'VideosLocators > FilterPicker > filter_picker_ta_dropdown_item_acromegaly' is displayed
        And I click on item 'VideosLocators > FilterPicker > filter_picker_ta_dropdown_item_acromegaly'
        And I click on item 'VideosLocators > go-button'
        And The element 'VideosLocators > USAbove > video_card > email' is displayed
        And The element 'VideosLocators > USAbove > video_card > go_to_video_btn' is displayed
        And The element 'VideosLocators > USAbove > video_card > image' is displayed
        And The element 'VideosLocators > USAbove > video_card > title' is displayed
        And The element 'VideosLocators > USAbove > video_card > body' is displayed
        Then I expect that element 'VideosLocators > FilterPicker > filter_picker_ta_dropdown' is not displayed


    @TR-C208370 @automated @regression @prio1
    Scenario: Verify that "Play" button will visible on Video Cards
        When The element 'VideosLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'VideosLocators > FilterPicker > filter_picker_ta_dropdown'
        And The element 'VideosLocators > FilterPicker > filter_picker_ta_dropdown_item_acromegaly' is displayed
        And I click on item 'VideosLocators > FilterPicker > filter_picker_ta_dropdown_item_acromegaly'
        And I click on item 'VideosLocators > go-button'
        And The element 'VideosLocators > USAbove > video_card > go_to_video_btn' is displayed


    @TR-C208374 @automated @regression @prio1
    Scenario: Verify that on-demand webinar video player will open in a new tab when user clicks on play button from video card
        When The element 'VideosLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'VideosLocators > FilterPicker > filter_picker_ta_dropdown'
        And The element 'VideosLocators > FilterPicker > filter_picker_ta_dropdown_item_acromegaly' is displayed
        And I click on item 'VideosLocators > FilterPicker > filter_picker_ta_dropdown_item_acromegaly'
        And I click on item 'VideosLocators > go-button'
        And The element 'VideosLocators > USAbove > video_card > go_to_video_btn' is displayed
        And I click on item 'VideosLocators > USAbove > video_card > go_to_video_btn'
        Then A new tab is opened
        And The url 'https://media.pfizerpro.com/?media=6304650872001' is opened in a new tab

    @TR-C213149 @automated @regression @prio1
    Scenario: Videos On demand Webinar modal - Verify if the content editor is able to see a black triangle in Meeting agenda of videos page for UK market and color triangle for Non-UK market
        When I am on the page '/evm-auto/cards/video-webinar-cards-withtriangle'
        And The title is 'video-webinar-cards-withtriangle | Pfizer For Professionals'
#        For Non-UK style display
        Then I expect that element 'VideosLocators > video_card > second_card' is displayed
        And I should see that 'color' from 'VideosLocators > video_card > second_card_with_triangle_in_heading' matches active and in focus css as 'rgb(0, 0, 201)'
#        For UK style display
        And I expect that element 'VideosLocators > video_card > first_card' is displayed
        And The element 'VideosLocators > video_card > first_card_heading_triangle_symbol' is displayed
        And I should see that 'color' from 'VideosLocators > video_card > first_card_heading_triangle_symbol' matches active and in focus css as 'rgb(0, 0, 0)'

    @TR-C366587 @automated @regression @prio1
    Scenario: Videos On demand Webinar modal - Verify that the legal disclaimer is displayed for an video when it has a value in drupal
        When I am on the page '/evm-auto/cards/video-webinar-cards-withtriangle'
        And The title is 'video-webinar-cards-withtriangle | Pfizer For Professionals'
        Then I expect that element 'VideosLocators > video_card > first_card' becomes visible within '10' seconds
        And The element 'VideosLocators > FilterPicker > filter_picker_type_dropdown' is displayed
        When I click on item 'VideosLocators > FilterPicker > filter_picker_type_dropdown'
        And The element 'VideosLocators > FilterPicker > filter_picker_type_dropdown_item_video' is displayed
        And I click on item 'VideosLocators > FilterPicker > filter_picker_type_dropdown_item_video'
        Then I expect that element 'VideosLocators > video_card > first_card' is displayed
        And The element 'VideosLocators > video_card > first_card_legal_disclaimer' text is 'This is a test legal disclaimer. Please review it and verify it should be displayed for this event card.'
        And The element 'VideosLocators > video_card > second_card' is displayed
        And I expect that element 'VideosLocators > video_card > second_card_legal_disclaimer' is not present

    @TR-C208392 @automated @regression @prio1
    Scenario: Videos - Verify the display of Learn More button is not affected by the availability of Speaker info
        When I am on the page '/evm-auto/cards/video-webinar-cards-withtriangle'
        And The title is 'video-webinar-cards-withtriangle | Pfizer For Professionals'
        When I click on item 'VideosLocators > pagination_next_page_icon'
        And The element 'VideosLocators > video_card > fifth_card' is displayed
        Then The element 'VideosLocators > video_card > fifth_card_speakers_section' is displayed
        And The element 'VideosLocators > video_card > fifth_card_learn_more' is displayed
        When The element 'VideosLocators > video_card > sixth_card' is displayed
        Then I expect that element 'VideosLocators > video_card > sixth_card_speakers_section' is not present
        And The element 'VideosLocators > video_card > sixth_card_learn_more' is displayed

    @TR-C208408 @automated @regression @prio1
    Scenario: Videos On demand Webinar modal - Verify left side menu on video detail modal
        When I am on the page '/evm-auto/cards/video-webinar-cards-withtriangle'
        And The title is 'video-webinar-cards-withtriangle | Pfizer For Professionals'
        Then I expect that element 'VideosLocators > video_card > first_card' becomes visible within '10' seconds
        And The element 'VideosLocators > FilterPicker > filter_picker_type_dropdown' is displayed
        When I click on item 'VideosLocators > FilterPicker > filter_picker_type_dropdown'
        And The element 'VideosLocators > FilterPicker > filter_picker_type_dropdown_item_ondemand_webinar' is displayed
        And I click on item 'VideosLocators > FilterPicker > filter_picker_type_dropdown_item_ondemand_webinar'
        Then The element 'VideosLocators > video_card > first_card_ondemand_webinar_tag' text is 'On-Demand Webinar'
        And The element 'VideosLocators > video_card > first_card_webinar_duration_txt' text is '60 minutes'
        And The element 'VideosLocators > video_card > first_card_speaker_link' text is 'First Last'
        When I click on item 'VideosLocators > video_card > first_card_learn_more'
        Then I expect that element 'VideosLocators > ondemand_webinar_modal > modal' is displayed
        And The element 'VideosLocators > ondemand_webinar_modal > left_panel > event_info_label' text is 'Event information'
        And The element 'VideosLocators > ondemand_webinar_modal > left_panel > active_link' text is 'Event details'
        And The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > title' text is 'Event details'
        And The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > content' contains the text 'Felis laoreet augue ipsum'
        And The element 'VideosLocators > ondemand_webinar_modal > left_panel > meeting_agenda_link' text is 'Meeting agenda'
        And The element 'VideosLocators > ondemand_webinar_modal > left_panel > event_materials_link' text is 'Event materials'
        And The element 'VideosLocators > ondemand_webinar_modal > left_panel > event_speakers_label' text is 'Event speakers'
        And The element 'VideosLocators > ondemand_webinar_modal > left_panel > first_event_speaker_link' text is 'First Last'
        When I click on item 'VideosLocators > ondemand_webinar_modal > left_panel > meeting_agenda_link'
        Then The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > title' text is 'Meeting agenda'
        When I click on item 'VideosLocators > ondemand_webinar_modal > left_panel > event_materials_link'
        Then The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > title' text is 'Event materials'
        When I click on item 'VideosLocators > ondemand_webinar_modal > left_panel > first_event_speaker_link'
        Then The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > speaker_title' text is 'First Last'

    @TR-C208409 @automated @regression @prio1
    Scenario: Videos On demand Webinar modal - Verify that clicking on learn more button on video card takes user to event detail section in video detail modal
        When I am on the page '/evm-auto/cards/video-webinar-cards-withtriangle'
        And The title is 'video-webinar-cards-withtriangle | Pfizer For Professionals'
        Then I expect that element 'VideosLocators > video_card > first_card' becomes visible within '10' seconds
        When The element 'VideosLocators > FilterPicker > filter_picker_type_dropdown' is displayed
        And I click on item 'VideosLocators > FilterPicker > filter_picker_type_dropdown'
        And The element 'VideosLocators > FilterPicker > filter_picker_type_dropdown_item_ondemand_webinar' is displayed
        And I click on item 'VideosLocators > FilterPicker > filter_picker_type_dropdown_item_ondemand_webinar'
        Then The element 'VideosLocators > video_card > first_card_ondemand_webinar_tag' text is 'On-Demand Webinar'
        When I click on item 'VideosLocators > video_card > first_card_learn_more'
        Then I expect that element 'VideosLocators > ondemand_webinar_modal > modal' is displayed
        And The element 'VideosLocators > ondemand_webinar_modal > left_panel > active_link' text is 'Event details'
        And The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > title' text is 'Event details'
        And The element 'VideosLocators > ondemand_webinar_modal > close_icon' is displayed
        When I click on item 'VideosLocators > ondemand_webinar_modal > close_icon'
        Then I expect that element 'VideosLocators > ondemand_webinar_modal > modal' is not displayed
        When I click on item 'VideosLocators > video_card > first_card_speaker_link'
        Then I expect that element 'VideosLocators > ondemand_webinar_modal > modal' is displayed
        And The element 'VideosLocators > ondemand_webinar_modal > left_panel > first_event_speaker_link_active' text is 'First Last'
        And The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > speaker_title' text is 'First Last'
        And The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > speaker_content' contains the text 'Duis bibendum metus a enim'

    @TR-C208395 @automated @regression @prio1
    Scenario: Videos On demand Webinar modal - Verify the display of Learn More button on different conditions
        When I am on the page '/evm-auto/cards/video-webinar-cards-learnmore-conditions'
        And The title is 'video-webinar-cards-learnmore-conditions | Pfizer For Professionals'
        Then I expect that element 'VideosLocators > video_card > first_card' is displayed
        And The element 'VideosLocators > video_card > first_card_title' text is 'Has Event details, Meeting agenda and Event materials'
        And The element 'VideosLocators > video_card > first_card_learn_more' is displayed
        When I click on item 'VideosLocators > video_card > first_card_learn_more'
        Then I expect that element 'VideosLocators > ondemand_webinar_modal > modal' is displayed
        And The element 'VideosLocators > ondemand_webinar_modal > left_panel > active_link' text is 'Event details'
        And The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > title' text is 'Event details'
        And The element 'VideosLocators > ondemand_webinar_modal > close_icon' is displayed
        When I click on item 'VideosLocators > ondemand_webinar_modal > close_icon'
        Then I expect that element 'VideosLocators > ondemand_webinar_modal > modal' is not displayed
        And I expect that element 'VideosLocators > video_card > second_card' is displayed
        And The element 'VideosLocators > video_card > second_card_title' text is 'Has Meeting agenda and Event materials'
        And The element 'VideosLocators > video_card > second_card_learn_more' is displayed
        When I click on item 'VideosLocators > video_card > second_card_learn_more'
        Then I expect that element 'VideosLocators > ondemand_webinar_modal > modal' is displayed
        And The element 'VideosLocators > ondemand_webinar_modal > left_panel > active_link' text is 'Meeting agenda'
        And The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > title' text is 'Meeting agenda'
        And The element 'VideosLocators > ondemand_webinar_modal > close_icon' is displayed
        When I click on item 'VideosLocators > ondemand_webinar_modal > close_icon'
        Then I expect that element 'VideosLocators > ondemand_webinar_modal > modal' is not displayed
        And I expect that element 'VideosLocators > video_card > third_card' is displayed
        And The element 'VideosLocators > video_card > third_card_title' text is 'Has Event materials only'
        And The element 'VideosLocators > video_card > third_card_learn_more' is displayed
        When I click on item 'VideosLocators > video_card > third_card_learn_more'
        Then I expect that element 'VideosLocators > ondemand_webinar_modal > modal' is displayed
        And The element 'VideosLocators > ondemand_webinar_modal > left_panel > active_link' text is 'Event materials'
        And The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > title' text is 'Event materials'
        And The element 'VideosLocators > ondemand_webinar_modal > close_icon' is displayed
        When I click on item 'VideosLocators > ondemand_webinar_modal > close_icon'
        Then I expect that element 'VideosLocators > ondemand_webinar_modal > modal' is not displayed
        And I expect that element 'VideosLocators > video_card > fourth_card' is displayed
        And The element 'VideosLocators > video_card > fourth_card_title' text is 'Has Speakers only - no learn more button'
        And The element 'VideosLocators > video_card > fourth_card_speaker_link' text is 'First Last'
        When I click on item 'VideosLocators > video_card > fourth_card_speaker_link'
        Then I expect that element 'VideosLocators > ondemand_webinar_modal > modal' is displayed
        And The element 'VideosLocators > ondemand_webinar_modal > left_panel > active_link' text is 'First Last'
        And The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > speaker_title' text is 'First Last'
        And The element 'VideosLocators > ondemand_webinar_modal > right_content_panel > speaker_content' contains the text 'Duis bibendum metus a enim'
        And The element 'VideosLocators > ondemand_webinar_modal > close_icon' is displayed
        When I click on item 'VideosLocators > ondemand_webinar_modal > close_icon'
        Then I expect that element 'VideosLocators > ondemand_webinar_modal > modal' is not displayed
        And The element 'VideosLocators > video_card > fourth_card_learn_more' is not present