@GRV-2772 @regression_grv
Feature: GRV_Automated - Login
    As an anonymous user
    I am on the registration form
    I want to be able to register successfully

    @TR-C357371 @automated @done @done_br @market_us_stg
    Scenario: Login - Login field should have the password visible on clicking password toggle icon
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then User fills login form with "VALID_USER_DETAILS"
        When User sets field value "PASSWORD" as "VISIBLE"
        Then I should be able to see the "PASSWORD" entered in the "PASSWORD" field for "VALID_USER_DETAILS"

    @TR-C357370 @automated @done @done_br @market_us_stg
    Scenario: Login - Successful Login - Verified Email address
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then User fills login form with "VALID_USER_DETAILS"
        When User clicks "Log in" button on the Login page
        Then User should be able to login successfully

    @TR-C357369 @automated @done @done_br @market_us_stg
    Scenario: Login - Login button is disabled when user lands on Login screen
        Given I am an anonymous user
        When I am on the "LOGIN" Form
        Then "LOGIN" button shall be "DISABLED"

    @TR-C357368 @automated @done @done_br @market_us_stg
    Scenario: Login - Login button is enabled when user enters the valid user details
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then User fills login form with "VALID_USER_DETAILS"
        Then "LOGIN" button shall be "ENABLED"

    @TR-C357367 @GRV-2781 @GRV-2782 @automated @done @done_br @market_us_stg
    Scenario: Login - Login button is enabled and error displayed when invalid login credentials entered
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        When User fills login form with "INVALID_USER_DETAILS"
        Then "LOGIN" button shall be "ENABLED"
        When User clicks on "Log in" button
        Then User shall see "INVALID_CREDENTIALS" error message

    @TR-C357366 @GRV-2779 @automated @done @done_br @market_us_stg @issue
    Scenario: Login - Login button is disabled and error displayed when password is not entered
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        When User fills login form with "NO_PASSWORD"
        Then "LOGIN" button shall be "DISABLED"
        #When User clicks on "Log in" button
        Then User shall see "PASSWORD_REQUIRED" error message

    @TR-C357365 @GRV-2783 @automated @done @done_br @market_us_stg
    Scenario: Login - Error when maximum login attempts has been exceeded - Unregistered Email address
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        When User fills login form with "NOT_REGISTERED_EMAIL_ADDRESS"
        And I enter the "SOME_PASSWORD" in the "password" field
        And User clicks on "Log in" button
        Then I enter "SOME_PASSWORD" and click on the "LOGIN" button an additional 6 times within 20 mins
        Then User shall see "TOO_MANY_FAILED_LOGIN_ATTEMPTS" error message

    @TR-C357364 @GRV-2783 @automated @done @done_br @market_us_stg
    Scenario: Login - Error when maximum login attempts has been exceeded - registered Email address
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        When User fills login form with "REGISTERED_EMAIL_ADDRESS"
        Then I enter the "INVALID_PASSWORD" in the "password" field
        Then I enter "INVALID_PASSWORD" and click on the "LOGIN" button an additional 6 times within 20 mins
        Then User shall see "TOO_MANY_FAILED_LOGIN_ATTEMPTS" error message

    @TR-C357363 @GRV-2800 @automated @done @done_br @market_us_stg
    Scenario: Login - New password request is made for an Valid Registered Email
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then I click on "Forgot_Password" link
        Then I am on "Forgot_Password" Form
        When I enter an "Valid_Registered_Email" in "Email" field as per the regex
        Then I should see that "Request_New_Password" Button is enabled
        When I click on "Request_New_Password" Button
        Then I should be navigated to the "Successful_Password_Request" page which display "SUCCESSFUL_PASSWORD_EMAIL_SENT_TEXT"
#        emails verification test logic have been omitted. Instead- only 'messages' notifications on UI are being checked
#        Then I should receive a "Reset_password" Email
#        Then I should see a "reset_password" link to reset my password in the body of the email received

    @TR-C357362 @GRV-3164 @GRV-3002 @automated @done @done_br @market_us_stg
    Scenario: Login - User should land back to base page when close button is clicked
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        When I click on "Close" Button
        Then I should be on the Base webpage

    @TR-C357358 @TR-C357359 @TR-C357360 @TR-C357361 @GRV-2780 @automated @done @done_br
    Scenario Outline: Login - Email should show an error if the entered email is not as per the regex
        Given I am an anonymous user
        Then I am on the "Login" Form
        Then I enter an '<email>' in Email field not as per the regex
        Then I enter the "SOME_PASSWORD" in the "password" field
        Then I should see an error "EMAIL_NOT_VALID_ERROR" below the "Email" field
        Examples:
        |   email               |
        |   test                |
#        |   test@test           | --> No Error displayed.
        |   test@test,com       |
        |   test@test..com      |
        |   test@test.co..com   |


#        #Not Sure
#    @GRV-3166 @2992 @automated
#    Scenario: Login - Successful Login should land on to Thank you for registering screen
#        Given I am an anonymous user
#        When I am picked up a "GRV_Registered" user
#        #prepared user in advance with non-verified email, placed in test_data.json
#        #Then I have not verified my email address
#        Then I am on the "LOGIN" Form
#        Then User fills login form with "REGISTERED_USER_NOT_VERIFIED_EMAIL"
#        Then "LOGIN" button shall be "ENABLED"
#        When User clicks "Log in" button on the Login page
#        Then I should be on the "Thank_you_for_registering_with_pfizer" screen
