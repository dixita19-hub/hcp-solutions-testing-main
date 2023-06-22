@GRV-2890 @GRV-2981
Feature: Registration - Step 1 of Registration Flow
    As an anonymous user
    I am on the registration form
    I want to be able to register successfully

    @GRV-2825 @automated @market_uk @market_br @market_us_stg
    Scenario: Registration - Space as first character is not accepted in First name field
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter a space as the first character in the "First_Name" field
        Then I should not see the space accepted in the "First_Name" field

    @GRV-2827 @automated @market_uk @market_br @market_us_stg
    Scenario: Registration - Space as first character is not accepted in Last name field
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter a space as the first character in the "Last_Name" field
        Then I should not see the space accepted in the "Last_Name" field

    @GRV-2826 @automated @market_uk @market_br
    Scenario Outline: Registration - Only Alphabets in the first name are accepted
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I enter an "<Alphabets>" in the "First_Name" field
        When I move to "Last_Name" field
        Then I should not see any error for the "First_Name" field
        Then I should see the entered "<Alphabets>" in the "First_Name" field
        Examples:
            | Alphabets                   |
            | Testfirstname               |
            | Te                          |
            | Testuserhavinglongfirstname |
            | T                           |
            | Test User                   |

    @GRV-2826 @automated @market_us_stg
    Scenario Outline: Registration - Only Alphabets in the first name are accepted for us market
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I enter an "<Alphabets>" in the "First_Name" field
        When I move to "Last_Name" field
        Then I should not see any error for the "First_Name" field
        Then I should see the entered "<Alphabets>" in the "First_Name" field
        Examples:
            | Alphabets                   |
            | Testfirstname               |
            | Te                          |
            | T                           |
            | Test User                   |

    @GRV-2826 @automated @market_uk
    Scenario Outline: Registration -  Non Alphabets in the first name are not acccepted
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I enter an "<Non_Alphabets>" in the "First_Name" field
        When I move to "Last_Name" field
        Then I should not see the entered "<Non_Alphabets>" in the "First_Name" field
        Examples:
        |   Non_Alphabets  |
        |   1234           |
        |   £$%            |
        |   $_&            |

    @GRV-2828 @automated @market_uk
    Scenario Outline: Registration - Only Alphabets in the last name are accepted
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I enter an "<Alphabets>" in the "Last_Name" field
        When I move to "Email" field
        Then I should not see any error for the "Last_Name" field
        Then I should see the entered "<Alphabets>" in the "Last_Name" field
        Examples:
        |   Alphabets                   |
        |   Testfirstname               |
        |   Te                          |
        |   Testuserhavinglongfirstname |
        |   T                           |
        |   Test User                   |

     @GRV-2828 @automated @market_us_stg
    Scenario Outline: Registration - Only Alphabets in the last name are accepted for us market
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I enter an "<Alphabets>" in the "Last_Name" field
        When I move to "Email" field
        Then I should not see any error for the "Last_Name" field
        Then I should see the entered "<Alphabets>" in the "Last_Name" field
        Examples:
        |   Alphabets                   |
        |   Testfirstname               |
        |   Te                          |
        |   T                           |
        |   Test User                   |

    @GRV-2828 @automated @market_uk
    Scenario Outline: Registration -  Non Alphabets in the last name are not acccepted
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I enter an "<Non_Alphabets>" in the "Last_Name" field
        When I move to "Email" field
        # validation appears if user enters non-alphanumeric values in the input
        #Then I should not see any error for the "First_Name" field
        Then I should not see the entered "<Non_Alphabets>" in the "Last_Name" field
        Examples:
        |   Non_Alphabets  |
        |   1234           |
        |   £$%            |
        |   $_&            |

    @GRV-2829 @automated @market_uk @market_us_stg
    Scenario Outline: Registration - Email should show an error if the entered email fails the regex
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I enter an "<email>" in "Email" field not as per the regex
        When I move to "Last_Name" field
        Then I should see an error "EMAIL_NOT_VALID_ERROR" below the "Email" field
        Examples:
        |   email               |
        |   test                |
        |   test@test           |
        |   test@test,com       |
        |   test@test..com      |
# excluded this one as email is actually valid. Verified on the resource
#        |   test@test.co.com    |

    @GRV-2831
    Scenario Outline: Registration - User should see the error when entered email is already associated with another account
        Given I am an anonymous user
        Then I have registered a user successfully
        When I use the already registered email in "Step_1" of the "Registration_Form"
        Then I enter an "<email>" in "Email" field not as per the regex
        And I press 'TAB'
        Then I should see an error "That email is already registered, please log in instead." below the "Email" field
        Examples:
        |   email                   |
        |   test@test.com           |
        |   test@test.co.uk         |
        |   test@test.org           |
        |   test@test-user.com      |
        |   test@test.org           |

    @GRV-2848 @automated @market_us_stg
    Scenario: Registration - Continue button disabled on landing on Step 1 of the registration field
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I should see that "Continue" Button is disabled

    @GRV-2849 @automated
    Scenario: Registration - Continue button is enabled when all fields are filled - No Title - Step 1
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "Title" in the "Titles" field
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        When I Enter the "Email" in the "Email" field
        And I press 'TAB'
        Then I should see that "Continue" Button is enabled

    @GRV-2849 @automated @market_us_stg
    Scenario: Registration US Market- Continue button is enabled when all fields are filled - No Title - Step 1
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        When I Enter the "Email" in the "Email" field
        And I press 'TAB'
        Then I should see that "Continue" Button is enabled

    @GRV-2849 @automated
    Scenario: Registration - Continue button is enabled when all fields are filled - With Title
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "Title" in the "Titles" field
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        When I Enter the "Email" in the "Email" field
        And I press 'TAB'
        Then I should see that "Continue" Button is enabled

    @GRV-2849 @automated @market_us_stg
    Scenario: Registration US Market - Continue button is enabled when all fields are filled - With Title
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        When I Enter the "Email" in the "Email" field
        And I press 'TAB'
        Then I should see that "Continue" Button is enabled

    @GRV-2850 @automated
    Scenario: Registration - Continue button is disabled when Email entered is invalid
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "Title" in the "Titles" field
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        When I Enter the "INVALID_EMAIL" in the "Email" field
        And I press 'TAB'
        Then I should see that "Continue" Button is disabled

    @GRV-2850 @automated @market_us_stg
    Scenario: Registration US Market - Continue button is disabled when Email entered is invalid
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        When I Enter the "INVALID_EMAIL" in the "Email" field
        And I press 'TAB'
        Then I should see that "Continue" Button is disabled

    @GRV-2851 @automated
    Scenario: Registration - Continue button is disabled when First Name is not entered
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "Title" in the "Titles" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        When I Enter the "Email" in the "Email" field
        Then I should see that "Continue" Button is disabled

    @GRV-2851 @automated @market_us_stg
    Scenario: Registration US Market - Continue button is disabled when First Name is not entered
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "Last_Name" in the "Last_Name" field
        When I Enter the "Email" in the "Email" field
        Then I should see that "Continue" Button is disabled

    @GRV-2851 @automated
    Scenario: Registration - Continue button is disabled when Last Name is not entered
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "Title" in the "Titles" field
        Then I Enter the "First_Name" in the "First_Name" field
        When I Enter the "Email" in the "Email" field
        Then I should see that "Continue" Button is disabled

    @GRV-2851 @automated @market_us_stg
    Scenario: Registration US Market - Continue button is disabled when Last Name is not entered
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "First_Name" in the "First_Name" field
        When I Enter the "Email" in the "Email" field
        Then I should see that "Continue" Button is disabled

    @GRV-2851 @automated
    Scenario: Registration - Continue button is disabled when Email is not entered
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "Title" in the "Titles" field
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        Then I should see that "Continue" Button is disabled

    @GRV-2851 @automated @market_us_stg
    Scenario: Registration - Continue button is disabled when Email is not entered
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        Then I should see that "Continue" Button is disabled

    @GRV-2860 @automated
    Scenario: Registration - User lands on privacy policy when clicked to view privacy policy
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        When I click on 'PRIVACY_POLICY' link
        Then I should be on the "Privacy_Policy" page


    @GRV-2864 @automated @market_us_stg
    Scenario: Registration - User lands on Base webpage when close button is clicked
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        When I click on "Close" Button
        Then I should be on the Base webpage

    @GRV-2867 @automated
    Scenario: Registration - User clicks on Continue button to land on Step 2 of the registration form
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "Title" in the "Titles" field
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        When I Enter the "Email" in the "Email" field
        And I press 'TAB'
        Then I should see that "Continue" Button is enabled
        When I click on "Continue" Button
        Then I am on "Step_2" of the "Registration_Form"

    @GRV-2867 @automated @market_us_stg
    Scenario: Registration - User clicks on Continue button to land on Step 2 of the registration form
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        When I Enter the "Email" in the "Email" field
        And I press 'TAB'
        Then I should see that "Continue" Button is enabled
        When I click on "Continue" Button
        Then I am on "Step_2" of the "Registration_Form"

    @GRV-2871 @automated @market_us_stg
    Scenario: Registration - User lands on Login page when the bacck button is clicked on Step 1
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        When I click on "Back" Button
        Then I should be on the "Login_Page"

#    BRAZIL market only
    @market_br
    Scenario Outline: [brazil] Registration - User Title
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I should see the "Title_Drop_Down_Text" by default in salutation dropdown
        When I click on the "Salutation" dropdown
        Then I should see the <Salutation> in the dropdown
        Examples:
            | Salutation    |
            | Senhor        |
            | Senhorita     |
            | Senhora       |
            | Dr.(a)        |
            | Test User     |

#    BRAZIL market only
    @market_br
    Scenario: [brazil] Registration - Defaults First Name filed text
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I should see default text "FIRST_NAME_DEFAULT_TEXT" in the "First_Name" field

#    BRAZIL market only
    @market_br
    Scenario: [brazil] Registration - Default Surname Name filed text
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I should see default text "SURNAME_NAME_DEFAULT_TEXT" in the "First_Name" field

#    BRAZIL market only
    @market_br
    Scenario: [brazil] Registration - Default Email Name filed text
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I should see default text "EMAIL_TEXT" in the "First_Name" field

#    BRAZIL market only
    @market_br
    Scenario: [brazil] Registration - Static Text on the registration form
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I should see static text "STEP_1_STATIC_TEXT" in step_1 of the registration form

#    BRAZIL market only
    @GRV-2850 @automated @market_br
    Scenario: [brazil] Registration - Continue button is disabled when Email entered is invalid
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "Title" in the "Titles" field
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        When I Enter the "INVALID_EMAIL" in the "Email" field
        And I press 'TAB'
        Then I should see an error "EMAIL_NOT_VALID_ERROR" below the "Email" field
        Then I should see that "Continue" Button is disabled

#    BRAZIL market only
    @GRV-2851 @automated @market_br
    Scenario: [brazil] Registration - Continue button is disabled when First Name is not entered brazil
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "Title" in the "Titles" field
        And I press 'TAB'
        Then I Enter the "Last_Name" in the "Last_Name" field
        When I Enter the "Email" in the "Email" field
        And I press 'TAB'
        Then I should see an error "FIRST_NAME_VALIDATION_MESSAGE" below the "First_Name" field
        Then I should see that "Continue" Button is disabled

#    BRAZIL market only
    @GRV-2851 @automated @market_br
    Scenario: [brazil] Registration - Continue button is disabled when Last Name is not entered brazil
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "Title" in the "Titles" field
        Then I Enter the "First_Name" in the "First_Name" field
        And I press 'TAB'
        When I Enter the "Email" in the "Email" field
        Then I should see an error "SURNAME_NAME_VALIDATION_MESSAGE" below the "Last_Name" field
        Then I should see that "Continue" Button is disabled

#    BRAZIL market only
    @GRV-2851 @automated @market_br
    Scenario: [brazil] Registration - Continue button is disabled when Email is not entered brazil
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "Title" in the "Titles" field
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        And I press 'TAB'
        Then I should see an error "EMAIL_NOT_ENTERED_VALIDATION_MESSAGE" below the "Email" field
        Then I should see that "Continue" Button is disabled

