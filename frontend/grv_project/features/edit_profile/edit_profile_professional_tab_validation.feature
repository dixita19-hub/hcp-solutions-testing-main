@GRV-3050 @3095
Feature: GRV_Automated - Edit profile - Edit Profile Professional tab Validation
    As a registered user that is editing my profile
    I want to know if my new profile information is correct
    So that my profile information is updated with valid information


    @TR-C359258 @GRV-3096 @NotApplicable
    Scenario: Edit profile professional tab validation - Profession field empty - Error
        Given I have logged in to my account "USER_EDIT_PROFILE"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        When I click on "Edit" button in "Professional" tab
        Then I should see edit "Profession" field
        And I should see edit "Speciality" field
        And I should see edit "Second Speciality" field
        And I should see edit "Prof Registration / LSP number" field
        And I should see edit "Workplace Postcode" field
        And The "Professional" edit fields should be editable
        When I select "Profession *" from "Profession" select
        And I click on "Professional" edit title
        Then I should see an error "Profession is required" below the "Profession" field
        And I should see the "Save Changes" button disabled


    @TR-C359257 @GRV-3097 @NotApplicable
    Scenario: Edit profile professional tab validation - Speciality field empty - Error
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_SEVEN"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        When I click on "Edit" button in "Professional" tab
        Then I should see edit "Profession" field
        And I should see edit "Speciality" field
        And I should see edit "Second Speciality" field
        And I should see edit "Prof Registration / LSP number" field
        And I should see edit "Workplace Postcode" field
        And The "Professional" edit fields should be editable
        When I select "Specialty *" from "Speciality" select
        And I click on "Professional" edit title
        Then I should see an error "Specialty is required" below the "Specialty" field
        And I should see the "Save Changes" button disabled

    @TR-C359256 @GRV-3098 @automated @done
    Scenario: Edit profile professional tab validation - License field empty - Error
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_EIGHT"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        When I click on "Edit" button in "Professional" tab
        Then I should see edit "Profession" field
        And I should see edit "Speciality" field
        And I should see edit "Second Speciality" field
        And I should see edit "Prof Registration / LSP number" field
        And I should see edit "Workplace Postcode" field
        And The "Professional" edit fields should be editable
        When I delete the existing "License Number" to leave the "Email" field empty
        And I click on "Professional" edit title
        Then I should see an error "License number is required" below the "License Number" field
        And I should see the "Save Changes" button disabled on Professional page

    @TR-C359255 @GRV-3099 @automated @done
    Scenario: Edit profile professional tab validation - Postcode field empty - Error
        Given I have logged in to my account "USER_EDIT_PROFILE"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        When I click on "Edit" button in "Professional" tab
        Then I should see edit "Profession" field
        And I should see edit "Speciality" field
        And I should see edit "Second Speciality" field
        And I should see edit "Prof Registration / LSP number" field
        And I should see edit "Workplace Postcode" field
        And The "Professional" edit fields should be editable
        When I delete the existing "Postcode" to leave the "Postcode" field empty
        And I click on "Professional" edit title
        Then I should see an error "Postcode is required" below the "Postcode" field
        And I should see the "Save Changes" button disabled on Professional page

    @TR-C359248 @TR-C359249 @TR-C359250 @TR-C359251 @TR-C359252 @TR-C359253 @TR-C359254 @GRV-3100 @Updated
    Scenario Outline: Edit profile professional tab validation - License field Not in correct Format More than 12 characters - Error
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_NINE"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        When I click on "Edit" button in "Professional" tab
        Then I should see edit "Profession" field
        And I should see edit "Speciality" field
        And I should see edit "Second Speciality" field
        And I should see edit "Prof Registration / LSP number" field
        And I should see edit "Workplace Postcode" field
        And The "Professional" edit fields should be editable
        When I enters an <value> in "License" edit field
        And I click on "Professional" edit title
        Then I should see an error "Please enter a valid License Number" below the "License Number" field
        And I should see the "Save Changes" button disabled on Professional page
        Examples:
            | value            |
            | 1234567890123    |
            | 123456789012345  |
            | 123456ABCDEFG    |
            | ABCDEFG123456789 |
            | 1234ABCDEFGH12   |
            | 123456ABCDEFGH   |
            | ABCDEFG1234HG    |

    @TR-C359240 @TR-C359241 @TR-C359242 @TR-C359243 @TR-C359244 @TR-C359245 @TR-C359246 @TR-C359247 @GRV-3100 @Updated
    Scenario Outline: Edit profile professional tab validation - License field Not in correct Format Less than 7 characters - Error
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_TEN"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        When I click on "Edit" button in "Professional" tab
        Then I should see edit "Profession" field
        And I should see edit "Speciality" field
        And I should see edit "Second Speciality" field
        And I should see edit "Prof Registration / LSP number" field
        And I should see edit "Workplace Postcode" field
        And The "Professional" edit fields should be editable
        When I enters an <value> in "License" edit field
        And I click on "Professional" edit title
        Then I should see an error "Please enter a valid License Number" below the "License Number" field
        And I should see the "Save Changes" button disabled on Professional page
        Examples:
            | value  |
            | 1      |
            | 123    |
            | 123456 |
            | ABC    |
            | ABCDEF |
            | ABC123 |
            | AB12   |
            | 1AB    |

    @TR-C359232 @TR-C359233 @TR-C359234 @TR-C359235 @TR-C359236 @TR-C359237 @TR-C359238 @TR-C359239 @GRV-3101 @Updated
    Scenario Outline: Edit profile professional tab validation - Postcode field Not in correct Format Less than 7 characters - Error
        Given I have logged in to my account "USER_EDIT_PROFILE"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        When I click on "Edit" button in "Professional" tab
        Then I should see edit "Profession" field
        And I should see edit "Speciality" field
        And I should see edit "Second Speciality" field
        And I should see edit "Prof Registration / LSP number" field
        And I should see edit "Workplace Postcode" field
        And The "Professional" edit fields should be editable
        When I enters an <value> in "Postcode" edit field
        And I click on "Professional" edit title
        Then I should see an error "Please enter a valid Post Code" below the "Postcode" field
        And I should see the "Save Changes" button disabled on Professional page
        Examples:
            | value   |
            | MK8     |
            | MK8 @AB |
            | HA8 D3P |
            | HA8 ABC |
            | ABC 123 |
            | W5 ET   |
            | HA8 DP3 |
            | 8HA 3DP |


    @TR-C359231 @GRV-3100 @automated @done
    Scenario: Edit profile professional tab validation - License field Not in correct Format More than 12 characters and Less than 7 characters - Error
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_NINE"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        When I click on "Edit" button in "Professional" tab
        Then I should see edit "Profession" field
        And I should see edit "Speciality" field
        And I should see edit "Second Speciality" field
        And I should see edit "Prof Registration / LSP number" field
        And I should see edit "Workplace Postcode" field
        And The "Professional" edit fields should be editable
        When I enters an 'License' in targeted edit field and see error as expected


    @TR-C359230 @GRV-3101 @automated @done
    Scenario: Edit profile professional tab validation - Postcode field Not in correct Format Less than 7 characters - Error
        Given I have logged in to my account "USER_EDIT_PROFILE"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        When I click on "Edit" button in "Professional" tab
        Then I should see edit "Profession" field
        And I should see edit "Speciality" field
        And I should see edit "Second Speciality" field
        And I should see edit "Prof Registration / LSP number" field
        And I should see edit "Workplace Postcode" field
        And The "Professional" edit fields should be editable
        When I enters an 'Postalcode' in targeted edit field and see error as expected