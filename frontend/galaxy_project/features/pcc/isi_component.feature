@nondestructive @usabove @pcc @isi
Feature: Galaxy automated regression - ISI components

  Background:
        Given I am on the page '/core/ppc-regression'
        And Browser is maximized
        And The title is 'ppc-regression | Pfizer For Professionals'
        When The element 'helixISIModal > closeIcon' is displayed

  @TR-C393226 @automated @regression
  Scenario: Verify Persistent ISI component
    When I click on element 'helixISIModal > closeIcon'
    Then I expect that element 'helixComponent > isi_persistent' is displayed
    And I expect that element 'helixComponent > isi_expand_button' is displayed
    And I expect that element 'helixComponent > isi_safety_info_header' is displayed
    And I expect that element 'helixComponent > isi_indication_header' is displayed
    And I expect that element 'helixComponent > isi_safety_info_content' is displayed
    And I expect that element 'helixComponent > isi_indication_content' is displayed
    And The css property values for element 'helixComponent > isi_safety_info_header' are:
         | property         | value                |
         | font-family      | Inter                |
         | color            | rgba(64, 64, 215, 1) |
         | letter-spacing   | 0.25px               |
         | line-height      | 24px                 |
         | font-weight      | 700                  |
         | font-size        | 16px                 |
    And The css property values for element 'helixComponent > isi_safety_info_content' are:
         | property         | value                     |
         | font-family      | Inter                     |
         | color            | rgba(56, 56, 56, 1)       |
         | letter-spacing   | 0.25px                    |
         | line-height      | 24px                      |
         | font-size        | 16px                      |
         | font-weight      | 400                       |
    When I click on element 'helixComponent > isi_expand_button'
    Then I expect that element 'helixComponent > isi_collapse_button' is displayed
    And I expect that element 'helixComponent > isi_collapse_icon' is displayed
    And I expect that element 'helixComponent > isi_body_text_bullet_points' is displayed
    And The element 'helixComponent > isi_collapse_text' is displayed
    And The css property values for element 'helixComponent > isi_collapse_text' are:
         | property         | value                     |
         | font-family      | Inter, sans-serif         |
         | color            | rgba(64, 64, 215, 1)      |
         | letter-spacing   | normal                    |
         | line-height      | normal                    |
         | font-size        | 16px                      |
         | font-weight      | 600                       |
    And The css property values for element 'helixComponent > isi_collapse_icon' are:
         | property         | value                     |
         | color            | rgba(0, 0, 201, 1)        |
         | width            | 24px                      |
         | height           | 24px                    |

  @TR-C393245 @automated @regression
  Scenario Outline: Verify ISI Indication Modal component
    Then I expect that element 'helixComponent > isi_modal' is displayed
    And The css attribute '<attribute>' of element '<locator>' is the value '<value>'
    Examples:
         | locator                          | attribute              | value                  |
         | helixISIModal > isi_header       | font-weight            | 700                    |
         | helixISIModal > isi_header       | font-size              | 16px                   |
         | helixISIModal > isi_header       | line-height            | 24px                   |
         | helixISIModal > isi_header       | color                  | rgba(0, 0, 201, 1)     |
         | helixISIModal > isi_header       | letter-spacing         | 0.25px                 |
         | helixISIModal > isi_body_text    | font-weight            | 400                    |
         | helixISIModal > isi_body_text    | font-size              | 16px                   |
         | helixISIModal > isi_body_text    | line-height            | 20px                   |
         | helixISIModal > isi_body_text    | color                  | rgba(56, 56, 56, 1)    |
         | helixISIModal > isi_body_text    | letter-spacing         | 0.5px                  |
         | helixISIModal > closeIcon        | width                  | 24px                   |
         | helixISIModal > closeIcon        | height                 | 24px                   |
         | helixISIModal > closeIcon        | color                  | rgba(0, 0, 201, 1)     |

  @TR-C394875 @automated @regression
  Scenario: Verify PPC - ISI - ISI Utility Links Single Brand
    When I click on element 'helixISIModal > closeIcon'
    Then I expect that element 'helixComponent > isi_single_brand_links' is displayed
    Then The css property values for element 'helixComponent > isi_single_brand_link' are:
         | property               | value                  |
         | font-family            | Inter, sans-serif      |
         | font-size              | 14px                   |
         | color                  | rgba(56, 56, 56, 1)    |
         | font-weight            | 400                    |
         | line-height            | 20px                   |
         | letter-spacing         | 0.5px                  |
    Given I hover over 'helixComponent > isi_single_brand_link'
    Then The css property values for element 'helixComponent > isi_single_brand_link' are:
         | property               | value                  |
         | color                  | rgba(56, 56, 56, 1)    |
    When I click on element 'helixComponent > isi_single_brand_link'
    Then I expect that the title is 'ppc-regression | Pfizer For Professionals'

  @TR-C394878 @automated @regression
  Scenario Outline: Verify PPC - ISI - ISI Utility Links Multi Brand
    When I click on element 'helixISIModal > closeIcon'
    Then I expect that element 'helixComponent > isi_multi_brand_links' is displayed
    And The css attribute '<attribute>' of element '<locator>' is the value '<value>'
    When I click on element 'helixComponent > isi_multi_brand_link'
    Then I expect that the title is 'ppc-regression | Pfizer For Professionals'
    Examples:
         | locator                                    | attribute              | value                  |
         | helixComponent > isi_multi_brand_link      | font-family            | Inter, sans-serif      |
         | helixComponent > isi_multi_brand_link      | font-size              | 14px                   |
         | helixComponent > isi_multi_brand_link      | color                  | rgba(56, 56, 56, 1)    |
         | helixComponent > isi_multi_brand_link      | font-weight            | 400                    |
         | helixComponent > isi_multi_brand_link      | line-height            | 20px                   |
         | helixComponent > isi_multi_brand_brand1    | font-family            | Inter, sans-serif      |
         | helixComponent > isi_multi_brand_brand1    | font-size              | 14px                   |
         | helixComponent > isi_multi_brand_brand1    | color                  | rgba(56, 56, 56, 1)    |
         | helixComponent > isi_multi_brand_brand1    | font-weight            | 600                    |
         | helixComponent > isi_multi_brand_brand1    | line-height            | 20px                   |






