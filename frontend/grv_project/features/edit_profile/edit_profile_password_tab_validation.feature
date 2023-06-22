@GRV-3050 @3013
Feature: GRV_Automated - Edit profile - Edit Profile Password tab Validation
    As a registered user that is editing my profile
    I want to know if my new profile information is correct
    So that my profile information is updated with valid information


    @TR-C359269 @GRV-3104 @NotApplicable
    Scenario: Edit profile password tab validation - New Password field empty - Error
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_ONE"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        Then I should be on the password edit screen
        Then The fields should be editable
        When I go into the "New Password" field
        Then I dont enter the New Password and click outside the field
        Then I should see an error "PASSWORD_REQUIRED" below the "New Password" field
        Then I should see the "Save Changes" button disabled
        # logout in order to avoid user session error
        Then I close and do logout

    @TR-C359268 @GRV-3105 @NotApplicable
    Scenario: Edit profile password tab validation - Confirm Password field empty - Error
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_TWO"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        Then I should be on the password edit screen
        Then The fields should be editable
        When I go into the "Confirm Password" field
        Then I dont enter the Confirm Password and click outside the field
        Then I should see an error "PASSWORD_REQUIRED_CONFIRM" below the "Confirm Password" field
        Then I should see the "Save Changes" button disabled
        Then I close and do logout

    @TR-C359267 @GRV-3106 @automated @done @done_br
    Scenario: Edit profile password tab validation - Current Password field empty - Error
        Given I have logged in to my account "VALID_USER_DETAILS"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        Then I should be on the password edit screen
        Then The fields should be editable
        When I go into the "Current Password" field
        Then I dont enter the Current Password and click outside the field
        Then I should see an error "CURRENT_PASSWORD_REQUIRED" below the "Current Password" field
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close and do logout

    @TR-C359266 @GRV-3107 @automated @done @done_br
    Scenario: Edit profile password tab validation - Current Password Does not match the set password - Error
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_THREE"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        Then I should be on the password edit screen
        Then The fields should be editable
        When I go into the "Current Password" field
        Then I enter the "Incorrect Current Password"
        Then I enter the New Password and confirm password
        Then I should see the "Save Changes" button enabled on Change Password page
        When I click on "Save Changes" Button on Change Password Page
        Then I should see an error "INCORRECT_CURRENT_PASSWORD" below the "Current Password" field
        Then I close and do logout

    @TR-C359265 @GRV-3187 @automated @done @done_br
    Scenario: Edit profile password tab validation - Password criteria should be unfulfilled for failed criteria - No Uppercase letter
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_ONE"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        Then I should be on the password edit screen
        Then The fields should be editable
        When I go into the "New Password" field
        When I Enter the "PASSWORD_WITH_NO_UPPERCASE_LETTER" in the "New Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with red color
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close and do logout

    @TR-C359264 @GRV-3187 @automated @done @done_br
    Scenario: Edit profile password tab validation - Password criteria should be unfulfilled for failed criteria - No Lowercase letter
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_TWO"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        Then I should be on the password edit screen
        Then The fields should be editable
        When I go into the "New Password" field
        When I Enter the "PASSWORD_WITH_NO_LOWERCASE_CHARACTER" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with red color
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close and do logout


    @TR-C359263 @GRV-3187 @automated @done @done_br
    Scenario: Edit profile password tab validation - Password criteria should be unfulfilled for failed criteria - No numbers
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_THREE"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        Then I should be on the password edit screen
        Then The fields should be editable
        When I go into the "New Password" field
        When I Enter the "PASSWORD_WITH_NO_NUMBER" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with red color
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close and do logout

    @TR-C359262 @GRV-3187 @automated @done @done_br
    Scenario: Edit profile password tab validation - Password criteria should be unfulfilled for failed criteria - No uppercase and lowercase
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_ONE"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        Then I should be on the password edit screen
        Then The fields should be editable
        When I go into the "New Password" field
        When I Enter the "PASSWORD_WITH_NO_LOWERCASE_UPPERCASE_CHARACTER" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with red color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with red color
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close and do logout

    @TR-C359261 @GRV-3187 @automated @done @done_br
    Scenario: Edit profile password tab validation - Password criteria should be unfulfilled for failed criteria - less than 8 characters
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_TWO"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        Then I should be on the password edit screen
        Then The fields should be editable
        When I go into the "New Password" field
        When I Enter the "PASSWORD_WITH_LESS_THAN_EIGHT_CHARACTERS" in the "Password" field
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with red color
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close and do logout

    @TR-C359260 @GRV-3187 @automated @done @done_br
    Scenario: Edit profile password tab validation - Password criteria should be unfulfilled for failed criteria - more than 20 characters
        Given I have logged in to my account "VALID_USER_DETAILS"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        Then I should be on the password edit screen
        Then The fields should be editable
        When I go into the "New Password" field
        When I Enter the "PASSWORD_WITH_MORE_THAN_TWENTY_CHARACTERS" in the "Password" field
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with red color
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close and do logout


    @TR-C359259 @GRV-3187 @automated @done @done_br
    Scenario: Edit profile password tab validation - Full Scenario - Password criteria
        Given I have logged in to my account "VALID_USER_DETAILS"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        Then I should be on the password edit screen
        Then The fields should be editable
        When I go into the "New Password" field
        When I Enter the "PASSWORD_WITH_NO_UPPERCASE_LETTER" in the "New Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with red color
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close the Change password Popup
        #Case 4
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        When I go into the "New Password" field
        When I Enter the "PASSWORD_WITH_NO_LOWERCASE_CHARACTER" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with red color
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close the Change password Popup
        #Case 5
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        When I go into the "New Password" field
        When I Enter the "PASSWORD_WITH_NO_NUMBER" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with red color
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close the Change password Popup
        #Case 6
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        When I go into the "New Password" field
        When I Enter the "PASSWORD_WITH_NO_LOWERCASE_UPPERCASE_CHARACTER" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with red color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with red color
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close the Change password Popup
        #Case 7
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        When I go into the "New Password" field
        When I Enter the "PASSWORD_WITH_LESS_THAN_EIGHT_CHARACTERS" in the "Password" field
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with red color
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close the Change password Popup
        #Case 8
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" link on the "Password" tab
        When I go into the "New Password" field
        When I Enter the "PASSWORD_WITH_MORE_THAN_TWENTY_CHARACTERS" in the "Password" field
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with red color
        Then I should see the "Save Changes" button disabled on Change Password page
        Then I close and do logout