@ID-of-Epic @ID-of-Story @navigation @nondestructive
Feature: Navigation
    Navigation to ComplicatedPage

    @automated
    Scenario: Opens ComplicatedPage page
        Given I navigate to 'UltimateqaAutomationPage' page
        Then 'UltimateqaAutomationPage' page is opened
        When I click on 'ComplicatedPage' link
        Then 'ComplicatedPage' page is opened


