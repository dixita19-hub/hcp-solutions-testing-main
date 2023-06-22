@nondestructive @pet @usabove @caching
Feature: Caching check
    Check caching works for routes

    Background: Set browser
        Given I am on the page '/order'

    @automated @TR-C356960 @public-caching
    Scenario: Check a public route comes from cache
        When I request to 'public' URL '/order' for caching
        Then The page should be loaded from the cache

    @automated @TR-C356961 @private-caching
    Scenario: Check a private route comes from DB
        Given I am on the page '/ask-a-question'
        When I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        When I wait until element 'USAbove > login > logout_button' becomes visible        
        When I request to 'private' URL '/ask-a-question' for caching
        When I request to 'private' URL '/ask-a-question' for caching
        Then The page should not be loaded from the cache

    @automated @TR-C356968 @404-not-cache
    Scenario: Check 404 requests are not cached
        When I request to 'public' URL '/404-page' for caching
        Then The page should not be loaded from the cache