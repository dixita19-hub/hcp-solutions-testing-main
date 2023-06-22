@nondestructive @homepage_us @usabove
Feature: US Galaxy Automated Regression - PfizerPro Home page

    Background:
        Given I am on the page '/'
        And Browser is maximized
        And The title is 'Home | Pfizer For Professionals'

    @TR-C205432 @automated @regression @prio1
    Scenario: Cart icon is displayed in home page
        Then I expect that element 'USAbove > cart_icon' is displayed

    @TR-C205431 @automated @regression @prio1
    Scenario: Sign-in button is displayed in home page
        Then I expect that element 'USAbove > sign-in_button' is displayed

    @TR-C205430 @automated @regression @prio1
    Scenario: Visit pfizer medical link is displayed in home page
        Then I expect that element 'USAbove > visit_pfizer_medical_link' is displayed

    @TR-C205429 @automated @regression @prio1
    Scenario: Masthead is displayed in home page
        Then The trimmed text on element 'USAbove > masthead' is 'This site is intended for U.S. healthcare professionals.'

    @TR-C205428 @automated @regression @prio1  @demo
    Scenario: Explore content section menu item with Events, Materials, Videos items are displayed
        When The element 'Common > explore_content_menu_item' is displayed
        And I move to element 'Common > explore_content_menu_item'
        Then I expect element 'Common > menu_items' has items:
            | events | materials | video |

    @TR-C205427 @automated @regression @prio1
    Scenario: Order, Patient Assistance, Pfizer Products step down cards are displayed
        When The element 'Common > gjs_heading_section' is displayed
        And I scroll to element 'Common > gjs_heading_section'
        Then I expect element 'Common > gjs_heading' has items:
            | Order | Patient Assistance | Pfizer Medical |

    @TR-C205426 @automated @regression @prio1
    Scenario: HCP & Patient Materials, Samples & Co-Pay Cards, Vaccines, Biologics** & Hospital Products step up cards are displayed
        When The element 'Common > gjs_heading_section' is displayed
        And I scroll to element 'Common > helix-core-three-card-step-up'
        Then I expect element 'Common > helix-core-heading' has items:
            | Patient Materials | Co-Pay Cards | Hospital Products |

    @TR-C205425 @automated @regression @prio1
    Scenario: "Welcome to PfizerPro" heading is displayed on home page
        Then I expect that element 'Common > heading' is displayed

    @TR-C205424 @automated @regression @prio1
    Scenario: Home banner is displayed on page
        Then I expect that element 'Common > home_banner' is displayed

    @TR-C205423 @automated @regression @prio1
    Scenario: Pfizerpro Customer Service Section is displayed with phone number
        When I scroll to element 'USAbove > customer_service_section'
        Then I expect that element 'USAbove > customer_service_section' is displayed
        And I expect that element 'USAbove > phone_number' is displayed

    @TR-C205422 @automated @regression @prio1
    Scenario: Footer is displayed with any text
        When I scroll to element 'Common > footer'
        Then The element 'Common > footer' contains any text

    @TR-C205421 @automated @regression @prio1  @demo
    Scenario: Explore Footer section with link items are displayed
        When I scroll to element 'Common > footer'
        Then I expect element 'USAbove > link_items' has items:
            | Report Adverse Events | Terms of Use | Cookies & Privacy Policy | Contact | Pfizer.com | Patient Assistance Programs |

    @TR-C205420 @automated @regression @prio1
    Scenario: Virtual Assistant is displayed
        Then I expect that element 'Common > virtual_assistant' is displayed

    @TR-C205419 @automated @prio1
    Scenario: Invalid User SignIn flow
        When I click on element 'USAbove > sign_in'
        And The element 'USAbove > login > emailid' is displayed
        And I set text 'tester@test.com' to field 'USAbove > login > emailid'
        And I set text 'tester1234' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'USAbove > login > invalid_login_text' is displayed
        Then The element 'USAbove > login > invalid_login_text' text is 'Username and password doesnt match. Try again.'

    @TR-C205418 @automated @prio1  @demo
    Scenario: User is able to sign in with valid user
        When I click on element 'USAbove > sign_in'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        Then I expect that the title is 'Home | Pfizer For Professionals'
        Then I expect that element 'USAbove > login > logout_button' is displayed

    @TR-C205417 @automated @prio1
    Scenario: User is taken to home page after sign-in and sign-in button is not displayed
        When I click on element 'USAbove > sign_in'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'USAbove > login > logout_button' is displayed
        Then I expect that the title is 'Home | Pfizer For Professionals'
        And I expect that element 'USAbove > sign_in' is not displayed

    @TR-C205416 @automated @prio1
    Scenario: USAbove - Clicking on Log Out should take user back to home page and sign-in button is displayed
        When I click on element 'USAbove > sign_in'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'USAbove > log_out' is displayed
        And I click on element 'USAbove > log_out'
        Then I expect that the title is 'Home | Pfizer For Professionals'
        And I expect that element 'USAbove > sign_in' is displayed
