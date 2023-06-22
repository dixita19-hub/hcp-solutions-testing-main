@nondestructive @va @chatbot @usabove
Feature: Pfizer Pro Home Page - Home page automated tests

    Background:
        Given Browser is maximized
        And I am on the page '/'
        And The title is 'Home | Pfizer For Professionals'


    @001 @automated @regression
    Scenario: Virtual Assistant icon is displayed and chatbot expands on clicking the va icon
        When The element 'Common > virtual_assistant' is displayed
        And I click on item 'Common > virtual_assistant'
        And The element 'VirtualAssistantLocators > USAbove > welcome_text' is displayed
        Then The element 'VirtualAssistantLocators > USAbove > snackbar' is displayed


    @002 @automated @regression
    Scenario: Check the Virtual Assistant minimize option minimizes the chatbot
        When The element 'Common > virtual_assistant' is displayed
        And I click on item 'Common > virtual_assistant'
        And The element 'VirtualAssistantLocators > USAbove > welcome_text' is displayed
        And I click on item 'VirtualAssistantLocators > USAbove > minimize'
        Then I expect that element 'VirtualAssistantLocators > USAbove > welcome_text' is not displayed


    @003 @automated @regression
    Scenario: Virtual Assistant - Check the snack-bar menu and its option main menu
        When The element 'Common > virtual_assistant' is displayed
        And I click on item 'Common > virtual_assistant'
        And The element 'VirtualAssistantLocators > USAbove > snackbar' is displayed
        And I click on item 'VirtualAssistantLocators > USAbove > snackbar'
        Then I expect that element 'VirtualAssistantLocators > USAbove > snackbar_main_menu' is displayed
        When I click on item 'VirtualAssistantLocators > USAbove > snackbar_main_menu'
        Then I expect that element 'VirtualAssistantLocators > USAbove > main_menu_text' is displayed


    @004 @automated @regression
    Scenario: Virtual Assistant - Check the snack-bar menu and its option to end chat
        When The element 'Common > virtual_assistant' is displayed
        And I click on item 'Common > virtual_assistant'
        Then I expect that element 'VirtualAssistantLocators > USAbove > snackbar' is displayed
        When I click on item 'VirtualAssistantLocators > USAbove > snackbar'
        Then I expect that element 'VirtualAssistantLocators > USAbove > snackbar_end_chat' is displayed
        When I click on item 'VirtualAssistantLocators > USAbove > snackbar_end_chat'
        Then I expect that element 'VirtualAssistantLocators > USAbove > end_chat_text' is displayed


    @005 @automated @regression
    Scenario: Check the Virtual Assistant and chat option "Get in Touch with my Sales Rep"
        When The element 'Common > virtual_assistant' is displayed
        And I click on item 'Common > virtual_assistant'
        And The element 'VirtualAssistantLocators > USAbove > sales_rep_option' is displayed
        And I click on item 'VirtualAssistantLocators > USAbove > sales_rep_option'
        Then I expect that element 'VirtualAssistantLocators > USAbove > sales_rep_option_response' is displayed


    @006 @automated @regression
    Scenario: Check the Virtual Assistant and chat option "Ask a medical question"
        When The element 'Common > virtual_assistant' is displayed
        And I click on item 'Common > virtual_assistant'
        And The element 'VirtualAssistantLocators > USAbove > ask_med_option' is displayed
        And I click on item 'VirtualAssistantLocators > USAbove > ask_med_option'
        Then I expect that element 'VirtualAssistantLocators > USAbove > ask_med_option_response' is displayed


    @007 @automated @regression
    Scenario: Check the Virtual Assistant and chat option "Get help ordering samples"
        When The element 'Common > virtual_assistant' is displayed
        And I click on item 'Common > virtual_assistant'
        And The element 'VirtualAssistantLocators > USAbove > get_help_option' is displayed
        And The element 'VirtualAssistantLocators > USAbove > sales_rep_option' is displayed
        And I click on item 'VirtualAssistantLocators > USAbove > sales_rep_option'
        Then I expect that element 'VirtualAssistantLocators > USAbove > sales_rep_option_response' is displayed


    @008 @automated @regression
    Scenario: Check privacy policy is displayed on the VA Chatbot
        When The element 'Common > virtual_assistant' is displayed
        And I click on item 'Common > virtual_assistant'
        And The element 'VirtualAssistantLocators > USAbove > welcome_text' is displayed
        Then I expect that element 'VirtualAssistantLocators > USAbove > privacy_policy' is displayed
        When I scroll to view and click on 'VirtualAssistantLocators > USAbove > privacy_policy'
        And I switch to newly opened tab
        Then The page url contains 'privacy'


    @009 @automated @regression
    Scenario: Virtual Assistant - Cancel chat request straight away
        When The element 'Common > virtual_assistant' is displayed
        And I click on item 'Common > virtual_assistant'
        And The element 'VirtualAssistantLocators > USAbove > cancel_chat_request' is displayed
        And I click on item 'VirtualAssistantLocators > USAbove > cancel_chat_request'
        And I click on item 'VirtualAssistantLocators > USAbove > leave_chat'
        Then I expect that element 'VirtualAssistantLocators > USAbove > welcome_text' is not displayed


    @010 @automated @regression
    Scenario: Check that the chat ends when user clicks on close window button
        When The element 'Common > virtual_assistant' is displayed
        And I click on item 'Common > virtual_assistant'
        And The element 'VirtualAssistantLocators > USAbove > close' is displayed
        And I click on item 'VirtualAssistantLocators > USAbove > close'
        Then I expect that element 'VirtualAssistantLocators > USAbove > welcome_text' is not displayed


    @011 @automated @regression
    Scenario: Check that the incorrect user credentials for login into the chatbot does not work
        When The element 'Common > virtual_assistant' is displayed
        And I click on item 'Common > virtual_assistant'
        And The element 'VirtualAssistantLocators > USAbove > welcome_text' is displayed
        And I click on item 'VirtualAssistantLocators > USAbove > sales_rep_option'
        And The element 'VirtualAssistantLocators > USAbove > yes_button' is displayed
        And I click on item 'VirtualAssistantLocators > USAbove > yes_button'
        And The element 'USAbove > login > emailid' is displayed
        Then The page url contains 'grv-page'


    @012 @automated @regression
    Scenario: Check that chatbot does not collapse when user clicks somewhere else on screen
        When The element 'Common > virtual_assistant' is displayed
        And I click on item 'Common > virtual_assistant'
        And The element 'VirtualAssistantLocators > USAbove > welcome_text' is displayed
        And I click on item 'USAbove > masthead'
        Then The element 'VirtualAssistantLocators > USAbove > welcome_text' is displayed





