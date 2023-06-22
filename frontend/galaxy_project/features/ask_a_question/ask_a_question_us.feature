@nondestructive @ask_a_question_us @usabove
Feature: US Galaxy Automated Regression - Ask a question (Krypton)

    Background:
        Given I am on the page '/'
        And Browser is maximized
        And The title is 'Home | Pfizer For Professionals'

    @TR-C205199 @automated @regression @prio1
    Scenario: Ask a question workflow
        When I click item 'contact' for element 'Common > menu_items'
        And The element 'Common > contact_page_title' is displayed
        And I scroll to view and click on 'USAbove > ask_question_button'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'AskAQuestionLocators > USAbove > ask_question_textarea' is displayed
        And I set text 'This is from automated galaxy test' to field 'AskAQuestionLocators > USAbove > ask_question_textarea'
        And I press 'SPACE'
        And The element 'AskAQuestionLocators > USAbove > submit_button' is displayed
        And I click on element 'AskAQuestionLocators > USAbove > submit_button'
        And The element 'CommonLocators > helix_heading_successfully' is displayed
        Then I expect 'CommonLocators > helix_heading' elements are displayed with innertext:
            | Question submitted successfully! |


    @TR-C205198 @automated @regression @prio1
    Scenario: Submit another question workflow
        When I click item 'contact' for element 'Common > menu_items'
        And The element 'Common > contact_page_title' is displayed
        And I scroll to view and click on 'USAbove > ask_question_button'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'AskAQuestionLocators > USAbove > ask_question_textarea' is displayed
        And I set text 'This is from automated test' to field 'AskAQuestionLocators > USAbove > ask_question_textarea'
        And I press 'SPACE'
        And The element 'AskAQuestionLocators > USAbove > submit_button' is displayed
        And I click on element 'AskAQuestionLocators > USAbove > submit_button'
        And The element 'AskAQuestionLocators > USAbove > submit_another_question_button' is displayed
        And I click on element 'AskAQuestionLocators > USAbove > submit_another_question_button'
        And The element 'AskAQuestionLocators > USAbove > ask_question_textarea' is displayed
        And I set text 'This is from automated test' to field 'AskAQuestionLocators > USAbove > ask_question_textarea'
        And I press 'SPACE'
        And The element 'AskAQuestionLocators > USAbove > submit_button' is displayed
        And I click on element 'AskAQuestionLocators > USAbove > submit_button'
        And The element 'CommonLocators > helix_heading_successfully' is displayed
        Then I expect 'CommonLocators > helix_heading' elements are displayed with innertext:
            | Question submitted successfully! |

    @TR-C205197 @automated @regression @prio1
    Scenario: Suggest a topic workflow
        When I move to element 'Common > explore_content_menu_item'
        And The element 'Common > events_button' is displayed
        And I click on element 'Common > events_button'
        And The element 'Common > events_page_section' is displayed
        And I scroll to view and click on 'AskAQuestionLocators > USAbove > submit_a_topic_button'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'AskAQuestionLocators > USAbove > submit_a_topic_text_area' is displayed
        And I set text 'This is from automated test' to field 'AskAQuestionLocators > USAbove > submit_a_topic_text_area'
        And I press 'SPACE'
        And The element 'AskAQuestionLocators > USAbove > submit_button' is displayed
        And I click on element 'AskAQuestionLocators > USAbove > submit_button'
        And The element 'CommonLocators > helix_heading_successfully' is displayed
        Then I expect 'CommonLocators > helix_heading' elements are displayed with innertext:
            | Topic submitted successfully! |

    @TR-C205196 @automated @regression @prio1
    Scenario: Suggest another topic workflow
        When I move to element 'Common > explore_content_menu_item'
        And The element 'Common > events_button' is displayed
        And I click on element 'Common > events_button'
        And The element 'Common > events_page_section' is displayed
        And I scroll to view and click on 'AskAQuestionLocators > USAbove > submit_a_topic_button'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%AUT1US%}' to field 'USAbove > login > emailid'
        And I set text '{%AUTOPASS1%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'AskAQuestionLocators > USAbove > submit_a_topic_text_area' is displayed
        And I set text 'This is from automated test' to field 'AskAQuestionLocators > USAbove > submit_a_topic_text_area'
        And I press 'SPACE'
        And The element 'AskAQuestionLocators > USAbove > submit_button' is displayed
        And I click on element 'AskAQuestionLocators > USAbove > submit_button'
        And The element 'AskAQuestionLocators > USAbove > submit_a_topic_button' is displayed
        And I click on element 'AskAQuestionLocators > USAbove > submit_a_topic_button'
        And The element 'AskAQuestionLocators > USAbove > submit_a_topic_text_area' is displayed
        And I set text 'This is from automated test' to field 'AskAQuestionLocators > USAbove > submit_a_topic_text_area'
        And I press 'SPACE'
        And The element 'AskAQuestionLocators > USAbove > submit_button' is displayed
        And I click on element 'AskAQuestionLocators > USAbove > submit_button'
        And The element 'CommonLocators > helix_heading_successfully' is displayed
        Then I expect 'CommonLocators > helix_heading' elements are displayed with innertext:
            | Topic submitted successfully! |
