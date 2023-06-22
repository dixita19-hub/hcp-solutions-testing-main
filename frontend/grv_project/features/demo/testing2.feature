@GRV-2772 @nondestructive
Feature: GRV_TEST_2
    As an anonymous user
    I am on the registration form
    I want to be able to register successfully

    @TR-C878181 @automated @grv_tag
    Scenario: sample test 1a
        Given I am an anonymous user
        When I am on the "LOGIN" Form
        #I removed a step from here and it still passed taking into consideration the steps we have here
        #https://pfedse.testrail.io/index.php?/runs/view/14397&group_by=cases:section_id&group_order=asc&group_id=56616

    @TR-C878182 @automated @grv_tag
    Scenario: sample test 2a
        Given I am an anonymous user
        When I am on the "LOGIN" Form
        #Added 1 at end of Given statement to make it fail and it couldn't find the step definition and failed

    @TR-C878183 @automated @grv_tag
    Scenario: sample test 1bb
        Given I am an anonymous user
        When I am on the "LOGIN" Form
        Then "LOGIN" button shall be "DISABLED"
        #Changed scenario name from 'sample test 1b' to 'sample test 1bb' and it passed

    @TR-C878184 @grv_tag
    Scenario: sample test 2b
        Given I am an anonymous user
        When I am on the "LOGIN" Form
        #Added the skip tagg and the test was skipped and the test was skipped and we see no timestamp on TestRail

    @TR-C878186 @automated @grv_tag
    Scenario: sample test from TR
        Given I am an anonymous user
        When I am on the "LOGIN" Form


#        @GRV-2772 @nondestructive
#Feature: GRV_TEST_2
#    As an anonymous user
#    I am on the registration form
#    I want to be able to register successfully
#
#    @TR-C878181 @automated @grv_tag
#    Scenario: sample test 1a
#        Given I am an anonymous user
#        When I am on the "LOGIN" Form
#        Then "LOGIN" button shall be "DISABLED"
#
#    @TR-C878182 @automated @grv_tag
#    Scenario: sample test 2a
#        Given I am an anonymous user
#        When I am on the "LOGIN" Form
#
#    @TR-C878183 @automated @grv_tag
#    Scenario: sample test 1b
#        Given I am an anonymous user
#        When I am on the "LOGIN" Form
#        Then "LOGIN" button shall be "DISABLED"
#
#    @TR-C878184 @automated @grv_tag
#    Scenario: sample test 2b
#        Given I am an anonymous user
#        When I am on the "LOGIN" Form
