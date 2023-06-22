@GRV-3050 @GRV-3088
Feature: GRV_Automated - Edit profile - Edit Profile Personal tab Validation
    As a registered user that is editing my profile
    I want to know if my new profile information is correct
    So that my profile information is updated with valid information

    @TR-C359229 @GRV-3089
    Scenario: Edit profile personal tab validation - Last Name should be set as alpha only field
        Given I have logged in to my account "USER_EDIT_PROFILE"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        When I click on "Edit" button in "Personal" tab
        Then I should see edit "Title" field
        And I should see edit "First Name" field
        And I should see edit "Last Name" field
        And I should see edit "Email" field
        And The "Personal" edit fields should be editable
        And I should not be able to enter any characters apart from the "Alphabets" in "LastName" field

    @TR-C359228 @GRV-3090
    Scenario: Edit profile personal tab validation - First Name should be set as alpha only field
        Given I have logged in to my account "USER_EDIT_PROFILE"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        When I click on "Edit" button in "Personal" tab
        Then I should see edit "Title" field
        And I should see edit "First Name" field
        And I should see edit "Last Name" field
        And I should see edit "Email" field
        And The "Personal" edit fields should be editable
        And I should not be able to enter any characters apart from the "Alphabets" in "FirstName" field

    @TR-C359224 @TR-C359225 @TR-C359226 @TR-C359227 @GRV-3091 @automated @done @done_br
    Scenario Outline: Edit profile personal tab validation - Email not in correct format - Error should be shown
        Given I have logged in to my account "USER_EDIT_PROFILE"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        When I click on "Edit" button in "Personal" tab
        Then I should see edit "Title" field
        And I should see edit "First Name" field
        And I should see edit "Last Name" field
        And I should see edit "Email" field
        And The "Personal" edit fields should be editable
        Then I enter an '<email>' in Email field not as per the regex
        Then I should see an error "Please enter a valid email address" below the "Email" field
        Then I should see the "Save Changes" button disabled
        Examples:
        |   email               |
        |   test                |
 #       |   test@test           |
        |   test@test,com       |
        |   test@test..com      |
        |   test@test.co.com    |

    @TR-C359223 @GRV-3092 @automated @done @done_br
    Scenario: Edit profile personal tab validation - Email Empty - Error should be shown
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_FOUR"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        When I click on "Edit" button in "Personal" tab
        Then I should see edit "Title" field
        And I should see edit "First Name" field
        And I should see edit "Last Name" field
        And I should see edit "Email" field
        And The "Personal" edit fields should be editable
        When I delete the existing "Email" to leave the "Email" field empty
        Then I should see an error "Email address is required" below the "Email" field
        And I should see the "Save Changes" button disabled

    @TR-C359222 @GRV-3093 @automated @done @done_br
    Scenario: Edit profile personal tab validation - Last Name Empty - Error should be shown
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_FIVE"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        When I click on "Edit" button in "Personal" tab
        Then I should see edit "Title" field
        And I should see edit "First Name" field
        And I should see edit "Last Name" field
        And I should see edit "Email" field
        And The "Personal" edit fields should be editable
        When I delete the existing "Last Name" to leave the "Last Name" field empty
        Then I should see an error "Last name is required" below the "Last Name" field
        And I should see the "Save Changes" button disabled

    @TR-C359221 @GRV-3094 @automated @done @done_br
    Scenario: Edit profile personal tab validation - First Name Empty - Error should be shown
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_SIX"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        When I click on "Edit" button in "Personal" tab
        Then I should see edit "Title" field
        And I should see edit "First Name" field
        And I should see edit "Last Name" field
        And I should see edit "Email" field
        And The "Personal" edit fields should be editable
        When I delete the existing "First Name" to leave the "First Name" field empty
        Then I should see an error "First name is required" below the "First Name" field
        And I should see the "Save Changes" button disabled

    @TR-C359220 @GRV-3094 @automated @done @done_br
    Scenario: Edit profile personal tab validation - Full Scenario - Required Error is shown for Email , First Name , Last Name
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_SEVEN"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        When I click on "Edit" button in "Personal" tab
        Then I should see edit "Title" field
        And I should see edit "First Name" field
        And I should see edit "Last Name" field
        And I should see edit "Email" field
        And The "Personal" edit fields should be editable
        When I delete the existing "First Name" to leave the "First Name" field empty
        Then I should see an error "First name is required" below the "First Name" field
        When I delete the existing "Last Name" to leave the "Last Name" field empty
        Then I should see an error "Last name is required" below the "Last Name" field
        When I delete the existing "Email" to leave the "Email" field empty
        Then I should see an error "Email address is required" below the "Email" field
        And I should see the "Save Changes" button disabled