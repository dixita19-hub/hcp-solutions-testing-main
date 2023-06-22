@nondestructive @homepage_uk @ukabove
Feature: UK Galaxy Automated Regression - PfizerPro Home page

    Background:
        Given I am on the page '/'
        And Browser is maximized
        And The title is 'Home | PfizerPro UK'

    @TR-C205305 @automated @regression @prio1
    Scenario: GDPR prompt is displayed after accepting cookies
        Then I expect that element 'UKAbove > gdpr_prompt' is displayed

    @TR-C205304 @automated @regression @prio1
    Scenario: Masthead is displayed in home page
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'UKAbove > mast_head' is displayed
        Then The trimmed text on element 'UKAbove > mast_head' is 'This site contains promotional information intended only for healthcare professionals resident in the United Kingdom'

    @TR-C205303 @automated @regression @prio1
    Scenario: Menu items displayed in home page
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'UKAbove > mast_head' is displayed
        Then I expect element 'UKAbove > top_menu_items' has items:
            | Pfizer Medicines | Therapy Areas | Explore Content | Let's Connect | Stock Hub |

    @TR-C205302 @automated @regression @prio1
    Scenario: Sign-in button is displayed in home page
        When I click on element 'UKAbove > hcp_confirmation_yes'
        Then I expect that element 'UKAbove > signin_button' is displayed

    @TR-C205301 @automated @regression @prio1
    Scenario: Search icon is displayed in home page
        When I click on element 'UKAbove > hcp_confirmation_yes'
        Then I expect that element 'UKAbove > search_icon' is displayed

    @TR-C205300 @automated @regression @prio1
    Scenario: Adverse Event heading is displayed on Home page
        When I click on element 'UKAbove > hcp_confirmation_yes'
        Then I expect that element 'UKAbove > adverse_event_heading' is displayed

    @TR-C205299 @automated @regression @prio1
    Scenario: "Welcome to PfizerPro" heading is displayed on uk site home page
        When I click on element 'UKAbove > hcp_confirmation_yes'
        Then I expect that element 'Common > heading' is displayed

    @TR-C205298 @automated @regression @prio1
    Scenario: Home banner is displayed on page
        When I click on element 'UKAbove > hcp_confirmation_yes'
        Then I expect that element 'Common > home_banner' is displayed

    @TR-C205297 @automated @regression @prio1
    Scenario: Order, Patient Assistance, Pfizer Medical cards are displayed
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'UKAbove > card_items_section' is displayed
        And I scroll to element 'UKAbove > card_items_section'
        And The element 'UKAbove > mast_head' is displayed
        Then I expect element 'UKAbove > card_items' has items:
            | Pfizer Medicines | Explore Content | Therapy Areas |

    @TR-C205296 @automated @regression @prio1
    Scenario: Ask A Question card is displayed in home page
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'UKAbove > ask_a_question_section' is displayed
        And I scroll to element 'UKAbove > ask_a_question_section'
        Then I expect that element 'UKAbove > ask_a_question_card' is displayed

    @TR-C205295 @automated @regression @prio1
    Scenario: Footer is displayed with any text
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'Common > footer' is displayed
        And I scroll to element 'Common > footer'
        Then The element 'Common > footer' contains any text

    @TR-C205294 @automated @regression @prio1
    Scenario: Sign In Or Register button is displayed in footer on Home page
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'Common > footer' is displayed
        And I scroll to element 'Common > footer'
        Then I expect that element 'UKAbove > signin_register_button' is displayed

    @TR-C205293 @automated @regression @prio1
    Scenario: Adverse Event footer details with email id and contact number are displayed in footer
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'Common > footer' is displayed
        And I scroll to element 'Common > footer'
        Then I expect that element 'UKAbove > adverse_event_footer' is displayed
        Then I expect that element 'UKAbove > adverse_event_email_id' is displayed
        Then I expect that element 'UKAbove > adverse_event_contact_number' is displayed

    @TR-C205292 @automated @regression @prio1
    Scenario: Explore Footer section with link items are displayed in Home page
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'Common > footer' is displayed
        And I scroll to element 'Common > footer'
        Then I expect element 'UKAbove > footer_link_items' has items:
            | Report Adverse Events | Terms of Use | Privacy Policy | Cookie Policy | Contact Us | Pfizer.co.uk |

    @TR-C205291 @automated @regression @prio1
    Scenario: Virtual Assistant is displayed
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'Common > virtual_assistant' is displayed
        And I move to element 'Common > virtual_assistant'
        Then I expect that element 'Common > virtual_assistant' is displayed

    @TR-C205290 @automated @regression @prio1
    Scenario: Invalid User SignIn flow
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'UKAbove > signin_button' is displayed
        And I click on element 'UKAbove > signin_button'
        And The element 'UKAbove > login > email_id' is displayed
        And I set text 'ffsd@test.com' to field 'UKAbove > login > email_id'
        And I set text 'Fdfdfd@12345' to field 'UKAbove > login > pass_phrase'
        And I press 'TAB'
        And I click on element 'UKAbove > login > log_in_button'
        And The element 'UKAbove > login > invalid_log_in_text' is displayed
        Then The element 'UKAbove > login > invalid_log_in_text' text is 'Username and password do not match. Please try again.'

    @TR-C205289 @automated @regression @prio1
    Scenario: User is able to sign in with valid user and log-out button is displayed on page
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'UKAbove > signin_button' is displayed
        And I click on element 'UKAbove > signin_button'
        And The element 'UKAbove > login > email_id' is displayed
        And I set text '{%AUT2UK%}' to field 'UKAbove > login > email_id'
        And I set text '{%AUTOPASS1%}' to field 'UKAbove > login > pass_phrase'
        And I press 'TAB'
        And I click on element 'UKAbove > login > log_in_button'
        Then I expect that element 'UKAbove > login > logout_button' is displayed

    @TR-C205288 @automated @regression @prio1
    Scenario: UKAbove - User is taken to home page after sign-in and sign-in button is not displayed
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'UKAbove > signin_button' is displayed
        And I click on element 'UKAbove > signin_button'
        And The element 'UKAbove > login > email_id' is displayed
        And I set text '{%AUT2UK%}' to field 'UKAbove > login > email_id'
        And I set text '{%AUTOPASS1%}' to field 'UKAbove > login > pass_phrase'
        And I press 'TAB'
        And I click on element 'UKAbove > login > log_in_button'
        Then I expect that the title is 'Home | PfizerPro UK'
        And I expect that element 'UKAbove > signin_button' is not displayed

    @TR-C205287 @automated @regression @prio1
    Scenario: Clicking on Log Out should take user back to home page and sign-in button is displayed
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And The element 'UKAbove > signin_button' is displayed
        And I click on element 'UKAbove > signin_button'
        And The element 'UKAbove > login > email_id' is displayed
        And I set text '{%AUT2UK%}' to field 'UKAbove > login > email_id'
        And I set text '{%AUTOPASS1%}' to field 'UKAbove > login > pass_phrase'
        And I press 'TAB'
        And I click on element 'UKAbove > login > log_in_button'
        And The element 'UKAbove > login > logout_button' is displayed
        And I click on element 'UKAbove > login > logout_button'
        Then I expect that the title is 'Home | PfizerPro UK'
        And I expect that element 'UKAbove > signin_button' is displayed

    @TR-C205286 @automated @regression @prio1
    Scenario: The primary 'Yes' button should be displayed as highlighted on consent popup
        Then I expect that element 'ConsentPageLocators > yes_button' is displayed

    @TR-C205285 @automated @regression @prio1
    Scenario: The secondary 'No' button should not be displayed as highlighted on consent popup
        Then I expect that element 'ConsentPageLocators > no_button' is displayed

    @TR-C205284 @automated @regression @prio1
    Scenario: Clicking on 'Yes' button from consent popup will re-direct user to appropriate URL
        When I click on element 'UKAbove > hcp_confirmation_yes'
        Then I expect that the title is 'Home | PfizerPro UK'

    @TR-C205283 @automated @regression @prio1
     Scenario: Clicking on 'No' button from consent popup will re-direct user to appropriate URL
        When I click on element 'ConsentPageLocators > no_button'
        Then I expect that the title is '| Pfizer UK'
