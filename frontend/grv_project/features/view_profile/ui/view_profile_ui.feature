@GRV-3038
Feature: GRV_Automated - View Profile - UI Design
    As a registered user,
    I want the view profile screens to look like the approved design
    So I can easily see my profile information

    @TR-C357381 @GRV-3044 @automated @market_uk @done @done_br
    Scenario: View Profile - Personal Tab contents
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_ONE"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        And  I should see "Email" section
        And I should see "Title" section
        And I should see "Name" section
        And I should see "Email_Consent" section
        And I should see "Delete" section based on market
        And I should see "Personal Edit" button
        And I should see "Close" button
        And I should see "Back" button

    @TR-C357380 @GRV-3045 @automated @market_uk @done @done_br
    Scenario: View Profile - Professional Tab contents
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_TWO"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        And  I should see "Profession" section
        And  I should see "Specialty" section
        And  I should see "Second Specialty" section based on market
        And  I should see "Registration / LSP number" section
        And  I should see "Workplace postcode" section based on market
        And I should see "Mailing Address AdminstrativeArea" section based on market
        And I should see "Professional Edit" button
        And I should see "Close" button
        And I should see "Back" button

   @TR-C357379 @GRV-3045 @automated @done @done_br
   Scenario: View Profile - Preferences Tab contents
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_TWO"
        Then I am on the "View_Profile" Screen
        When I click on the "Preferences" tab
        Then I should be on the "Preferences" tab
        And  I should see "Preferences" section
        And I should see "Preferences Edit" button
        And I should see "Close" button
        And I should see "Back" button


    @TR-C357378 @GRV-3046 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile - Password Tab contents
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_THREE"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        And  I should see "Password" section
        And I should see "Password Edit" button
        And I should see "Close" button
        And I should see "Back" button

    @TR-C357377 @GRV-3046 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile - Password value
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_FOUR"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        Then I should see the password section with value displayed in dots hiding the real password

  @TR-C357376 @GRV-3044 @automated @market_uk @done @done_br
    Scenario: View Profile - Personal Tab - Personal fields
        Given I have logged in to my account "VIEW_USER_PROFILE_SECOND"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        And I should see the "Email" section with expected value
        And I should see the "Title" section with expected value
        #Name in Brazil verifies Just Given Name
        And I should see the "Name" section with expected value
        And I should see the "Email Consent" section with expected value

  @TR-C357375 @GRV-3044 @automated @market_uk @done @done_br
  Scenario: View Profile - Professional Tab - Professional fields
        Given I have logged in to my account "VIEW_USER_PROFILE_SECOND"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        And  I should see the "Profession" section with expected value
        And  I should see the "Specialty" section with expected value
        And  I should see the "Second Specialty" section with expected value
        And  I should see the "Registration / LSP Number" section with expected value
        And  I should see the "Workplace Postcode" section with expected value
        And I should see the "Mailing Address AdminstrativeArea" section with expected value


 @TR-C357374 @GRV-3045 @automated @done @done_br
   Scenario: View Profile - Preferences Tab - Preferences fields
        Given I have logged in to my account "VIEW_USER_PROFILE_SECOND"
        Then I am on the "View_Profile" Screen
        When I click on the "Preferences" tab
        Then I should be on the "Preferences" tab
        #Need to enter Preferences with \n
        And I should see the "Preferences" section with expected value


  @TR-C357373 @GRV-3044 @automated @market_uk @done @done_br
    Scenario: View Profile - Full Scenario
        Given I have logged in to my account "VIEW_USER_PROFILE_SECOND"
        Then I am on the "View_Profile" Screen
        #Personal
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        And  I should see "Email" section
        And I should see "Title" section
        And I should see "Name" section
        And I should see "Email_Consent" section
        And I should see "Delete" section based on market
        And I should see "Personal Edit" button
        And I should see the "Email" section with expected value
        And I should see the "Title" section with expected value
        And I should see the "Name" section with expected value
        And I should see the "Email Consent" section with expected value
        #Professional
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        And  I should see "Profession" section
        And  I should see "Specialty" section
        And  I should see "Second Specialty" section based on market
        And  I should see "Registration / LSP number" section
        And  I should see "Workplace postcode" section based on market
        And I should see "Mailing Address AdminstrativeArea" section based on market
        And I should see "Professional Edit" button
        And  I should see the "Profession" section with expected value
        And  I should see the "Specialty" section with expected value
        And  I should see the "Second Specialty" section with expected value
        And  I should see the "Registration / LSP Number" section with expected value
        And  I should see the "Workplace Postcode" section with expected value
        And I should see the "Mailing Address AdminstrativeArea" section with expected value
        #Preferences
        When I click on the "Preferences" tab
        Then I should be on the "Preferences" tab
        And  I should see "Preferences" section
        And I should see "Preferences Edit" button
        And I should see the "Preferences" section with expected value
        #Password
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        And  I should see "Password" section
        And I should see "Password Edit" button
        Then I should see the password section with value displayed in dots hiding the real password
        And I should see "Close" button
        And I should see "Back" button

















#OLD- CODE
#    @GRV-3044
#    Scenario: View Profile - Personal Tab - Personal fields - Consent - Yes
#        Given I have logged in to my account "VIEW_USER_PROFILE_FIRST"
#        Then I am on the "View_Profile" Screen
#        When I click on the "Personal" tab
#        Then I should be on the "Personal" tab
#        And I should see the "Email" section with value "testuserpz1@mailinator.com"
#        And I should see the "Title" section with value "Ms."
#        And I should see the "Name" section with value "Test User"
#        And I should see the "Email Consent" section with value "Yes"
##    @GRV-3044 @obsolete(please see above re-worked version)
##    Scenario Outline: View Profile - Personal Tab - Personal fields - Consent - Yes
##        Given I have registered my account with following details:
##            | Salutation| First Name| Last Name| Email              | Email Consent |
##            | Mr        | Test      | User     | testuser@test.com  | Yes           |
##        Then I have logged in to my account
##        Then I am on the "View_Profile" Screen
##        When I click on the "Personal" tab
##        Then I should be on the "Personal" tab
##        Then I should see the <section> with <value>
##        Examples:
##        | section        | value             |
##        | Email          | testuser@test.com |
##        | Name           | Mr Test User      |
##        | Email Content  | yes               |
#
#    @GRV-3044 @automated @market_uk
#    Scenario: View Profile - Personal Tab - Personal fields - Consent - No
#        Given I have logged in to my account "VIEW_USER_PROFILE_SECOND"
#        Then I am on the "View_Profile" Screen
#        When I click on the "Personal" tab
#        Then I should be on the "Personal" tab
#        And I should see the "Email" section with value "testuserpz2@mailinator.com"
#        And I should see the "Title" section with value "Ms."
#        And I should see the "Name" section with value "Test User"
#        And I should see the "Email Consent" section with value "No"
##    @GRV-3044 @obsolete(please see above re-worked version)
##    Scenario Outline: View Profile - Personal Tab - Personal fields - Consent - No
##        Given I have registered my account with following details:
##            | Salutation| First Name| Last Name| Email              | Email Consent |
##            | Ms        | Test      | User     | testuser@test.com  | No           |
##        Then I have logged in to my account
##        Then I am on the "View_Profile" Screen
##        When I click on the "Personal" tab
##        Then I should be on the "Personal" tab
##        Then I should see the <section> with <value>
##        Examples:
##        | section        | value             |
##        | Email          | testuser@test.com |
##        | Name           | Ms Test User      |
##        | Email Content  | No                |
#    @GRV-3045
#    Scenario: View Profile - Professional Tab - Profession fields
#        Given I have logged in to my account "VIEW_USER_PROFILE_FIRST"
#        Then I am on the "View_Profile" Screen
#        When I click on the "Professional" tab
#        Then I should be on the "Professional" tab
#        And I should see the "Profession" section with value "Consultant"
#        And I should see the "Specialty" section with value "Asthma"
#        And I should see the "Second Specialty" section with value "Allergy"
#        And I should see the "Registration / LSP Number" section with value "ABCDEFG2123"
#        And I should see the "Workplace Postcode" section with value "W5 2ET"
##    @GRV-3045 @obsolete(please see above re-worked version)
##    Scenario Outline: View Profile - Professional Tab - Profession fields
##        Given I have registered my account with following details:
##            | Professional Designation | Speciality | Second Speciality | Prof Registration / LSP number | Workplace postcode |
##            | Consultant               | Asthma     | Allergy           | ABCDEFG2123                    | W5 2ET             |
##        Then I have logged in to my account
##        Then I am on the "View_Profile" Screen
##        When I click on the "Professional" tab
##        Then I should be on the "Professional" tab
##        Then I should see the <sub_section> with <value>
##        Examples:
##            | sub_section                    | value       |
##            | Professional Designation       | Consultant  |
##            | Speciality                     | Asthma      |
##            | Second Speciality              | Allergy     |
##            | Prof Registration / LSP number | ABCDEFG2123 |
##            | Workplace postcode             | W5 2ET      |
#
#    @GRV-3045 @automated @market_uk
#    Scenario: View Profile - Professional Tab - Profession fields - Second Speciality - None
#        Given I have logged in to my account "VIEW_USER_PROFILE_SECOND"
#        Then I am on the "View_Profile" Screen
#        When I click on the "Professional" tab
#        Then I should be on the "Professional" tab
#        And I should see the "Profession" section with value "Hospital Doctor"
#        And I should see the "Specialty" section with value "Cardiology"
#        And I should see the "Second Specialty" section with value ""
#        And I should see the "Registration / LSP Number" section with value "fsdhfkjhsd"
#        And I should see the "Workplace Postcode" section with value "MK8 9DJ"
##    @GRV-3045 @obsolete (please see above re-worked version)
##    Scenario Outline: View Profile - Professional Tab - Profession fields - Second Speciality - None
##        Given I have logged in to my account "VALID_USER_DETAILS"
##        Then I have logged in to my account
##        Then I am on the "View_Profile" Screen
##        When I click on the "Professional" tab
##        Then I should be on the "Professional" tab
##        Then I should see the <sub_section> with <value>
##        Examples:
##            | sub_section                    | value       |
##            | Professional Designation       | Consultant  |
##            | Speciality                     | Asthma      |
##            | Second Speciality              | None        |
##            | Prof Registration / LSP number | ABCDEFG2123 |
##            | Workplace postcode             | W5 2ET      |
