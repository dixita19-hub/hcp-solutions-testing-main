@nondestructive @product_listing_uk @ukabove
Feature: UK Galaxy Automated Regression - Product Listing (Tellus)

    Background:
        Given I am on the page '/'
        And Browser is maximized
        When I click on element 'UKAbove > hcp_confirmation_yes'
        And I click on element 'UKAbove > pfizer_medicines_menu'
        And The title is 'List of Medicines | PfizerPro UK'


    @TR-C205354 @automated @regression
    Scenario: Default view of ProductListing page
        When The element 'ProductListingLocators > product_listing_layout' is displayed
        Then I expect value '1' is enabled for element 'ProductListingLocators > brand_letter'
        And I expect value '2' is enabled for element 'ProductListingLocators > brand_letter'
        And I expect that element 'ProductListingLocators > brand_letter_j_no_page' is displayed

    @TR-C205353 @automated @regression
    Scenario: Verify that brand letter gets disabled after clicking on it
        When The element 'ProductListingLocators > product_listing_layout' is displayed
        And I click item '3' for element 'ProductListingLocators > brand_letter'
        Then I expect value '3' is not enabled for element 'ProductListingLocators > brand_letter'

    @TR-C205352 @automated @regression
    Scenario: Verify product link is properly accessible
        When The element 'ProductListingLocators > product_listing_layout' is displayed
        And I click item '1' for element 'ProductListingLocators > product_info_link'
        Then The url 'https://www.emcpi.com/pi/31450' is opened in a new tab

    @TR-C205351 @automated @regression
    Scenario: Verify on clicking brand letter, respective products starting with that letter gets displayed
        When The element 'ProductListingLocators > product_listing_layout' is displayed
        And I click item '6' for element 'ProductListingLocators > brand_letter'
        Then I expect that item '6' for element 'ProductListingLocators > product_listing' is displayed

    @TR-C205350 @automated @regression
    Scenario: Default view of ProductListing Generic tab
        When I click on element 'ProductListingLocators > generic_tab'
        And The element 'ProductListingLocators > brand_letters_bar' is displayed
        Then I expect value '1' is not enabled for element 'ProductListingLocators > brand_letter'
        And I expect value '2' is enabled for element 'ProductListingLocators > brand_letter'
        And I expect that element 'ProductListingLocators > brand_letter_j_no_page' is displayed

    @TR-C205349 @automated @regression
    Scenario: Verify product link is properly accessible for Generic tab
        When I click on element 'ProductListingLocators > generic_tab'
        And I click item '21' for element 'ProductListingLocators > product_info_link'
        Then The url 'https://www.pfizerpiindex.co.uk/cibinqo' is opened in a new tab
