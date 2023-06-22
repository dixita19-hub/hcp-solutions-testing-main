@GRV-2788 @GRV-2798
Feature: Forgot Password - Request New password screen
    As a registered user that is on the forgot password form
    I need to have a guided flow to request request new password
    So that I understand I need to type my correct email address in order to request a new password

    @automated @GRV-2789 @GRV-2802 @GRV-2801
    Scenario: Request new password button is disabled until email address is entered
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then I click on "Forgot_Password" link
        When I am on "Forgot_Password" Form
        Then I should see that "Request_New_Password" Button is disabled


    @automated @GRV-2790 @GRV-2802 @GRV-2801
    Scenario Outline: Request new password button is disabled when invalid email address is entered
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then I click on "Forgot_Password" link
        Then I am on "Forgot_Password" Form
        When I enter an <email> in "Email" field not as per the regex
        Then I should see an error "EMAIL_NOT_VALID_ERROR" below the "Email" field
        Then I should see that "Request_New_Password" Button is disabled
        Examples:
        |   email               |
        |   test                |
        |   test@test           |
        |   test@test,com       |
        |   test@test..com      |
        |   test@test.co.       |

    @automated @GRV-2791 @GRV-2802 @GRV-2801
    Scenario Outline: Request new password button is enabled when valid email address is entered
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then I click on "Forgot_Password" link
        Then I am on "Forgot_Password" Form
        When I enter an <email> in "Email" field as per the regex
        Then I should see that "Request_New_Password" Button is enabled
        Examples:
        |   email                   |
        |   test@test.com           |
        |   test@test.co.uk         |
        |   test@test.org           |
        |   test@test-user.com      |
        |   test@test.org           |


    @GRV-2799 @GRV-2802 @GRV-2801
    Scenario: User should be on reset password form when clicked on reset password link in an email
        Given I am a registered user
        Then I have received a "Reset_Password" Email
        When I click on "Reset_Password" link
        Then I should land on "reset_Password" form
        Then I should see "Password" field
        Then I should see "Confirm_Password" field
        Then I should see password validation text
        Then I should see "Email_Consent" checkbox "Unchecked"
        Then I should see "Self_Certification" checkbox "Unchecked"
        Then I should see "Reset_Password" Button is disabled

    @automated @GRV-2792
    Scenario: Error when new password request is made for an unregistered Email
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then I click on "Forgot_Password" link
        Then I am on "Forgot_Password" Form
        When I enter an "VALID_UNREGISTERED_EMAIL" in the "Email" field as per the regex
        When I click on "Request_New_Password" Button
        Then I should see an error "NO_ACCOUNT_FOUND_ERROR" below the "Email" field
        Then I should see that "Request_New_Password" Button is disabled

    @GRV-2793
    Scenario: New password request is made for an Valid Registered Email - Successful screen
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then I click on "Forgot_Password" link
        Then I am on "Forgot_Password" Form
        When I enter an "Valid_Registered_Email" in "Email" field as per the regex
        Then I should see that "Request_New_Password" Button is enabled
        When I click on "Request_New_Password" Button
        Then I should be navigated to the "Successful_Password_Request" page which display "SUCCESSFUL_PASSWORD_EMAIL_SENT_TEXT"

    @WIP @GRV-2793
    Scenario: New password request Email - Reset Password Clicked
        Given I have requested for my password reset
        Then I should be navigated to the "Successful_Password_Request" page which display "SUCCESSFUL_PASSWORD_EMAIL_SENT_TEXT"
        Then I should have received an Email to my registered Email address
        Then Email should have the "Reset Password" button
        When I click on the "Reset Password" button
        Then I should be on the "Reset Password" Screen


    @WIP @GRV-2793
    Scenario: New password request Email - Reset Password link used in the browser tab
        Given I have requested for my password reset
        Then I should be navigated to the "Successful_Password_Request" page which display "SUCCESSFUL_PASSWORD_EMAIL_SENT_TEXT"
        Then I should have received an Email to my registered Email address
        Then Email should have the "Reset Password" link
        When I copy and paste the link in to a browser address bar
        Then I click on go or equivalent action
        Then I should be on the "Reset Password" Screen

    @GRV-2845 @wip
    Scenario: Password Reset - Password criteria should be unfulfilled for failed criteria - No Uppercase letter
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_NO_UPPERCASE_LETTER" in the "Password" field
        Then I should see the following "Between 8 and 20 characters" highlighted with blue color
        Then I should see the following "Contains a lowercase letter" highlighted with blue color
        Then I should see the following "Contains a number" highlighted with blue color
        Then I should see the following "Does not contain first name, last name or email address" highlighted with blue color
        Then I should see the following "Contains an uppercase letter" highlighted with red color


    @GRV-2845 @wip
    Scenario: Password Reset - Password criteria should be unfulfilled for failed criteria - No Lowercase letter
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_NO_LOWERCASE_CHARACTER" in the "Password" field
        Then I should see the following "Between 8 and 20 characters" highlighted with blue color
        Then I should see the following "Contains an uppercase letter" highlighted with blue color
        Then I should see the following "Contains a number" highlighted with blue color
        Then I should see the following "Does not contain first name, last name or email address" highlighted with blue color
        Then I should see the following "Contains a lowercase letter" highlighted with red color


    @GRV-2845 @wip
    Scenario: Password Reset - Password criteria should be unfulfilled for failed criteria - No numbers
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_NO_NUMBER" in the "Password" field
        Then I should see the following "Between 8 and 20 characters" highlighted with blue color
        Then I should see the following "Contains an uppercase letter" highlighted with blue color
        Then I should see the following "Contains a lowercase letter" highlighted with blue color
        Then I should see the following "Does not contain first name, last name or email address" highlighted with blue color
        Then I should see the following "Contains a number" highlighted with red color


    @GRV-2845 @wip
    Scenario: Password Reset - Password criteria should be unfulfilled for failed criteria - No uppercase and lowercase
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_NO_LOWERCASE_UPPERCASE_CHARACTER" in the "Password" field
        Then I should see the following "Between 8 and 20 characters" highlighted with blue color
        Then I should see the following "Does not contain first name, last name or email address" highlighted with blue color
        Then I should see the following "Contains a number" highlighted with blue color
        Then I should see the following "Contains an uppercase letter" highlighted with red color
        Then I should see the following "Contains a lowercase letter" highlighted with red color


    @GRV-2845 @wip
    Scenario: Password Reset - Password criteria should be unfulfilled for failed criteria - less than 8 characters
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_LESS_THAN_EIGHT_CHARACTERS" in the "Password" field
        Then I should see the following "Between 8 and 20 characters" highlighted with red color
        Then I should see the following "Does not contain first name, last name or email address" highlighted with blue color
        Then I should see the following "Contains a number" highlighted with blue color
        Then I should see the following "Contains an uppercase letter" highlighted with blue color
        Then I should see the following "Contains a lowercase letter" highlighted with blue color


    @GRV-2845 @wip
    Scenario: Password Reset - Password criteria should be unfulfilled for failed criteria - more than 20 characters
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_MORE_THAN_TWENTY_CHARACTERS" in the "Password" field
        Then I should see the following "Between 8 and 20 characters" highlighted with red color
        Then I should see the following "Does not contain first name, last name or email address" highlighted with blue color
        Then I should see the following "Contains a number" highlighted with blue color
        Then I should see the following "Contains an uppercase letter" highlighted with blue color
        Then I should see the following "Contains a lowercase letter" highlighted with blue color


    @GRV-2845 @wip
    Scenario: Password Reset - Password criteria should be all blue - password satisfies all the criteria
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_ALL_CRITERIA_PASSED" in the "Password" field
        Then I should see the following "Between 8 and 20 characters" highlighted with blue color
        Then I should see the following "Does not contain first name, last name or email address" highlighted with blue color
        Then I should see the following "Contains a number" highlighted with blue color
        Then I should see the following "Contains an uppercase letter" highlighted with blue color
        Then I should see the following "Contains a lowercase letter" highlighted with blue color

     @GRV-2845 @wip
    Scenario: Password Reset - Successful Password reset
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        When I am on "Step_3" of the "Registration_Form"
        When I Enter the "PASSWORD_WITH_ALL_CRITERIA_PASSED" in the "Password" field
        Then I should see the following "Between 8 and 20 characters" highlighted with blue color
        Then I should see the following "Does not contain first name, last name or email address" highlighted with blue color
        Then I should see the following "Contains a number" highlighted with blue color
        Then I should see the following "Contains an uppercase letter" highlighted with blue color
        Then I should see the following "Contains a lowercase letter" highlighted with blue color
        When I click on the "Request new Password" button
        Then I should be on the "Password_Reset_Successful" Screen


    @GRV-2802
    Scenario: Request new password button is disabled until email address is entered - Mobile
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then I click on "Forgot_Password" link
        When I am on "Forgot_Password" Form
        Then I should see that "Request_New_Password" Button is disabled


    @GRV-2802
    Scenario Outline: Request new password button is disabled until valid email address is entered  - Mobile
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then I click on "Forgot_Password" link
        Then I am on "Forgot_Password" Form
        When I enter an <email> in "Email" field not as per the regex
        Then I should see an error "EMAIL_NOT_VALID_ERROR" below the "Email" field
        Then I should see that "Request_New_Password" Button is disabled
        Examples:
        |   email               |
        |   test                |
        |   test@test           |
        |   test@test,com       |
        |   test@test..com      |
        |   test@test.co.       |

    @GRV-2802
    Scenario Outline: Request new password button is enabled when valid email address is entered  - Mobile
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then I click on "Forgot_Password" link
        Then I am on "Forgot_Password" Form
        When I enter an <email> in "Email" field as per the regex
        Then I should see an error "EMAIL_NOT_VALID_ERROR" below the "Email" field
        Then I should see that "Request_New_Password" Button is enabled
        Examples:
        |   email                   |
        |   test@test.com           |
        |   test@test.co.uk         |
        |   test@test.org           |
        |   test@test-user.com      |
        |   test@test.org           |


    @GRV-2802
    Scenario: User should be on reset password form when clicked on reset password link in an email  - Mobile
        Given I am a registered user
        Then I have received a "Reset_Password" Email
        When I click on "Reset_Password" link
        Then I should land on "reset_Password" form
        Then I should see "Password" field
        Then I should see "Confirm_Password" field
        Then I should see password validation text
        Then I should see "Email_Consent" checkbox "Unchecked"
        Then I should see "Self_Certification" checkbox "Unchecked"
        Then I should see "Reset_Password" Button is disabled


    @GRV-2802
    Scenario: Successful Forgot password screen - Mobile
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then I click on "Forgot_Password" link
        Then I am on "Forgot_Password" Form
        When I enter an "Valid_Registered_Email" in "Email" field as per the regex
        Then I should see that "Request_New_Password" Button is enabled
        When I click on "Request_New_Password" Button
        Then I should be navigated to the "Successful_Password_Request" page which display "FORGOT_PASSWORD_SUCCESSFUL_TEXT"

    @GRV-2802
    Scenario: Error when new password request is made for an unregistered Email - Mobile
        Given I am an anonymous user
        Then I am on the "LOGIN" Form
        Then I click on "Forgot_Password" link
        Then I am on "Forgot_Password" Form
        When I enter an "Valid_Unregistered_Email" in "Email" field as per the regex
        Then I should see an error "NO_ACCOUNT_FOUND_ERROR" below the "Email" field
        Then I should see that "Request_New_Password" Button is disabled

    @GRV-2810
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - No Uppercase letter
        Given I am an anonymous user
        Then I am on "password_Reset" screen
        When I Enter the "PASSWORD_WITH_NO_UPPERCASE_LETTER" in the "Password" field
        Then I should see the following password hints ticked and red in color:
            | Between 8 and 20 characters |
            | Contains a lowercase letter |
            | Contains a number           |
        Then I should see the following password hits not ticked and blue in color:
            | Contains an uppercase letter |
            | Does not contain first name, last name or email address |

    @GRV-2810
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - No Lowercase letter
        Given I am an anonymous user
        Then I am on "password_Reset" screen
        When I Enter the "PASSWORD_WITH_NO_LOWERCASE_CHARACTER" in the "Password" field
        Then I should see following password hints ticked and red in color:
            | Between 8 and 20 characters  |
            | Contains an uppercase letter |
            | Contains a number            |
        Then I should see the following password hits not ticked and blue in color:
            | Contains a lowercase letter |
            | Does not contain first name, last name or email address |

   @GRV-2810
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - No numbers
        Given I am an anonymous user
        Then I am on "password_Reset" screen
        When I Enter the "PASSWORD_WITH_NO_NUMBER" in the "Password" field
        Then I should see following password hints ticked and red in color:
            | Between 8 and 20 characters  |
            | Contains an uppercase letter |
            | Contains a lowercase letter  |
        Then I should see the following password hits not ticked and blue in color:
            | Contains a number |
            | Does not contain first name, last name or email address |

    @GRV-2800 @GRV-2810
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - No uppercase and lowercase
        Given I am an anonymous user
        Then I am on "password_Reset" screen
        When I Enter the "PASSWORD_WITH_NO_LOWERCASE_UPPERCASE_CHARACTER" in the "Password" field
        Then I should see following password hints ticked and red in color:
            | Between 8 and 20 characters |
            | Contains a number           |
        Then I should see the following password hits not ticked and blue in color:
            | Contains an uppercase letter |
            | Contains a lowercase letter  |
            | Does not contain first name, last name or email address|

    @GRV-2800 @GRV-2810
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - less than 8 characters
        Given I am an anonymous user
        Then I am on "password_Reset" screen
        When I Enter the "PASSWORD_WITH_LESS_THAN_EIGHT_CHARACTERS" in the "Password" field
        Then I should see following password hints ticked and red in color:
            | Contains an uppercase letter |
            | Contains a lowercase letter  |
            | Contains a number            |
        Then I should see the following password hits not ticked and blue in color:
            | Between 8 and 20 characters |
            | Does not contain first name, last name or email address|

    @GRV-2800 @GRV-2810
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - more than 20 characters
        Given I am an anonymous user
        Then I am on "password_Reset" screen
        When I Enter the "PASSWORD_WITH_MORE_THAN_TWENTY_CHARACTERS" in the "Password" field
        Then I should see following password hints ticked and red in color:
            | Contains an uppercase letter |
            | Contains a lowercase letter  |
            | Contains a number            |
        Then I should see the following password hits not ticked and blue in color:
            | Between 8 and 20 characters |
            | Does not contain first name, last name or email address|

    @GRV-2800 @GRV-2810
    Scenario: Registration - Password criteria should be unfulfilled for failed criteria - more than 20 characters
        Given I am an anonymous user
        Then I am on "password_Reset" screen
        When I Enter the "PASSWORD_WITH_ALL_CRITERIA_PASSED" in the "Password" field
        Then I should see following password hints ticked and red in color:
            | Contains an uppercase letter |
            | Contains a lowercase letter  |
            | Contains a number            |
            | Between 8 and 20 characters  |
            | Does not contain first name, last name or email address|

    @GRV-2803 @GRV-2804
    Scenario: Reset password Screen -  password and confirm password screen
        Given I am an anonymous user
        When I am on "password_Reset" screen
        Then I should see the "Password" and "Confirm_Password" fields

    @GRV-2803 @GRV-2804 @GRV-2805
    Scenario: Reset password Screen -  Continue button disabled
        Given I am an anonymous user
        When I am on "password_Reset" screen
        Then I should see the "Password" and "Confirm_Password" fields
        Then I should see the "Reset Password" Button disabled

    @GRV-2803 @GRV-2804
    Scenario: Reset password Screen -   password hints are in red color
        Given I am an anonymous user
        When I am on "password_Reset" screen
        Then I should see following password hints ticked and red in color:
            | Contains an uppercase letter |
            | Contains a lowercase letter  |
            | Contains a number            |
            | Between 8 and 20 characters  |
       Then I should see following password hints ticked and blue in color:
            | Does not contain first name, last name or email address|

    @GRV-2803 @GRV-2804
    Scenario: Reset password Screen -  Title
        Given I am an anonymous user
        When I am on "password_Reset" screen
        Then I should see the title of the screen as "Reset Password"

    @GRV-2803 @GRV-2804
    Scenario: Reset password Screen -  password field visibility
        Given I am an anonymous user
        Then I am on "password_Reset" screen
        Then I enter a "Password" into "password" field
        When I toggle the show password icon
        Then I should be able to see the entered "Password"

    @GRV-2803 @GRV-2804
    Scenario: Reset password Screen -  confirm password field visibility
        Given I am an anonymous user
        Then I am on "password_Reset" screen
        Then I enter a "Password" into "confirm_password" field
        When I toggle the show password icon
        Then I should be able to see the entered "Password"


    @GRV-2811 @GRV-2811
    Scenario: Reset password Screen -  password field visibility
        Given I am an anonymous user
        Then I am on "password_Reset" screen
        Then I enter a "Password" into "password" field
        When I enter a "SAME_PASSWORD_APSSWORD_FIELD" into "confirm_Password" field
        Then I should see following password hints ticked and blue in color:
            | Passwords match|
        Then I should see the "Reset Password" button is "enabled"

