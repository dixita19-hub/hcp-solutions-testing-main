@nondestructive @unifiedcart @usabove @unifiedcart_samples @uc_samples_error_pages
Feature: US Galaxy Samples Cart Error Pages

    Background:
        Given I am on the page '/'
        And   Browser is maximized
        When  The element 'USAbove > sign_in' is displayed
        And   I move to element 'USAbove > sign_in'
        And  I click on element 'USAbove > sign_in'
        And  The element 'USAbove > login > emailid' is displayed

    @TR-C363123 @automated @regression @prio1
    Scenario: Samples Cart - HCP is moved to "Not Eligible" samples error page if not authorised for samples in system
        When I set text '{%PFIZERPRO-NONVALIDATED-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And  The element 'UnifiedCartLocators > order_menu' is displayed
        And   I move to element 'UnifiedCartLocators > order_menu'
        And   The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And   I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        When The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        Then I expect that the title is 'Not Eligible | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > error_Pages > non_validated_error_page_heading' is displayed
        And The element 'UnifiedCartLocators > error_Pages > error_link_1' contains the text 'Product information'
        And The element 'UnifiedCartLocators > error_Pages > error_link_2' contains the text 'Professional resources'
        And The element 'UnifiedCartLocators > error_Pages > error_link_3' contains the text 'Download available co-pay cards'
        And The element 'UnifiedCartLocators > error_Pages > error_link_4' contains the text 'Patient assistance programs'
        When I am on the page '/cart'
        And The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        Then I expect that the title is 'Not Eligible | Pfizer For Professionals'
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        When I am on the page '/cart/samples'
        And The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        Then I expect that the title is 'Not Eligible | Pfizer For Professionals'
        When I am on the page '/cart/checkout-shipping-details'
        And The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        Then I expect that the title is 'Not Eligible | Pfizer For Professionals'
        When I am on the page '/cart/checkout-order-instructions'
        And The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        Then I expect that the title is 'Not Eligible | Pfizer For Professionals'
        When I am on the page '/cart/checkout-review-order'
        And The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        Then I expect that the title is 'Not Eligible | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        When I click on element 'UnifiedCartLocators > error_Pages > return_home_button'
        Then I expect that the title is 'Home | Pfizer For Professionals'

    @TR-C363125 @automated @regression @prio1
    Scenario: Samples Cart - HCP is moved to "No Samples" error page if don't have any allocations (samples/co-pay)
        When I set text '{%PFIZERPRO-NOSAMPLES-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And  The element 'UnifiedCartLocators > order_menu' is displayed
        And   I move to element 'UnifiedCartLocators > order_menu'
        And   The element 'UnifiedCartLocators > request_samples_sub_menu' is displayed
        And   I click on element 'UnifiedCartLocators > request_samples_sub_menu'
        When The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        Then I expect that the title is 'No Samples | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > error_Pages > no_samples_error_page_heading' is displayed
        And The element 'UnifiedCartLocators > error_Pages > error_link_1' contains the text 'Product information'
        And The element 'UnifiedCartLocators > error_Pages > error_link_2' contains the text 'Professional resources'
        And The element 'UnifiedCartLocators > error_Pages > error_link_3' contains the text 'Download available co-pay cards'
        And The element 'UnifiedCartLocators > error_Pages > error_link_4' contains the text 'Patient assistance programs'
        When I am on the page '/cart'
        And The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        Then I expect that the title is 'No Samples | Pfizer For Professionals'
        When I move to element 'UnifiedCartLocators > error_Pages > samples_gcma_code'
        Then The element 'UnifiedCartLocators > error_Pages > samples_gcma_code' text is 'PP-UNP-USA-0290'
        When I am on the page '/cart/checkout-shipping-details'
        And The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        Then I expect that the title is 'No Samples | Pfizer For Professionals'
        When I am on the page '/cart/checkout-order-instructions'
        And The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        Then I expect that the title is 'No Samples | Pfizer For Professionals'
        When I am on the page '/cart/checkout-review-order'
        And The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        Then I expect that the title is 'No Samples | Pfizer For Professionals'
        And The element 'UnifiedCartLocators > error_Pages > return_home_button' is displayed
        When I click on element 'UnifiedCartLocators > error_Pages > return_home_button'
        Then I expect that the title is 'Home | Pfizer For Professionals'
