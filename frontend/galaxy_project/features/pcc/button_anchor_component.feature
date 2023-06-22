@nondestructive @usabove @pcc @buttonandanchor
Feature: Galaxy automated regression - button and anchor components

  Background:
        Given I am on the page '/'
        And Browser is maximized
        When The element 'helixISIModal > closeIcon' is displayed
        And I click on element 'helixISIModal > closeIcon'

  @TR-C393228 @automated @regression
  Scenario Outline: Verify PPC - Buttons and Anchor - Loading Button
    When The element 'helixComponent > loading_button' is displayed
    And The element 'helixComponent > loading_button_icon' is displayed
    Then The css attribute '<attribute>' of element '<locator>' is the value '<value>'
    Examples:
         | locator                                | attribute        | value                  |
         | helixComponent > loading_button        | background-color | rgba(0, 0, 201, 1)     |
         | helixComponent > loading_button        | color            | rgba(255, 255, 255, 1) |
         | helixComponent > loading_button        | padding-left     | 40px                   |
         | helixComponent > loading_button        | padding-right    | 40px                   |
         | helixComponent > loading_button        | padding-top      | 12px                   |
         | helixComponent > loading_button        | padding-bottom   | 12px                   |
         | helixComponent > loading_button_icon   | color            | rgba(255, 255, 255, 1) |

  @TR-C393225 @automated @regression
  Scenario Outline: Verify PPC - Buttons and Anchor - Primary and Secondary inverted button for above brand
    When The element 'helixComponent > primary_button' is displayed
    Then The css attribute '<attribute>' of element 'helixComponent > primary_button' is the value '<value>'
    Examples:
         | attribute              | value                  |
         | font-family            | Inter                  |
         | font-weight            | 700                    |
         | font-size              | 16px                   |
         | line-height            | 24px                   |
         | letter-spacing         | 0.25px                 |
         | padding-top            | 12px                   |
         | padding-bottom         | 12px                   |
         | background-color       | rgba(255, 255, 255, 1) |
         | color                  | rgba(0, 0, 78, 1)      |

  @TR-C393229 @automated @regression
  Scenario Outline: Verify PPC - Buttons and Anchor - Primary button
    Given I hover over 'helixComponent > primary_button'
    Then The css attribute '<attribute>' of element 'helixComponent > primary_button' is the value '<value>'
    Examples:
         | attribute              | value                  |
         | font-family            | Inter                  |
         | font-size              | 16px                   |
         | font-weight            | 700                    |
         | line-height            | 24px                   |
         | background-color       | rgba(255, 255, 255, 1) |
         | letter-spacing         | 0.25px                 |
         | color                  | rgba(127, 127, 228, 1) |

  @TR-C393264 @automated @regression
  Scenario: Verify PPC - Buttons and Anchor - Secondary button
    When The element 'helixComponent > secondary_button' is displayed
    Then The css property values for element 'helixComponent > secondary_button' are:
         | property               | value                  |
         | font-family            | Inter                  |
         | font-weight            | 700                    |
         | font-size              | 16px                   |
         | line-height            | 24px                   |
         | letter-spacing         | 0.25px                 |
    Given I hover over 'helixComponent > secondary_button'
    Then The css property values for element 'helixComponent > secondary_button' are:
         | property               | value                  |
         | font-family            | Inter                  |
         | font-size              | 16px                   |
         | font-weight            | 700                    |
         | line-height            | 24px                   |
         | background-color       | rgba(255, 255, 255, 1) |
         | letter-spacing         | 0.25px                 |
         | color                  | rgba(0, 0, 78, 1)      |

  @TR-C393227 @automated @regression
  Scenario: Verify PPC - Buttons and Anchor - Primary and Secondary inverted button for brand
    When The element 'helixComponent > primary_button' is displayed
    Then The css property values for element 'helixComponent > primary_button' are:
         | property               | value                  |
         | color                  | rgba(177, 21, 60, 1)   |
         | background-color       | rgba(255, 255, 255, 1) |
    Given I hover over 'helixComponent > primary_button'
    Then The css property values for element 'helixComponent > primary_button' are:
         | property               | value                  |
         | color                  | rgba(236, 71, 102, 1)  |
         | background-color       | rgba(255, 255, 255, 1) |
    Then The css property values for element 'helixComponent > secondary_button' are:
         | property               | value                  |
         | color                  | rgba(255, 255, 255, 1) |
         | border-color           | rgb(255, 255, 255)     |
    Given I hover over 'helixComponent > secondary_button'
    Then The css property values for element 'helixComponent > secondary_button' are:
         | property               | value                   |
         | color                  | rgba(177, 21, 60, 1)    |
         | background-color       | rgba(255, 255, 255, 1)  |

  @TR-C872316 @automated @regression @prio1
  Scenario: Verify PPC- Buttons and Anchor - Button Left Icon
    When The element 'helixComponent > button_left_icon_close' is displayed
    Then The css property values for element 'helixComponent > button_left_icon_close' are:
         | property               | value                   |
         | color                  | rgba(255, 255, 255, 1)  |
    When The element 'helixComponent > button_left_icon' is displayed
    Then The css property values for element 'helixComponent > button_left_icon' are:
         | property               | value                   |
         | background-color       | rgba(0, 0, 201, 1)      |
         | padding-left           | 40px                    |
         | padding-top            | 12px                    |
         | padding-bottom         | 12px                    |

  @TR-C872317 @automated @regression @prio1
  Scenario: PPC - Buttons and Anchor - Button Right Icon
    When The element 'helixComponent > button_right_icon_close' is displayed
    Then The css property values for element 'helixComponent > button_right_icon_close' are:
         | property               | value                   |
         | color                  | rgba(255, 255, 255, 1)  |
    When The element 'helixComponent > button_right_icon' is displayed
    Then The css property values for element 'helixComponent > button_right_icon' are:
         | property               | value                   |
         | background-color       | rgba(0, 0, 201, 1)      |
         | padding-left           | 40px                    |
         | padding-top            | 12px                    |
         | padding-bottom         | 12px                    |

  @TR-C872318 @automated @regression @prio1
  Scenario: Verify PPC - Buttons and Anchor - Button Group
    When The element 'helixComponent > button_group_primary_button' is displayed
    Then The css property values for element 'helixComponent > button_group_primary_button' are:
         | property               | value                   |
         | background-color       | rgba(0, 0, 201, 1)      |
         | color                  | rgba(255, 255, 255, 1)  |
    Given I hover over 'helixComponent > button_group_primary_button'
    Then The css property values for element 'helixComponent > button_group_primary_button' are:
         | property               | value                   |
         | background-color       | rgba(127, 127, 228, 1)  |
         | color                  | rgba(255, 255, 255, 1)  |
    And The element 'helixComponent > button_group_secondary_button' is displayed
    Then The css property values for element 'helixComponent > button_group_secondary_button' are:
         | property               | value                   |
         | background-color       | rgba(0, 0, 0, 0)        |
         | color                  | rgba(0, 0, 201, 1)      |
    Given I hover over 'helixComponent > button_group_secondary_button'
    Then The css property values for element 'helixComponent > button_group_secondary_button' are:
         | property               | value                   |
         | background-color       | rgba(0, 0, 201, 1)        |
         | color                  | rgba(255, 255, 255, 1)  |

  @TR-C872319 @automated @regression @prio1
  Scenario: Verify PPC -  Buttons and Anchor - Scroll To
    When The element 'helixComponent > scroll_to_button' is displayed
    Then The css property values for element 'helixComponent > scroll_to_button' are:
         | property               | value                   |
         | background-color       | rgba(161, 170, 177, 1)  |
         | height                 | 40px                    |
         | width                  | 40px                    |
    When The element 'helixComponent > scroll_to_button' is displayed
    Given I hover over 'helixComponent > scroll_to_button'
    Then The css property values for element 'helixComponent > scroll_to_button' are:
         | property               | value                   |
         | background-color       | rgba(0, 0, 201, 1)      |

  @TR-C872320 @automated @regression @prio1
  Scenario: Verify PPC - Buttons and Anchor - External Link
    When The element 'helixComponent > external_link' is displayed
    And I click on element 'helixComponent > external_link'
    And The element 'helixComponent > external_popup_header' is displayed
    And The element 'helixComponent > external_popup_body_text' is displayed
    And The element 'helixComponent > external_popup_goto_link' is displayed
    And The element 'helixComponent > external_popup_cancel_link' is displayed
    And I click on element 'helixComponent > external_popup_goto_link'
    Then I expect that the title is 'Google'
