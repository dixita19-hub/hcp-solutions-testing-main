@GRV-3039
Feature: GRV_Automated - View Profile - Navigation
    As a registered user
    I want to navigate through the account profile tabs
    So I can easily see my profile information

    @TR-C357393 @GRV-3041 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile Navigation - Close button while on the Personal Tab
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_ONE"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        When I click on "Close" button
        Then I should be on the base webpage

    @TR-C357392 @GRV-3041 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile Navigation - Close button while on the Professional Tab
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_TWO"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        When I click on "Close" button
        Then I should be on the base webpage

    #New
    @TR-C357391 @GRV-3041 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile Navigation - Close button while on the Preferences Tab
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_TWO"
        Then I am on the "View_Profile" Screen
        When I click on the "Preferences" tab
        Then I should be on the "Preferences" tab
        When I click on "Close" button
        Then I should be on the base webpage

    @TR-C357390 @GRV-3041 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile Navigation - Close button while on the Password Tab
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_THREE"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Close" button
        Then I should be on the base webpage

    @TR-C357389 @GRV-3042 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile Navigation - User should land Personal Tab when clicked on the Personal tab
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_FOUR"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab

    @TR-C357388 @GRV-3042 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile Navigation - User should land Professional Tab when clicked on the professional tab
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_FIVE"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab

        #New
    @TR-C357387 @GRV-3042 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile Navigation - User should land Preferences Tab when clicked on the Preferences tab
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_FIVE"
        Then I am on the "View_Profile" Screen
        When I click on the "Preferences" tab
        Then I should be on the "Preferences" tab

    @TR-C357386 @GRV-3042 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile Navigation - User should land Password Tab when clicked on the Password tab
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_SIX"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab


    @TR-C357385 @GRV-3043 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile Navigation - Edit button while on the Personal Tab
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_SEVEN"
        Then I am on the "View_Profile" Screen
        When I click on the "Personal" tab
        Then I should be on the "Personal" tab
        When I click on "Edit" button in "Personal" tab
        Then I should be on Edit screen of "Personal" tab

    @TR-C357384 @GRV-3043 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile Navigation - Edit button while on the Professional Tab
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_EIGHT"
        Then I am on the "View_Profile" Screen
        When I click on the "Professional" tab
        Then I should be on the "Professional" tab
        When I click on "Edit" button in "Professional" tab
        Then I should be on Edit screen of "Professional" tab

    #New
    @TR-C357383 @GRV-3043 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile Navigation - Edit button while on the Preferences Tab
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_EIGHT"
        Then I am on the "View_Profile" Screen
        When I click on the "Preferences" tab
        Then I should be on the "Preferences" tab
        When I click on "Edit" button in "Preferences" tab
        Then I should be on Edit screen of "Preferences" tab

    @TR-C357382 @GRV-3043 @automated @market_uk @market_br @done @done_br
    Scenario: View Profile Navigation - Edit button while on the Password Tab
        Given I have logged in to my account "VALID_USER_FOR_ROTATION_NINE"
        Then I am on the "View_Profile" Screen
        When I click on the "Password" tab
        Then I should be on the "Password" tab
        When I click on "Edit" button in "Password" tab
        Then I should be on Edit screen of "Password" tab