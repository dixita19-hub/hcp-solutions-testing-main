@GRV-2890 @GRV-2982
Feature: Registration - Step 3 of the registration form
    As an anonymous user
    I am on the registration form
    I want to be able to register successfully

    @GRV-2856 @automated
    Scenario: Registration - Continue button disabled on landing on Step 3 of the registration field
        Given I am an anonymous user
        Then I go to "Step_2" of the "Registration_Form"
        Then I go to "Step_3" of the "Registration_Form"
        Then I should see that "Complete registration" Button is disabled

    @automated @market_us_stg
    Scenario: Registration - Continue button disabled on landing on Step 3 of the registration field for us market
        Given I am an anonymous user
        Then I go to "Step_2" of the "Registration_Form" of us market
        Then I go to "Step_3" of the "Registration_Form" of us market
        Then I should see that "Continue" Button is enabled on "Step_3"

    @automated @market_us_stg
    Scenario: Registration - Complete registration disabled on landing on Step 3 of the registration field
        Given I am an anonymous user
        Then I go to "Step_2" of the "Registration_Form" of us market
        Then I go to "Step_3" of the "Registration_Form" of us market
        Then I go to "Step_4" of the "Registration_Form" of us market
        Then I should see that "Complete registration" Button is disabled

    @automated @market_us_stg
    Scenario: Registration - Continue button is enabled when all mandatory fields are filled on step 3 on us market
        Given I am an anonymous user
        Then I go to "Step_2" of the "Registration_Form" of us market
        Then I go to "Step_3" of the "Registration_Form" of us market
        Then I go to "Step_4" of the "Registration_Form" of us market
        Then I should see that "Complete registration" Button is disabled
        Then I Enter the "VALID_PASSWORD" in the "Password" field
        Then I Enter the "VALID_PASSWORD" in the "Confirm_Password" field
        Then I have "Checked" the "Certify" checkbox
        Then I should see that "Complete registration" Button is enabled

    @GRV-2857 @automated
    Scenario: Registration - Continue button is enabled when all mandatory fields are filled on step 3
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        Then I Enter the "VALID_PASSWORD" in the "Password" field
        Then I Enter the "VALID_PASSWORD" in the "Confirm_Password" field
        Then I have "Checked" the "Email_Consent" checkbox
        Then I have "Checked" the "Self_Certification" checkbox
        Then I should see that "Complete registration" Button is enabled

    @GRV-2858 @automated
    Scenario: Registration - Continue button is disabled when mandatory fields are not filled on step 3 - password
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        Then I Enter the "VALID_PASSWORD" in the "Confirm_Password" field
        Then I have "Checked" the "Email_Consent" checkbox
        Then I have "Checked" the "Self_Certification" checkbox
        #Then I should see that "Continue" Button is disabled
        Then I should see that "Complete registration" Button is disabled
        ##Then I should see an error "PASSWORD_DO_NOT_MATCH" below the "Confirm_Password" field

    @GRV-2858 @automated
    Scenario: Registration - Continue button is disabled when mandatory fields are not filled on step 3 - confirm password
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        Then I Enter the "VALID_PASSWORD" in the "Password" field
        Then I have "Checked" the "Email_Consent" checkbox
        Then I have "Checked" the "Self_Certification" checkbox
        #Then I should see that "Continue" Button is disabled
        Then I should see that "Complete registration" Button is disabled
        ##Then I should see an error "PASSWORD_REQUIRED_ERROR" below the "Confirm_Password" field

    @GRV-2858 @automated
    Scenario: Registration - Continue button is disabled when mandatory fields are not filled on step 3 - email consent
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        Then I Enter the "VALID_PASSWORD" in the "Password" field
        Then I Enter the "VALID_PASSWORD" in the "Confirm_Password" field
        Then I have "Unchecked" the "Email_Consent" checkbox
        Then I have "Checked" the "Self_Certification" checkbox
        Then I should see that "Complete registration" Button is disabled

    @GRV-2858 @automated
    Scenario: Registration - Continue button is disabled when mandatory fields are not filled on step 3 - self certified
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        Then I Enter the "VALID_PASSWORD" in the "Password" field
        Then I Enter the "VALID_PASSWORD" in the "Confirm_Password" field
        Then I have "Checked" the "Email_Consent" checkbox
        Then I have "Unchecked" the "Self_Certification" checkbox
        Then I should see that "Complete registration" Button is disabled

    @GRV-2859 @automated
    Scenario: Registration - Continue button is disabled when all invalid fields are filled - invalid confirm password
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        Then I Enter the "VALID_PASSWORD" in the "Password" field
        Then I Enter the "INVALID_PASSWORD" in the "Confirm_Password" field
        Then I have "Checked" the "Email_Consent" checkbox
        Then I have "Checked" the "Self_Certification" checkbox
        Then I should see that "Complete registration" Button is disabled

    @GRV-2859 @automated
    Scenario: Registration - Continue button is disabled when all invalid fields are filled - invalid password
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        Then I Enter the "INVALID_PASSWORD" in the "Password" field
        Then I Enter the "VALID_PASSWORD" in the "Confirm_Password" field
        Then I have "Checked" the "Email_Consent" checkbox
        Then I have "Checked" the "Self_Certification" checkbox
        Then I should see that "Complete registration" Button is disabled


    @GRV-2861 @automated
    Scenario: Registration - User lands on privacy & policy page when clicked to view privacy and cookie policy link on step 3
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I click on "PRIVACY_AND_COOKIE_POLICY" link
        Then I should be on the "privacy_and_cookie_policy" page

    @GRV-2863 @automated
    Scenario: Registration - User lands on Terms of use page when clicked to view privacy and cookie policy link on step 3
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I click on "TERMS_OF_USE" link
        Then I should be on the "terms_of_use" page

    @GRV-2874 @automated
    Scenario: Registration - User lands on step 2 on the registration form when Clicked on Back button of the step 3
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I click on "Back" Button
        Then I am redirected to "Step_2" of the "Registration_Form"

    @GRV-2875 @automated
    Scenario: Registration - User lands on Step 2 when the clicked on the Step 2 button on navigation indicator bar
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I click on "Step_2" Button on the navigation indicator bar
        Then I am redirected to "Step_2" of the "Registration_Form"

    @GRV-2842 @automated
    Scenario: Registration - Error Message when password contains First Name
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_FIRST_NAME_IN_IT" in the "Password" field
        #Then I should see an error "PASSWORD_SHOULD_NOT_HAVE_FIRST_NAME_LAST_NAME_AND_EMAIL" below the "Password" field
        Then I should see an error "PASSWORD_SHOULD_NOT_HAVE_FIRST_NAME_LAST_NAME_AND_EMAIL" below the "Password" field highlighted with red color

    @GRV-2843 @automated
    Scenario: Registration - Error Message when password contains Last Name
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_LAST_NAME_IN_IT" in the "Password" field
        Then I should see an error "PASSWORD_SHOULD_NOT_HAVE_FIRST_NAME_LAST_NAME_AND_EMAIL" below the "Password" field highlighted with red color

    @GRV-2844 @automated
    Scenario: Registration - Error Message when password contains Email
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_EMAIL_IN_IT" in the "Password" field
        Then I should see an error "PASSWORD_SHOULD_NOT_HAVE_FIRST_NAME_LAST_NAME_AND_EMAIL" below the "Password" field highlighted with red color


    @GRV-2842 @automated
    Scenario: Registration - Error Message when confirm password contains First Name
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_FIRST_NAME_IN_IT" in the "Confirm_Password" field
        Then I should see an error "PASSWORD_SHOULD_NOT_HAVE_FIRST_NAME_LAST_NAME_AND_EMAIL" below the "Password" field highlighted with red color

    @GRV-2843 @automated
    Scenario: Registration - Error Message when confirm password contains Last Name
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_LAST_NAME_IN_IT" in the "Confirm_Password" field
        Then I should see an error "PASSWORD_SHOULD_NOT_HAVE_FIRST_NAME_LAST_NAME_AND_EMAIL" below the "Password" field highlighted with red color

    @GRV-2844 @automated
    Scenario: Registration - Error Message when confirm password contains Email
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_EMAIL_IN_IT" in the "Confirm_Password" field
        Then I should see an error "PASSWORD_SHOULD_NOT_HAVE_FIRST_NAME_LAST_NAME_AND_EMAIL" below the "Password" field highlighted with red color

    @GRV-2845 @automated
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - No Uppercase letter
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_NO_UPPERCASE_LETTER" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with red color


    @GRV-2845 @automated
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - No Lowercase letter
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_NO_LOWERCASE_CHARACTER" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with red color


    @GRV-2845 @automated
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - No numbers
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_NO_NUMBER" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with red color


    @GRV-2845 @automated
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - No uppercase and lowercase
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_NO_LOWERCASE_UPPERCASE_CHARACTER" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with red color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with red color


    @GRV-2845 @automated
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - less than 8 characters
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_LESS_THAN_EIGHT_CHARACTERS" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with red color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color


    @GRV-2845 @automated
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - more than 20 characters
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_MORE_THAN_TWENTY_CHARACTERS" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with red color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color


    @GRV-2845 @automated
    Scenario: Registration - Password criteria should be all green - password satisfies all the criteria
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_ALL_CRITERIA_PASSED" in the "Password" field
        Then I should see the following "BETWEEN_8_AND_20_CHARS" highlighted with blue color
        Then I should see the following "DOESNT_CONTAIN_FNAME_LNAME_EMAIL" highlighted with blue color
        Then I should see the following "CONTAINS_NUMBER" highlighted with blue color
        Then I should see the following "CONTAINS_UPPERCASE_LETTER" highlighted with blue color
        Then I should see the following "CONTAINS_LOWERCASE_LETTER" highlighted with blue color


    @GRV-2866 @automated
    Scenario: Registration - User lands on Base webpage when close button is clicked on step 3
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I click on "Close" Button
        Then I should be on the Base webpage

    @GRV-2876 @automated
    Scenario: Registration - User lands on Step 1 when the clicked on the Step 1 button on navigation indicator bar
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I click on "Step_1" Button on the navigation indicator bar
        Then I am redirected back on "Step_1" of the "Registration" Form


    @GRV-2877
    Scenario: Registration - user lands on Account created page when clicked on the continue registration button
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        Then I Enter the "VALID_PASSWORD" in the "Password" field
        Then I Enter the "VALID_PASSWORD" in the "Confirm_Password" field
        Then I have "Checked" the "Email_Consent" checkbox
        Then I have "Checked" the "Self_Certification" checkbox
        Then I should see that "Complete registration" Button is enabled
        When I click on the "Complete_Registation" button
        Then I should be on the "Account_Created" page

    @GRV-2879 @automated
    Scenario: Registration - email consent is unchecked on landing on setp 3 of the registration form
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        Then I should see that the "Email_Consent" checkbox is "Unchecked"
        Then I should see that "Complete registration" Button is disabled


    @GRV-2870
    Scenario: Registration - User lands on Base webpage when close button is clicked on Account created message
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        Then I Enter the "VALID_PASSWORD" in the "Password" field
        Then I Enter the "VALID_PASSWORD" in the "Confirm_Password" field
        Then I have "Checked" the "Email_Consent" checkbox
        Then I have "Checked" the "Self_Certification" checkbox
        Then I should see that "Complete registration" Button is enabled
        When I click on the "Complete_Registation" button
        Then I should be on the "Account_Created" page
        When I click on "close" button
        Then I should be on the "Base" page


    @GRV-2869
    Scenario: Registration - Account creating fails, User should stay on Step 3 of registration form with an error message displayed
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        Then I Enter the "VALID_PASSWORD" in the "Password" field
        Then I Enter the "VALID_PASSWORD" in the "Confirm_Password" field
        Then I have "Checked" the "Email_Consent" checkbox
        Then I have "Checked" the "Self_Certification" checkbox
        Then I should see that "Continue" Button is enabled
        Then I click on the "Complete_Registation" button
        When Acccount creation is failed
        Then I should see an error "ACCOUNT_CREATION_ERROR"
        Then I am on "Step_3" of the "Registration_Form"

