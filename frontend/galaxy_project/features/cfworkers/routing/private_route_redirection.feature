@nondestructive @pet @usabove @routing
Feature: Private routing check
    Check private routing redirection works

    Background: Set browser
        Given I am on the page '/'
        And The browser resolution is '1920' per '1080'

    @automated @TR-C357268 @private-route-redirection
    Scenario: Check private page falls back to public page
        Given I am on the page '/ask-a-question'
        Then The page url contains '?destination=%2Fask-a-question'
        When I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        When I wait until element 'USAbove > login > logout_button' becomes visible        
        Then The page url contains '/ask-a-question'
        When I wait until element 'PET > USAbove > core-feture' becomes visible
        Then The page url does not contain '?destination=%2Fask-a-question'
