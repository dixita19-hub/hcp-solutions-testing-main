@nondestructive @unifiedcart @usabove @uc_order_history
Feature:  US Galaxy Order History Automated Test Cases

    Background:
        Given I am on the page '/'
        And  Browser is maximized
        When I click on element 'USAbove > sign_in'
        And The element 'USAbove > login > emailid' is displayed
        And I set text '{%PFIZERPRO-OPTIN-TESTUSER%}' to field 'USAbove > login > emailid'
        And I set text '{%PFIZERPRO-TESTPASSWORD%}' to field 'USAbove > login > passphrase'
        And I click on element 'USAbove > login > login_button'
        And The element 'USAbove > log_out' is displayed
        Given I am on the page '/cart/order-history'

    @TR-C213353 @automated @regression @prio1
    Scenario: HCP is able to see each order card for Materials/Samples
        When The element 'UnifiedCartLocators > order_history_page > order_history_page_header' is displayed
        Then I expect that item 'X426392471' for element 'UnifiedCartLocators > order_history_page > order_number_collapsed' is displayed
        When I click item 'X426392471' for element 'UnifiedCartLocators > order_history_page > order_number_collapsed'
        Then I expect that item 'X426392471' for element 'UnifiedCartLocators > order_history_page > order_number_expanded' is displayed
        And I expect that item 'X426392471' for element 'UnifiedCartLocators > order_history_page > order_number_cart_items' is displayed
        And I expect that item 'X426392471' for element 'UnifiedCartLocators > order_history_page > order_number_view_link' is displayed
        And I expect 'UnifiedCartLocators > order_history_page > order_status_tabs' elements are displayed with innertext:
            | all | submitted | processing | partially shipped | rejected | canceled |
        And I expect that item 'X426392471' for element 'UnifiedCartLocators > order_history_page > order_number_submitted_status' is displayed
        And The element with inner text 'X426392471' and element 'UnifiedCartLocators > order_history_page > order_number_with_date' has text '12/03/24 | 18:22'


    #few additional steps need to be added after cancel modal is implemented
    @TR-C387273 @automated @regression @prio1
    Scenario: HCP is able to see "Cancel Order" button for only "Submitted" materials orders
        When The element 'UnifiedCartLocators > order_history_page > order_history_page_header' is displayed
        Then I expect that item 'V717417843' for element 'UnifiedCartLocators > order_history_page > order_number_collapsed' is displayed
        And The element 'UnifiedCartLocators > order_history_page > order_history_page_header' is displayed
        And I expect element 'UnifiedCartLocators > order_history_page > order_status_tabs' has items:
            | all | submitted | processing | partially shipped | rejected | canceled |
        When I click item 'V717417843' for element 'UnifiedCartLocators > order_history_page > order_number_collapsed'
        Then I expect that item 'V717417843' for element 'UnifiedCartLocators > order_history_page > order_number_expanded' is displayed
        And I expect that item 'V717417843' for element 'UnifiedCartLocators > order_history_page > order_number_cancel_button' is displayed
        When I click item 'submitted' for element 'UnifiedCartLocators > order_history_page > order_status_tabs'
        When I click item 'I355978668' for element 'UnifiedCartLocators > order_history_page > order_number_collapsed'
        Then I expect that item 'I355978668' for element 'UnifiedCartLocators > order_history_page > order_number_expanded' is displayed
        And I expect that item 'I355978668' for element 'UnifiedCartLocators > order_history_page > order_number_cancel_button' is displayed


    @TR-C387296 @automated @regression @prio1
    Scenario: Order cards should be filtered on the basis of status tabs
        When The element 'UnifiedCartLocators > order_history_page > order_history_page_header' is displayed
        And I click item 'submitted' for element 'UnifiedCartLocators > order_history_page > order_status_tabs'
        #this is required as it takes few secs to reflect changes
        And I pause for '5' s
        Then I expect '10' elements of 'UnifiedCartLocators > order_history_page > submitted_orders_count' are displayed
        When I click item 'processing' for element 'UnifiedCartLocators > order_history_page > order_status_tabs'
        #this is required as it takes few secs to reflect changes
        And I pause for '5' s
        Then I expect '10' elements of 'UnifiedCartLocators > order_history_page > processing_orders_count' are displayed
        When I click item 'partially shipped' for element 'UnifiedCartLocators > order_history_page > order_status_tabs'
        #this is required as it takes few secs to reflect changes
        And I pause for '5' s
        Then I expect '10' elements of 'UnifiedCartLocators > order_history_page > partially_orders_count' are displayed
        When I click item 'rejected' for element 'UnifiedCartLocators > order_history_page > order_status_tabs'
        #this is required as it takes few secs to reflect changes
        And I pause for '5' s
        Then I expect '10' elements of 'UnifiedCartLocators > order_history_page > rejected_orders_count' are displayed
        When I click item 'canceled' for element 'UnifiedCartLocators > order_history_page > order_status_tabs'
        Then The element 'UnifiedCartLocators > order_history_page > empty_orders_page' is displayed


    @TR-C359199 @automated @regression @prio1
    Scenario: Sorting dropdown should sort the cards correctly
        When The element 'UnifiedCartLocators > order_history_page > order_history_page_header' is displayed
        And The element 'UnifiedCartLocators > order_history_page > sort_listing_dropdown' is displayed
        And I click on item 'UnifiedCartLocators > order_history_page > sort_listing_dropdown'
        #this is required as it takes few secs to reflect changes
        And I pause for '2' s
        And I click item 'Newest to Oldest' for element 'UnifiedCartLocators > order_history_page > sort_by_dropdown_item'
        #this is required as it takes few secs to reflect changes
        And I pause for '5' s
        Then The element with inner text 'X426392471' and element 'UnifiedCartLocators > order_history_page > order_number_with_date' has text '12/03/24 | 18:22'
        When I click on item 'UnifiedCartLocators > order_history_page > sort_listing_dropdown'
        #this is required as it takes few secs to reflect changes
        And I pause for '2' s
        And I click item 'Samples & Savings Cards (Only)' for element 'UnifiedCartLocators > order_history_page > sort_by_dropdown_item'
        #this is required as it takes few secs to reflect changes
        And I pause for '5' s
        Then The element with inner text 'X426392471' and element 'UnifiedCartLocators > order_history_page > order_number_with_date' has text '12/03/24 | 18:22'


    @TR-C359193 @automated @regression @prio1
    Scenario: Pagination should show properly on manage order Page
        When The element 'UnifiedCartLocators > order_history_page > order_history_page_header' is displayed
        Then The element 'UnifiedCartLocators > order_history_page > order_history_pagination' is displayed
        #this is required as it takes few secs to reflect changes
        When I pause for '2' s
        And I click on item 'UnifiedCartLocators > order_history_page > sort_listing_dropdown'
        #this is required as it takes few secs to reflect changes
        And I pause for '2' s
        And I click item 'Materials (Only)' for element 'UnifiedCartLocators > order_history_page > sort_by_dropdown_item'
        #this is required as it takes few secs to reflect changes
        And I pause for '5' s
        And I click item 'partially shipped' for element 'UnifiedCartLocators > order_history_page > order_status_tabs'
        #this is required as it takes few secs to reflect changes
        And I pause for '5' s
        Then The element 'UnifiedCartLocators > order_history_page > order_history_pagination' is not displayed
        #this is required as it takes few secs to reflect changes
        When I pause for '5' s
        And I click item 'all' for element 'UnifiedCartLocators > order_history_page > order_status_tabs'
        #this is required as it takes few secs to reflect changes
        And I pause for '5' s
        And The element 'UnifiedCartLocators > order_history_page > order_history_pagination' is displayed


