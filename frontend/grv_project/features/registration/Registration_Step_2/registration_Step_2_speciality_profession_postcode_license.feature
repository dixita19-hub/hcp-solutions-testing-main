@GRV-2890 @GRV-2982
Feature: Registration - Step 2 of the registration form
    As an anonymous user
    I am on the registration form
    I want to be able to register successfully

    @GRV-2852 @automated
    Scenario: Registration - Continue button disabled on landing on Step 2 of the registration field
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        Then I Enter the "Email" in the "Email" field
        And I press 'TAB'
        Then I should see that "Continue" Button is enabled
        Then I click on "Continue" Button
        Then I am on "Step_2" of the "Registration_Form"
        Then I should see that "Continue" Button is disabled

    @GRV-2852 @automated @market_us_stg
    Scenario: Registration - Continue button disabled on landing on Step 2 of the registration field
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I Enter the "First_Name" in the "First_Name" field
        Then I Enter the "Last_Name" in the "Last_Name" field
        Then I Enter the "Email" in the "Email" field
        And I press 'TAB'
        Then I should see that "Continue" Button is enabled
        Then I click on "Continue" Button
        Then I am on "Step_2" of the "Registration_Form" of us market
        Then I should see that "Continue" Button is enabled

    @GRV-2853 @automated
    Scenario: Registration - Continue button is enabled when all fields are filled on Step 2
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Consultant" in the "Profession" field
        Then I Select the "Allergy" in the "Speciality_1" field
        Then I Select the "Asthma" in the "Speciality_2" field
        Then I Enter the "VALID_POSTCODE" in the "Postcode" field
        Then I Enter the "VALID_LICENSE" in the "License" field
        Then I should see that "Continue" Button is enabled

    @GRV-2853 @automated
    Scenario: Registration - Continue button is enabled when all mandatory fields are filled on Step 2
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Consultant" in the "Profession" field
        Then I Select the "Allergy" in the "Speciality_1" field
        Then I Enter the "VALID_POSTCODE" in the "Postcode" field
        Then I Enter the "VALID_LICENSE" in the "License" field
        Then I should see that "Continue" Button is enabled

    @GRV-2855 @automated
    Scenario: Registration - Continue button is disabled when mandatory fields are not filled - No Speciality 1
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Consultant" in the "Profession" field
        Then I Open and close "Speciality_1" field
        Then I Enter the "VALID_POSTCODE" in the "Postcode" field
        Then I Enter the "VALID_LICENSE" in the "License" field
        Then I should see that "Continue" Button is disabled
        Then I should see an error "SPECIALITY_REQUIRED_ERROR" below the "Speciality_1" field

    @GRV-2855 @automated
    Scenario: Registration - Continue button is disabled when mandatory fields are not filled - No profession
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Open and close "Profession" field
        Then I Select the "Allergy" in the "Speciality_1" field
        Then I Enter the "VALID_POSTCODE" in the "Postcode" field
        Then I Enter the "VALID_LICENSE" in the "License" field
        Then I should see that "Continue" Button is disabled
        Then I should see an error "PROFESSION_REQUIRED_ERROR" below the "Profession" field

    @GRV-2855 @automated
    Scenario: Registration - Continue button is disabled when mandatory fields are not filled - No Postcode
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Consultant" in the "Profession" field
        Then I Select the "Allergy" in the "Speciality_1" field
        Then I Select the "Asthma" in the "Speciality_2" field
        Then I Skip and Dont fill anything in Postcode input
        Then I Enter the "VALID_LICENSE" in the "License" field
        Then I should see that "Continue" Button is disabled
        Then I should see an error "POSTCODE_REQUIRED_ERROR" below the "Postcode" field

    @GRV-2855 @automated
    Scenario: Registration - Continue button is diabled when mandatory fields are not filled - No License
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Consultant" in the "Profession" field
        Then I Select the "Allergy" in the "Speciality_1" field
        Then I Select the "Asthma" in the "Speciality_2" field
        Then I Skip and Dont fill anything in License input
        Then I Enter the "VALID_POSTCODE" in the "Postcode" field
        Then I should see that "Continue" Button is disabled
        Then I should see an error "LICENSE_REQUIRED_ERROR" below the "License" field


    @GRV-2865 @automated @market_us_stg
    Scenario: Registration - User lands on Base webpage when close button is clicked on step 2
        Given I am an anonymous user
        Then I go to "Step_2" of the "Registration_Form" of us market
        Then I am on "Step_2" of the "Registration_Form" of us market
        Then I click on "Close" Button
        Then I should be on the Base webpage

    @GRV-2872 @automated @market_us_stg
    Scenario: Registration - User lands on Step 1 when the back button is clicked on Step 2
        Given I am an anonymous user
        Then I go to "Step_2" of the "Registration_Form" of us market
        Then I am on "Step_2" of the "Registration_Form" of us market
        Then I click on "Back" Button
        Then I am redirected back on "Step_1" of the "Registration" Form

    @GRV-2873 @automated @market_us_stg
    Scenario: Registration - User lands on Step 1 when the clicked on the Step 1 button on navigation indicator bar
        Given I am an anonymous user
        Then I go to "Step_2" of the "Registration_Form" of us market
        Then I am on "Step_2" of the "Registration_Form" of us market
        Then I click on "Step_1" Button on the navigation indicator bar
        Then I am redirected back on "Step_1" of the "Registration" Form

    @GRV-2868 @automated
    Scenario: Registration - Registration - User clicks on Continue button on Step 2 to land on Step 3 of the registration form
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Consultant" in the "Profession" field
        Then I Select the "Allergy" in the "Speciality_1" field
        Then I Select the "Asthma" in the "Speciality_2" field
        Then I Enter the "VALID_POSTCODE" in the "Postcode" field
        Then I Enter the "VALID_LICENSE" in the "License" field
        Then I should see that "Continue" Button is enabled
        Then I click on "Continue" Button
        Then I am on "Step_3" of the "Registration_Form"


    @GRV-2868 @automated @market_us_stg
    Scenario: Registration - Registration - User clicks on Continue button on Step 2 to land on Step 3 of the registration form for US Market
        Given I am an anonymous user
        Then I go to "Step_2" of the "Registration_Form" of us market
        Then I am on "Step_2" of the "Registration_Form" of us market
        Then I Select the "DEA" in the "License Number" field
        Then I Enter the "DEA_NUMBER" in the "DEA_Number" field
        Then I press 'TAB'
        Then I click on "Continue" Button on page 2
        Then I am on "Step_3" of the "Registration_Form" of us market

    @GRV-2836 @automated
    Scenario Outline: Registration - Postcode should show an error if the entered postcode fails the regex
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I enter an <Postcode> in "Postcode" field not as per the regex
        Then I Skip and Dont fill anything in License input
        Then I should see an error "ENTER_VALID_POSTCODE" below the "Postcode" input
        Examples:
            | Postcode |
            | MK8      |
            | MK8 @AB  |
            | HA8 D3P  |
            | HA8 ABC  |
            | ABC 123  |
            | W5 ET    |
            | HA8 DP3  |
            | 8HA 3DP  |

    @GRV-2837 @automated
    Scenario Outline: Registration - Postcode should be set as Alpha Numeric characters
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Consultant" in the "Profession" field
        Then I Select the "Allergy" in the "Speciality_1" field
        Then I Select the "Asthma" in the "Speciality_2" field
        Then I enter an <Postcode> in "Postcode" field not as per the regex
        Then I Enter the "VALID_LICENSE" in the "License" field
        Then I should see that "Continue" Button is enabled
        Examples:
            | Postcode |
            | MK8 9DA  |
            | W5 2ET   |
            | W1A 0AX  |
            | W1A0AX   |
            | MK8 8DH  |


    @GRV-2833 @automated
    Scenario Outline: Registration - License field should show an error if the entered License number fails the regex
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I enter an <License_Number_Less_than_Seven_Chars> in "License" field
        Then I Skip and Dont fill anything in Postcode input
        Then I should see an error "LICENSE_NUMBER_CANNOT_BE_LESS_THAN_SEVEN_CHARACTERS" below the "License" field
        Examples:
            | License_Number_Less_than_Seven_Chars |
            | 1                                    |
            | 123                                  |
            | 123456                               |
            | ABC                                  |
            | ABCDEF                               |
            | ABC123                               |
            | AB12                                 |
            | 1AB                                  |

    @GRV-2833 @automated
    Scenario Outline: Registration - License field should show an error if the entered License number fails the regex
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I enter an <License_Number_More_than_Twelve_Chars> in "License" field
        Then I Skip and Dont fill anything in Postcode input
        Then I should see an error "LICENSE_NUMBER_CANNOT_BE_MORE_THAN_TWELVE_CHARACTERS" below the "License" field
        Examples:
            | License_Number_More_than_Twelve_Chars |
            | 1234567890123                         |
            | 123456789012345                       |
            | 123456ABCDEFG                         |
            | ABCDEFG123456789                      |
            | 1234ABCDEFGH12                        |
            | 123456ABCDEFGH                        |
            | ABCDEFG1234HG                         |

    @GRV-2914 @automated
    Scenario Outline: Registration - License field should accept valid aplha Numeric characters only
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I enter an <Valid_Aplha_Numeric_License_Number> in "License" field
        Then I Skip and Dont fill anything in Postcode input
        # modified this step as it is positive scenario
        #Then I should see an error "LICENSE_NUMBER_CANNOT_BE_MORE_THAN_TWELVE_CHARACTERS" below the "License" field
        Then I see input is accepted and no LICENSE validation errors appear
        Examples:
            | Valid_Aplha_Numeric_License_Number |
            | 123456789012                       |
            | 12345678                           |
            | 1234567890                         |
            | ABCD1234567                        |
            | 123456ABCDEF                       |
            | 123ABC123ABC                       |
            | 123ABC                             |
            | 987DFEHJK12                        |

    @GRV-2854 @automated
    Scenario: Registration - Continue button is disabled when invalid values are filled on Step 2 - postcode
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Consultant" in the "Profession" field
        Then I Select the "Allergy" in the "Speciality_1" field
        Then I Enter the "INVALID_POSTCODE" in the "Postcode" field
        Then I Enter the "VALID_LICENSE" in the "License" field
        Then I should see that "Continue" Button is disabled
        #Then I should see an error "POSTCODE_REQUIRED_ERROR" below the "Postcode" field
        Then I should see an error "ENTER_VALID_POSTCODE" below the "Postcode" input

    @GRV-2854 @automated
    Scenario: Registration - Continue button is disabled when invalid values are filled on Step 2 - License
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Consultant" in the "Profession" field
        Then I Select the "Allergy" in the "Speciality_1" field
        Then I Enter the "INVALID_LICENSE_MORE_THAN_TWELVE_CHARACTERS" in the "License" field
        Then I Enter the "VALID_POSTCODE" in the "Postcode" field
        Then I should see that "Continue" Button is disabled
        Then I should see an error "LICENSE_NUMBER_CANNOT_BE_MORE_THAN_TWELVE_CHARACTERS" below the "License" field

    @GRV-2913 @automated
    Scenario: Registration - USer should see havering hint over the license field
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I hover over the "License" field
        Then I should see the hint "Alliance Healthcare Account number"

    # brazil
    @GRV-2853 @automated @market_br
    Scenario: [brazil] Registration - Continue button is enabled when all fields are filled on Step 2 Brazil
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Profession" in the "Profession" field
        Then I Select the "Speciality" in the "Speciality" field
        Then I Select the "State_of_registration" in the "State_of_registration" field
        Then I Enter the "VALID_LICENSE_FOR_BRAZIL" in the "License" field
        Then I should see that "Continue" Button is enabled

    # brazil
    @GRV-2855 @automated @market_br
    Scenario: Registration - Continue button is disabled when mandatory fields are not filled - No Profession Brazil
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Speciality" in the "Speciality" field
        Then I Select the "State_of_registration" in the "State_of_registration" field
        Then I Enter the "VALID_LICENSE_FOR_BRAZIL" in the "License" field
        Then I should see that "Continue" Button is disabled
        Then Then I should see an error "PROFESSION_REQUIRED_ERROR" error below the "Profession" field

    # brazil
    @GRV-2855 @automated @market_br
    Scenario: Registration - Continue button is disabled when mandatory fields are not filled - No Speciality Brazil
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Profession" in the "Profession" field
        Then I Select the "State_of_registration" in the "State_of_registration" field
        Then I Enter the "VALID_LICENSE_FOR_BRAZIL" in the "License" field
        Then I should see that "Continue" Button is disabled
        Then I should see an error "SPECIALITY_ONE_REQUIRED_ERROR" error below the "Speciality" field

    # brazil
    @GRV-2855 @automated @market_br
    Scenario: Registration - Continue button is disabled when mandatory fields are not filled - No State of Registration Brazil
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Profession" in the "Profession" field
        Then I Select the "Speciality" in the "Speciality" field
        Then I Enter the "VALID_LICENSE_FOR_BRAZIL" in the "License" field
        Then I should see that "Continue" Button is disabled
        Then I should see an error "STATE_OF_REGISTRATION_REQUIRED_ERROR" error below the "State_of_registration" field

    # brazil
   @GRV-2855 @automated @market_br
    Scenario: Registration - Continue button is disabled when mandatory fields are not filled - No License Brazil
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the "Profession" in the "Proffession" field
        Then I Select the "Speciality" in the "Speciality" field
        Then I Select the "State_of_registration" in the "State_of_registration" field
        Then I should see that "Continue" Button is disabled
        Then I should see an error "LICENSE_REQUIRED_ERROR" below the "License" field

    # brazil
    @GRV-2855 @automated @market_br
    Scenario Outline: Registration - Profession field selection sepcilaity and state of registration values
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I Select the <profession> in the "Profession" field
        Then I should see the <Speciality> in the "Speciality" field
        Then I should see the "<State_of_registration>" in the "State_of_registration" field
        Examples:
        |   profession            |   Speciality        |   State_of_registration       |
        |   Dentista              |   Não se Aplica     |   Estado de Registro *        |
        |   Cirurgião Dentista    |   Não se Aplica     |   Estado de Registro *        |
        |   Médico                |   Especialidade *   |   Estado de Registro *        |
        |   Farmacêutico          |   Não se Aplica     |   Estado de Registro *        |
        |   Funcionário Pfizer    |   Não se Aplica     |   Não se Aplica               |
        |   Médico Residente      |   Especialidade *   |   Estado de Registro *        |

    # brazil
    @GRV-2855 @automated @market_br
    Scenario: Registration - Help Required hyperlink
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I should see the "HELP_REQUIRED" tooltip at the bottom of the screen

    # brazil
    @GRV-2833 @automated @market_br
    Scenario Outline: Registration - License field should show an error if the entered License number exceeds 8 digits
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I enter an <License_Number_More_than_seven_Chars> in "License" field
        Then I should see an error "LICENSE_NUMBER_CANNOT_BE_MORE_THAN_SEVEN_CHARACTERS" below the "License" field
        Examples:
            | License_Number_More_than_seven_Chars |
            | 012345678                             |
            | dasd1234                              |

    # brazil
    @GRV-2833 @automated @market_br
    Scenario Outline: Registration - License field should accept less than 7 characters and prepend with 0 if less than 7 characters
        Given I am an anonymous user
        Then I am on "Step_2" of the "Registration_Form"
        Then I enter an <License_Number_less_than_seven_Chars> in "License" field
        Then I click outside the "License" field
        Then I should see  <License_Number_prepended_with_zero_to_make_seven_characters> in the "License" field
        Examples:
            | License_Number_less_than_seven_Chars   |  License_Number_prepended_with_zero_to_make_seven_characters |
            | 1                                      |  0000001                                                     |
            | 0001                                   |  0000001                                                     |
            | 12                                     |  0000012                                                     |
            | 123                                    |  0000123                                                     |
            | 1234                                   |  0001234                                                     |
            | 45678                                  |  0045678                                                     |
            | 1234567                                |  1234567                                                     |
            | 123456                                 |  0123456                                                     |

    # brazil
    @market_br
    Scenario: Registration - Static Text on the registration form
        Given I am an anonymous user
        Then I am on "Step_1" of the "Registration" Form
        Then I should see static text "STEP_2_STATIC_TEXT" in step_1 of the registration form


