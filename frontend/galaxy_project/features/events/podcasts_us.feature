@nondestructive @events @podcasts @usabove

Feature: US Galaxy Automated Regression - Podcasts

    Background:
        Given I am on the page '/'
        And Browser is maximized


    @TR-C377996 @automated @regression @prio1
    Scenario: Verify user is navigated to Explore Content Picker page with Podcasts tab preselected
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        Then The page url contains 'podcasts'
        And The element 'PodcastsLocators > podcasts_tab' is displayed


    @TR-C378003 @automated @regression @prio1
    Scenario: Verify user is navigated to Explore Content page on clicking Explore Content mega menu from Therapy Area and Products Podcasts listing page
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_ta_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        And The element 'PodcastsLocators > explore_content_menu' is displayed
        And I click on item 'PodcastsLocators > explore_content_menu'
        Then The page url contains 'explore-content'
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        And The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_product_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        And The element 'PodcastsLocators > explore_content_menu' is displayed
        And I click on item 'PodcastsLocators > explore_content_menu'
        Then The page url contains 'explore-content'

    @TR-C378006 @automated @regression @prio1
    Scenario: Verify user is navigated to Explore Content menu picker podcasts page on clicking Podcasts sub menu from Explore Content mega menu on Therapy Area listing and Podcasts Player page
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_ta_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        And I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        Then The page url contains 'podcasts'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        When The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_ta_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        And The element 'PodcastsLocators > podcasts_card' is displayed
        And The element 'PodcastsLocators > podcast_card_play_button' is displayed
        And I click on item 'PodcastsLocators > podcast_card_play_button'
        And I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        Then The page url contains 'podcasts'
        And The element 'PodcastsLocators > podcasts_tab' is displayed

    @TR-C378009 @automated @regression @prio1
    Scenario: Verify user is navigated to Therapy Area podcasts page on clicking Podcasts menu from Therapy Area listing and Podcasts Player page
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_ta_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        And The element 'PodcastsLocators > podcasts_card' is displayed
        And The element 'PodcastsLocators > podcast_card_play_button' is displayed
        And I click on item 'PodcastsLocators > podcast_card_play_button'
        And The element 'PodcastsLocators > podcasts_menu' is displayed
        And I click on item 'PodcastsLocators > podcasts_menu'
        Then The page url contains 'ta'
        When I click on item 'PodcastsLocators > podcasts_menu'
        Then The page url contains 'ta'

    @TR-C378014 @automated @regression @prio1
    Scenario: Verify user is navigated to Products podcasts player page on clicking Play button on Podcast card from Products listing page and user is able to play podcast
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        And The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_product_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        And The element 'PodcastsLocators > podcasts_cards' is displayed
        When The element 'PodcastsLocators > podcasts_card' is displayed
        And The element 'PodcastsLocators > podcast_card_play_button' is displayed
        And I click on item 'PodcastsLocators > podcast_card_play_button'
        Then The element 'PodcastsLocators > further_listening_header' is displayed
        When I move to element 'PodcastsLocators > podcasts_container'
        And I switch to iframe 'PodcastsLocators > podcasts_container_iframe'
        And The element 'PodcastsLocators > podcasts_container_play_button' is displayed
        And I click on item 'PodcastsLocators > podcasts_container_play_button'
        Then The page url contains 'podcasts'
        When The element 'PodcastsLocators > podcasts_container_pause_button' is displayed
        And I click on item 'PodcastsLocators > podcasts_container_pause_button'
        And I switch back from iframe 'PodcastsLocators > podcasts_container_iframe'
        And I move to element 'PodcastsLocators > podcasts_card'
        And The element 'PodcastsLocators > podcast_card_play_button' is displayed
        And I click on item 'PodcastsLocators > podcast_card_play_button'
        Then The element 'PodcastsLocators > further_listening_header' is displayed

    @TR-C378018 @automated @regression @prio1
    Scenario: Verify user is navigated to Explore Content menu picker podcasts page on clicking Podcasts sub menu from Explore Content mega menu on Product listing and Podcasts Player page
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        And The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_product_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        And I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        Then The page url contains 'podcasts'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        When The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_product_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        And The element 'PodcastsLocators > podcasts_card' is displayed
        And The element 'PodcastsLocators > podcast_card_play_button' is displayed
        And I click on item 'PodcastsLocators > podcast_card_play_button'
        And I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        Then The page url contains 'podcasts'
        And The element 'PodcastsLocators > podcasts_tab' is displayed

    @TR-C378022 @automated @regression @prio1
    Scenario: Verify user is navigated to Product podcasts page on clicking Podcasts sub menu from Product listing and Podcasts Player page
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        And The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_product_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        Then The page url contains 'product'
        When The element 'PodcastsLocators > podcasts_card' is displayed
        And The element 'PodcastsLocators > podcast_card_play_button' is displayed
        And I click on item 'PodcastsLocators > podcast_card_play_button'
        And I move to element 'PodcastsLocators > patient_support_menu'
        And The element 'PodcastsLocators > podcasts_sub_menu' is displayed
        And I click on item 'PodcastsLocators > podcasts_sub_menu'
        Then The page url contains 'product'
        When I move to element 'PodcastsLocators > patient_support_menu'
        And The element 'PodcastsLocators > podcasts_sub_menu' is displayed
        And I click on item 'PodcastsLocators > podcasts_sub_menu'
        Then The page url contains 'product'

    @TR-C378158 @automated @regression @prio1
    Scenario: Verify user is able to read content on card by clicking on Read more/Read less link
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_ta_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        And I move to element 'PodcastsLocators > podcasts_card_read_more_link'
        And I click on item 'PodcastsLocators > podcasts_card_read_more_link'
        Then The element 'PodcastsLocators > podcasts_card_expanded_content' is displayed
        And The element 'PodcastsLocators > podcasts_card_read_less_link' is displayed
        When I click on item 'PodcastsLocators > podcasts_card_read_less_link'
        Then The element 'PodcastsLocators > podcasts_card_collapsed_content' is displayed

    @TR-C378000 @automated @regression @prio1
    Scenario: Verify user is navigated to Podcasts player page by selecting Therapy Area and can play podcast
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_ta_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        And The element 'PodcastsLocators > podcasts_card' is displayed
        And The element 'PodcastsLocators > podcast_card_play_button' is displayed
        And I click on item 'PodcastsLocators > podcast_card_play_button'
        When I move to element 'PodcastsLocators > podcasts_container'
        And I switch to iframe 'PodcastsLocators > podcasts_container_iframe'
        And The element 'PodcastsLocators > podcasts_container_play_button' is displayed
        And I click on item 'PodcastsLocators > podcasts_container_play_button'
        Then The page url contains 'podcasts'
        And The element 'PodcastsLocators > podcasts_container_pause_button' is displayed

    @TR-C378005 @automated @regression @prio1
    Scenario: Verify user is navigated to Explore Content menu picker podcasts page on clicking Explore Other Podcasts button from Therapy Area and Products listing page
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_ta_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        And The element 'PodcastsLocators > explore_other_podcasts' is displayed
        And I click on item 'PodcastsLocators > explore_other_podcasts'
        Then The page url contains 'podcasts'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        And The element 'EventsLocators > FilterPicker > filter_picker_product_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_product_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_product_dropdown_item'
        And I click on item 'EventsLocators > go-button'
        And The element 'PodcastsLocators > explore_other_podcasts' is displayed
        And I click on item 'PodcastsLocators > explore_other_podcasts'
        Then The page url contains 'podcasts'
        And The element 'PodcastsLocators > podcasts_tab' is displayed

    @TR-C378010 @automated @regression @prio1
    Scenario: Verify No podcasts available displayed on selecting therapy area for which no podcast available
        When I move to element 'PodcastsLocators > explore_content_menu'
        And The element 'PodcastsLocators > explore_content_podcasts_link' is displayed
        And I click on item 'PodcastsLocators > explore_content_podcasts_link'
        And The element 'PodcastsLocators > podcasts_tab' is displayed
        And The element 'EventsLocators > FilterPicker > filter_picker_ta_dropdown' is displayed
        And I click on item 'EventsLocators > FilterPicker > filter_picker_ta_dropdown'
        And I click on item 'PodcastsLocators > filter_picker_ta_no_podcasts'
        And I click on item 'EventsLocators > go-button'
        Then The element 'PodcastsLocators > no_podcasts_message' is displayed






