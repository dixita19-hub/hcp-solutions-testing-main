@prio1 @cms @nondestructive @ukabove
Feature: CMS Automation - Basic flows

    Background:
        Given Browser is maximized
        And I am on the page '/user/login'
        And I set text 'QA Automation Admin' to field 'CMSLocators > username'
        And I set text 'Pfizer@123456' to field 'CMSLocators > password'
        And I click on item 'CMSLocators > submit'
        Then I expect that the title contains 'pfecgalaxypropfizerprocom'


    @automated @regression @e2e @TR-C392137 
    Scenario: CMS PfizerPro Event - E2E Testing for Branded Event
        # Steps to Add Speaker
        Given I am on the page '/node/add'
        And I click on item 'CMSLocators > Create_speaker'
        And The title is 'Create Speaker | pfecgalaxypropfizerprocom'
        And The element 'CMSLocators > Market' is displayed
        When I click on item 'CMSLocators > market > UK'
        # Introduced wait here because a loadtime is involved
        And I pause for '3' s
        When I set text with current_timestamp 'Auto Speaker ID - ' to field 'CMSLocators > speaker_id'
        And I set text 'Speaker - Test QA' to field 'CMSLocators > speaker_title'
        And I set text 'First' to field 'CMSLocators > firstName'
        And I set text 'Last' to field 'CMSLocators > lastName'
        And I set text 'Creds' to field 'CMSLocators > credentials'
        And I set text 'Company' to field 'CMSLocators > company'
        And I set text 'Job Title' to field 'CMSLocators > jobTitle'
        And I set text 'This is the Speaker's biography' to field 'CMSLocators > biography'
        And I click on item 'CMSLocators > access > private'
        And I set text 'Test Speaker QA' to field 'CMSLocators > title'
        And I click on item 'CMSLocators > save_as > needs_review'
        And I set text 'Revision Log' to field 'CMSLocators > revision_log'
        And I click on item 'CMSLocators > save_btn'
        Then I expect that the title is 'First Last Creds | pfecgalaxypropfizerprocom'
        When I click on item 'CMSLocators > moderation_state > published'
        And I set text 'Set to Published' to field 'CMSLocators > edit_revision_log'
        And I click on item 'CMSLocators > save_btn'
        Then I expect that element 'CMSLocators > message_moderation_state_updated' is displayed
        When I click on item 'CMSLocators > preview_tab' 
        And I click on item 'CMSLocators > save_btn'
        Then I expect that element 'CMSLocators > remove_from_preview' is displayed
        # Add Event
        Given I am on the page '/node/add'
        When I click on item 'CMSLocators > Create_event'
        And I click on item 'CMSLocators > market > UK'
        And I click on item 'CMSLocators > EventForm > associationType'
        And I click on item 'CMSLocators > EventForm > brandName_bavencioUK'
        And I set text 'DD/MM/YYYY' to field 'CMSLocators > EventForm > schedule > date'
        And I set text 'HH/MM' to field 'CMSLocators > EventForm > schedule > time'
        And I set text 'UTC' to field 'CMSLocators > EventForm > schedule > timezone'
        And I set text '2024-01-28T19:30:00Z' to field 'CMSLocators > EventForm > schedule > datetime'
        And I set text 'Auto Event - Test QA' to field 'CMSLocators > title'
        And I set text 'Subtitle' to field 'CMSLocators > EventForm > subtitle'
        And I set text 'Test Summary' to field 'CMSLocators > EventForm > summary'
        And I set text 'Test Description' to field 'CMSLocators > EventForm > description'
        And I set text 'Agenda Title 1' to field 'CMSLocators > EventForm > agenda > title'
        And I set text 'Test Description 1' to field 'CMSLocators > EventForm > agenda > description'
        And I set text 'Dr.' to field 'CMSLocators > EventForm > agenda > speaker_label'
        And I set text '11:00' to field 'CMSLocators > EventForm > agenda > startTime'
        And I set text '12:00' to field 'CMSLocators > EventForm > agenda > endTime'
        And I set text 'hr1@test.com' to field 'CMSLocators > EventForm > agenda > hostRep'
        And I click on item 'CMSLocators > EventForm > thumbnail > Pubaccess'
        And I click on item 'CMSLocators > EventForm > previewImage > Pubaccess'
        And I click on item 'CMSLocators > EventForm > prescribingInfo'
        And I set text 'link' to field 'CMSLocators > EventForm > prescribingInfo'
        And I click on item 'CMSLocators > EventForm > audience_1'
        And I click on item 'CMSLocators > EventForm > eventFormat_1'
        And I click on item 'CMSLocators > EventForm > interventions'
        And I set text 'Alpha Tag' to field 'CMSLocators > EventForm > tags'
        # Suggestive text takes a couple of seconds before appearing, included wait.
        And I pause for '3' s
        And I press 'DOWN'
        And I press 'ENTER'
        And I click on item 'CMSLocators > EventForm > featuredCheckbox'
        And I set text 'JOB-BAG-NUM-0001' to field 'CMSLocators > EventForm > jobBagNum'
        And I set text '30 Mins' to field 'CMSLocators > EventForm > duration'
        And I set text 'https://www.google.com' to field 'CMSLocators > EventForm > registrationURL'
        And I set text '20/01/2040' to field 'CMSLocators > EventForm > expirationDate'
        And I set text '10101010' to field 'CMSLocators > EventForm > expirationTime'
        And I click on item 'CMSLocators > save_as > needs_review'
        And I set text 'Revision Log' to field 'CMSLocators > revision_log'
        And I click on item 'CMSLocators > save_btn'
        When I click on item 'CMSLocators > moderation_state > published'
        And I set text 'Set to Published' to field 'CMSLocators > edit_revision_log'
        And I click on item 'CMSLocators > save_btn'
        Then I expect that element 'CMSLocators > message_moderation_state_updated' is displayed
        When I click on item 'CMSLocators > preview_tab' 
        And I click on item 'CMSLocators > save_btn'
        Then I expect that element 'CMSLocators > remove_from_preview' is displayed
        When I click on item 'CMSLocators > user_name'
        And I click on item 'CMSLocators > logout_btn'
        Then The page url contains 'pfizer-login/logout'


    @automated @regression @e2e @TR-C392217 
    Scenario: CMS PfizerPro Video - E2E Testing for Branded Video
        When I am on the page '/node/add'
        And I click on item 'CMSLocators > Create_video'
        And I click on item 'CMSLocators > market > UK'
        And I click on item 'CMSLocators > EventForm > associationType'
        And I click on item 'CMSLocators > EventForm > brandName_bavencioUK'
        And I set text 'Auto Video - Test QA' to field 'CMSLocators > title'
        And I set text 'Video Subtitle' to field 'CMSLocators > EventForm > subtitle'
        And I set text 'Video Test Summary' to field 'CMSLocators > EventForm > summary'
        And I set text 'Test Description' to field 'CMSLocators > EventForm > description'
        And I set text 'https://www.myelomasociety.org' to field 'CMSLocators > videoForm > URL'
        And I click on item 'CMSLocators > EventForm > thumbnail > Pubaccess'
        And I click on item 'CMSLocators > EventForm > previewImage > Pubaccess'
        And I set text 'link' to field 'CMSLocators > EventForm > prescribingInfo'
        And I set text 'Alpha Tag' to field 'CMSLocators > EventForm > tags'
        # Suggestive text takes a couple of seconds before appearing, included wait.
        And I pause for '3' s
        And I press 'DOWN'
        And I press 'ENTER'
        And I click on item 'CMSLocators > videoForm > audience_option'
        And I click on item 'CMSLocators > videoForm > URL'
        And I click on item 'CMSLocators > videoForm > video_format_option'
        And I click on item 'CMSLocators > EventForm > interventions'
        And I click on item 'CMSLocators > EventForm > featuredCheckbox'
        And I set text 'JOB-BAG-NUM-VID-0001' to field 'CMSLocators > EventForm > jobBagNum'
        And I set text 'DURATION' to field 'CMSLocators > EventForm > duration'
        And I click on item 'CMSLocators > save_as > needs_review'
        And I set text 'Revision Log' to field 'CMSLocators > revision_log'
        And I click on item 'CMSLocators > save_btn'
        When I click on item 'CMSLocators > moderation_state > published'
        And I set text 'Set to Published' to field 'CMSLocators > edit_revision_log'
        And I click on item 'CMSLocators > save_btn'
        Then I expect that element 'CMSLocators > message_moderation_state_updated' is displayed
        When I click on item 'CMSLocators > preview_tab' 
        And I click on item 'CMSLocators > save_btn'
        Then I expect that element 'CMSLocators > remove_from_preview' is displayed
        When I click on item 'CMSLocators > user_name'
        And I click on item 'CMSLocators > logout_btn'
        Then The page url contains 'pfizer-login/logout'
        

    @automated @regression @e2e @TR-C392356 
    Scenario: CMS PfizerPro Material - E2E Testing for Branded Material
        Given I am on the page '/node/add'
        When I click on item 'CMSLocators > Create_material'
        And I click on item 'CMSLocators > market > UK'
        And I click on item 'CMSLocators > EventForm > associationType'
        And I click on item 'CMSLocators > EventForm > brandName_bavencioUK'
        And I set text 'Auto Material - Test QA' to field 'CMSLocators > title'
        And I set text 'list summary' to field 'CMSLocators > materialForm > listingSummary'
        And I set text 'card summary' to field 'CMSLocators > materialForm > cardSummary'
        And I set text 'material description' to field 'CMSLocators > EventForm > description'
        And I set text 'link' to field 'CMSLocators > EventForm > prescribingInfo'
        And I click on item 'CMSLocators > EventForm > thumbnail > Pubaccess'
        And I click on item 'CMSLocators > EventForm > previewImage > Pubaccess'
        And I click on item 'CMSLocators > EventForm > download > Pubaccess'
        And I set text 'Alpha Tag' to field 'CMSLocators > EventForm > tags'
        # Suggestive text takes a couple of seconds before appearing, included wait.
        And I pause for '3' s
        And I press 'DOWN'
        And I press 'ENTER'
        And I click on item 'CMSLocators > videoForm > audience_option'
        And I click on item 'CMSLocators > materialForm > materialFormat'
        And I click on item 'CMSLocators > EventForm > interventions'
        And I click on item 'CMSLocators > EventForm > featuredCheckbox'
        And I set text 'JOB-BAG-NUM-0001' to field 'CMSLocators > EventForm > jobBagNum'
        And I set text 'DURATION' to field 'CMSLocators > EventForm > duration'
        And I click on item 'CMSLocators > save_as > needs_review'
        And I set text 'Revision Log' to field 'CMSLocators > revision_log'
        And I click on item 'CMSLocators > save_btn'
        When I click on item 'CMSLocators > moderation_state > published'
        And I set text 'Set to Published' to field 'CMSLocators > edit_revision_log'
        And I click on item 'CMSLocators > save_btn'
        Then I expect that element 'CMSLocators > message_moderation_state_updated' is displayed
        When I click on item 'CMSLocators > preview_tab' 
        And I click on item 'CMSLocators > save_btn'
        Then I expect that element 'CMSLocators > remove_from_preview' is displayed
        When I click on item 'CMSLocators > user_name'
        And I click on item 'CMSLocators > logout_btn'
        Then The page url contains 'pfizer-login/logout'