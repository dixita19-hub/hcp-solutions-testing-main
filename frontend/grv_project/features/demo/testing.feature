@GRV-2772 @nondestructive
Feature: GRV_TEST
    As an anonymous user
    I am on the registration form
    I want to be able to register successfully

    @TR-C877531 @automated @grv_tag
    Scenario: sample test 1
        Given I am an anonymous user
        When I am on the "LOGIN" Form
        Then "LOGIN" button shall be "DISABLED"

    @TR-C877532 @automated @grv_tag
    Scenario: sample test 2
        Given I am an anonymous user
        When I am on the "LOGIN" Form

