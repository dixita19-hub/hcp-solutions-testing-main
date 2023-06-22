@nondestructive @events @videos_uk @ukabove
Feature: UK Galaxy Automated Regression - Videos

    Background:
        Given I am on the page '/explore-content/videos'
        And The browser resolution is '1920' per '1080'
        When The element 'UKAbove > hcp_confirmation_yes' is displayed
        And The element 'UKAbove > cookie_accept_all_button' is displayed
        And I click on 'UKAbove > cookie_accept_all_button'
        And I click on item 'UKAbove > hcp_confirmation_yes'
        Then I expect that the title is 'Videos | Explore Content | PfizerPro UK'

    @TR-C364850 @events-video_detail_modal-go-to-video  @automated @regression @prio1 @fixed
    Scenario: UK > Verify go to video displays a "leaving Pfizer" prompt
        When I click on item 'VideosLocators > UKAbove > video_card > go_to_video_uk'
        And The element 'VideosLocators > UKAbove > video_card > leaving_pfizer_popup_title' is displayed
        And The element 'VideosLocators > UKAbove > video_card > leaving_pfizer_continue' is displayed
        And The element 'VideosLocators > UKAbove > video_card > leaving_pfizer_cancel' is displayed

    @TR-C364851 @events-video-detail-modal-elements @automated @regression @prio1
    Scenario: UK > Verify mandatory sections are displayed on video detail modal
        When The element 'VideosLocators > UKAbove > video_card > go_to_video_uk' is displayed
        And The element 'VideosLocators > UKAbove > video_card > all_cards' is displayed
        And The element 'VideosLocators > UKAbove > video_card > title' is displayed
        And The element 'VideosLocators > UKAbove > video_card > badge' is displayed


    @TR-C207941 @TR-C207942 @events-videos-pagination @automated @regression @prio1
    Scenario: UK > Verify pagination is displayed on videos if there are more videos
        When The element 'VideosLocators > UKAbove > video_card > go_to_video_uk' is displayed
        And The element 'VideosLocators > UKAbove > video_card > title' is displayed
        Then I expect 'VideosLocators > pagination_next_page_icon' when 9 'VideosLocators > UKAbove > video_card > all_cards' are displayed


    @TR-C207943 @events-video_detail_modal-go-to-video  @automated @regression @prio1 @fixed
    Scenario: UK > Verify go to video and play
        When I click on item 'VideosLocators > UKAbove > video_card > go_to_video_uk'
        And The element 'VideosLocators > UKAbove > video_card > leaving_pfizer_popup_title' is displayed
        And The element 'VideosLocators > UKAbove > video_card > leaving_pfizer_continue' is displayed
        And I click on item 'VideosLocators > UKAbove > video_card > leaving_pfizer_continue'
        And I click on item 'VideosLocators > UKAbove > video_player > play_button'
        Then I see the video 'VideosLocators > UKAbove > video_player > video_layer' and timer 'VideosLocators > UKAbove > video_player > video_current_position' is progressing


    @TR-C207952 @events-video_filter_select_ta  @automated @regression @prio1
    Scenario: Filter picker- Go and Reset buttons are inactive on clicking Product box - Video
        When I click on item 'VideosLocators > FilterPicker > filter_picker_ta_dropdown'
        And I click on item 'VideosLocators > FilterPicker > filter_picker_ta_dropdown_item_1'
        Then The element 'VideosLocators > FilterPicker > filter_picker_reset_button' is displayed
        Then I expect that item 'Disease State USA' for element 'VideosLocators > FilterPicker > filter_picker_ta_selected' is displayed
        When I click on item 'VideosLocators > FilterPicker > filter_picker_reset_button'
        Then I expect that item 'Please Select' for element 'VideosLocators > FilterPicker > filter_picker_ta_selected' is displayed


    @TR-C207884 @automated @regression @prio1
    Scenario: In videos page clicking on reset after selecting Multiple items in product
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


    @TR-C207882 @automated @regression @prio1
    Scenario: In videos page, Selecting product having no videos
        When I move to element 'EventsLocators > FilterPicker > filter_picker_product_dropdown'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown'
        And I move to element 'EventsLocators > FilterPicker > filter_picker_product_dropdown_no_videos'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown_no_videos'
        And I move to element 'EventsLocators > FilterPicker > no_videos_available_heading'
        Then The element 'EventsLocators > FilterPicker > no_videos_available_heading' text is 'No videos currently available'

    @TR-C207871 @automated @regression @prio1
    Scenario: On Videos page, clicking reset after selecting Therapy Area, Product, Materials Type and Audience
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
        And The element 'EventsLocators > FilterPicker > filter_picker_reset_button' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_reset_button'
        And The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown' is displayed
        Then I expect 'Please Select' in common element 'EventsLocators > FilterPicker > filters_default' with innertext:
            | Select Therapy Area | Select Product | Select Videos Type | Audience |


    @TR-C207941 @events-videos-pagination @automated @regression @prio1
    Scenario: UK > Verify pagination is not displayed on videos if there are less videos
        When The element 'VideosLocators > UKAbove > video_card > go_to_video_uk' is displayed
        And The element 'VideosLocators > UKAbove > video_card > title' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_audience_default'
        And I click on item 'EventsLocators > FilterPicker > filter_picker_audience_consultants_item'
        Then The element 'EventsLocators > FilterPicker > filter_picker_reset_button' is displayed
        And I expect 'VideosLocators > pagination_next_page_icon_disabled_btn' when less than 9 'VideosLocators > UKAbove > video_card > all_cards' are displayed

    @TR-C207944 @automated @regression @prio1
    Scenario: Verify Videos - Content Toggle - Read more/less toggle works as expected
        When The element 'VideosLocators > UKAbove > video_card > first_card' is displayed
        And The element 'VideosLocators > UKAbove > video_card > first_card_content_read_more_link' is displayed
        And I click on item 'VideosLocators > UKAbove > video_card > first_card_content_read_more_link'
        Then The element 'VideosLocators > UKAbove > video_card > first_card_content_read_more_link' is not displayed
        And The element 'VideosLocators > UKAbove > video_card > first_card_content_read_less_link' is displayed
        And The element 'VideosLocators > UKAbove > video_card > first_card_content_expanded' is displayed
        And The element 'VideosLocators > UKAbove > video_card > first_card_content_collapsed' is not displayed
        When I click on item 'VideosLocators > UKAbove > video_card > first_card_content_read_less_link'
        Then The element 'VideosLocators > UKAbove > video_card > first_card_content_read_less_link' is not displayed
        And The element 'VideosLocators > UKAbove > video_card > first_card_content_read_more_link' is displayed
        And The element 'VideosLocators > UKAbove > video_card > first_card_content_collapsed' is displayed
        And The element 'VideosLocators > UKAbove > video_card > first_card_content_expanded' is not displayed
