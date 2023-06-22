@GRV-3050 @3095
Feature: GRV_Automated - Edit profile - Edit Success Scenarios
    As a registered user that is editing my profile
    I want to know if my new profile information is correct
    So that my profile information is updated with valid information


    @TR-C359219 @GRV-3099 @automated @done @done_br
    Scenario: Edit profile - Professional tab
        Given I have logged in to my account "USER_EDIT_PROFILE"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        When I click on "Edit" button in "Professional" tab
        Then I should see edit "Profession" field
        And The "Professional" edit fields should be editable
        Then I should edit "Profession" field
        And I should edit "Speciality" field
        And I should edit "Second Speciality" field
        And I should edit "Prof Registration / LSP number" field
        And I should edit "Workplace Postcode" field
        And I should edit "Mailing Address AdminstrativeArea" field
        And I click on Save button on Professional page
        Then I close and do logout


    @TR-C359218 @GRV-3092 @automated @done @done_br
    Scenario: Edit profile - Personal tab
        Given I have logged in to my account "USER_EDIT_PROFILE"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        When I click on "Edit" button in "Personal" tab
        Then I should edit "Title" field
        And I should edit "First Name" field
        And I should edit "Last Name" field
        And I should edit "Email" field
        And I should edit "Email Consent" field
        And I click on Save button
        Then I close and do logout

    @TR-C359217 @GRV-3106 @automated @done @done_br
    Scenario: Edit profile - Password tab
        Given I have logged in to my account "VALID_USER_DETAILS"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        Then I should be on the password edit screen
        Then The fields should be editable
        When I go into the "Current Password" field
        Then I enter the "Correct Current Password"
        Then I enter the New Password and confirm password
        Then I should see the "Save Changes" button enabled on Change Password page
        When I click on "Save Changes" Button on Change Password Page
        Then I close the Successful Change Password popup
        Then I do logout

    @TR-C359216 @GRV-3106 @automated @done @done_br
    Scenario: Edit profile - Preferences tab
        Given I have logged in to my account "USER_EDIT_PROFILE"
        Then I am on the "View_Profile" Screen
        When I click on the "Preferences" tab
        Then I should be on the "Preferences" tab
        And I click "Preferences Edit" button
        And I should edit "Preferences" field
        When I click on "Save Changes" Button on Preferences Page
        Then I close and do logout