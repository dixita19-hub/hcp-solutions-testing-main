@nondestructive @usabove @p2c2 @accordion
Feature: Galaxy automated regression - Pfizerpro Accordion components

  Background:
        Given I am on the page '/core/ppc-regression'
        And Browser is maximized
        And The title is 'ppc-regression | Pfizer For Professionals'
        When The element 'helixISIModal > closeIcon' is displayed
        And I click on element 'helixISIModal > closeIcon'

  @TR-C877558 @automated
  Scenario: PfizerPro Core Data Display - Accordion Primary
      Then I expect that element 'helixComponent > accordion_primary_header' is displayed
      And The css property values for element 'helixComponent > accordion_primary_header' are:
          | property         | value                     |
          | font-family      | Inter                     |
          | color            | rgba(56, 56, 56, 1)       |
          | letter-spacing   | 0.25px                    |
          | line-height      | 28px                      |
          | font-weight      | 400                       |
          | font-size        | 18px                      |
      And The css property values for element 'helixComponent > accordion_primary_content' are:
          | property         | value                     |
          | font-family      | Inter                     |
          | letter-spacing   | 0.25px                    |
          | line-height      | 24px                      |
          | font-weight      | 400                       |
          | font-size        | 16px                      |
      When I click on element 'helixComponent > accordion_primary_up_arrow'
      Then I expect that element 'helixComponent > accordion_primary_down_arrow' is displayed

  @TR-C877559 @automated
  Scenario: PPC- Data Display - Accordion Secondary
      Then I expect that element 'helixComponent > accordion_secondary_header' is displayed
      And The css property values for element 'helixComponent > accordion_secondary_header' are:
          | property         | value                     |
          | font-family      | Inter                     |
          | color            | rgba(56, 56, 56, 1)       |
          | letter-spacing   | 0.25px                    |
          | line-height      | 28px                      |
          | font-weight      | 400                       |
          | font-size        | 18px                      |
      And The css property values for element 'helixComponent > accordion_secondary_content' are:
          | property         | value                     |
          | font-family      | Inter                     |
          | letter-spacing   | 0.25px                    |
          | line-height      | 24px                      |
          | font-weight      | 400                       |
          | font-size        | 16px                      |
      When I click on element 'helixComponent > accordion_secondary_close_icon'
      Then I expect that element 'helixComponent > accordion_secondary_plus_icon' is displayed

  @TR-C877562 @automated
  Scenario: PPC - Data Display - Accordion Primary with Footnote
      Then I expect that element 'helixComponent > accordion_primary_footnote_header' is displayed
      And The css property values for element 'helixComponent > accordion_primary_footnote_header' are:
          | property         | value                     |
          | font-family      | Inter                     |
          | color            | rgba(56, 56, 56, 1)       |
          | letter-spacing   | 0.25px                    |
          | line-height      | 28px                      |
          | font-weight      | 400                       |
          | font-size        | 18px                      |
      And The css property values for element 'helixComponent > accordion_primary_footnote_content' are:
          | property         | value                     |
          | font-family      | Inter                     |
          | letter-spacing   | 0.25px                    |
          | line-height      | 24px                      |
          | font-weight      | 400                       |
          | font-size        | 16px                      |
      And  The css property values for element 'helixComponent > accordion_primary_footnote_read_less' are:
          | property         | value                     |
          | font-family      | Inter                     |
          | color            | rgba(0, 100, 193, 1)      |
          | line-height      | 24px                      |
          | font-weight      | 400                       |
          | font-size        | 16px                      |
          | letter-spacing   | 0.25px                    |
          | padding-left     | 24px                      |
          | padding-right    | 24px                      |
      When I click on element 'helixComponent > accordion_primary_footnote_read_less'
      Then The element 'helixComponent > accordion_primary_footnote_down_arrow' is displayed

  @TR-C877563 @automated
  Scenario: PPC - Data Display - Accordion Secondary with Footnote
      Then I expect that element 'helixComponent > accordion_secondary_footnote_header' is displayed
      And The css property values for element 'helixComponent > accordion_secondary_footnote_header' are:
          | property         | value                     |
          | font-family      | Inter                     |
          | color            | rgba(56, 56, 56, 1)       |
          | letter-spacing   | 0.25px                    |
          | line-height      | 28px                      |
          | font-weight      | 400                       |
          | font-size        | 18px                      |
      And The css property values for element 'helixComponent > accordion_secondary_footnote_content' are:
          | property         | value                     |
          | font-family      | Inter                     |
          | letter-spacing   | 0.25px                    |
          | line-height      | 24px                      |
          | font-weight      | 400                       |
          | font-size        | 16px                      |
      When I click on element 'helixComponent > accordion_secondary_footnote_read_less'
      Then The element 'helixComponent > accordion_secondary_footnote_plus_icon' is displayed
      And The css property values for element 'helixComponent > accordion_secondary_footnote_read_more' are:
          | property         | value                     |
          | font-family      | Inter                     |
          | color            | rgba(0, 100, 193, 1)      |
          | line-height      | 24px                      |
          | font-weight      | 400                       |
          | font-size        | 16px                      |
          | letter-spacing   | 0.25px                    |
          | padding-left     | 24px                      |
          | padding-right    | 24px                      |
