@regression_grv @nondestructive
Feature: GRV_Automated_Regression - Login and Registration
    As an anonymous user
    I am on the registration form
    I want to be able to register successfully

    @automated @market_us_stg
    Scenario: Login - User should be able to login with verified email into Us market
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then User fills login form with "VALID_USER_DETAILS"
        When User clicks "Log in" button on the Login page
        Then User should be able to login successfully

    @automated @market_uk_stg
    Scenario: Login - User should be able to login with verified email into Uk market
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then User fills login form with "VALID_USER_DETAILS"
        When User clicks "Log in" button on the Login page
        Then User should be able to login successfully on "market_uk_stg"

    @automated @market_us_stg @ibx_us_stg
    Scenario: Registration - Complete Registration on us market
        Given I am an anonymous user
        Then I go to "Step_2" of the "Registration_Form" of us market
        Then I go to "Step_3" of the "Registration_Form" of us market
        Then I go to "Step_4" of the "Registration_Form" of us market
        Then I should see that "Complete registration" Button is disabled
        Then I Enter the "VALID_PASSWORD" in the "Password" field
        Then I Enter the "VALID_PASSWORD" in the "Confirm_Password" field
        Then I have "Checked" the "Certify" checkbox
        Then I should see that "Complete registration" Button is enabled
        #Then I should click "Complete registration" Button on us market
        #Then I save registered user details of us market

    @automated @market_us_stg @ibx_uk_stg
    Scenario: Registration - Complete Registration on uk market
        Given I am an anonymous user
        Then I go to "Step_2" of the "Registration_Form" of uk stg market
        Then I go to "Step_3" of the "Registration_Form" of uk stg market
        Then I should see that "Complete registration" Button is disabled
        Then I Enter the "VALID_PASSWORD" in the "Password" field
        Then I Enter the "VALID_PASSWORD" in the "Confirm_Password" field
        Then I have "Checked" the "Consent" checkbox
        Then I should see that "Complete registration" Button is enabled
        #Then I should click "Complete registration" Button on us market
        #Then I save registered user details of us market
