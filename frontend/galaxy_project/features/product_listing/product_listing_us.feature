@nondestructive @product_listing_us @usabove
Feature: US Galaxy Automated Regression - Product Listing (Tellus)

    Background:
        Given I am on the page '/'
        And Browser is maximized
        When I click on item 'USAbove > products_menu'
        Then I expect that the title is 'Product Listing | Pfizer For Professionals'


    @TR-C205360 @automated @regression @checkpl
    Scenario: Default view of US ProductListing page
        When The element 'ProductListingLocators > product_listing_layout' is displayed
        Then I expect value '2' is not enabled for element 'ProductListingLocators > brand_letter'
        And I expect value '3' is enabled for element 'ProductListingLocators > brand_letter'
        And I expect that element 'ProductListingLocators > brand_letter_j_no_page' is displayed

    @TR-C205359 @automated @regression
    Scenario: Verify that brand letter for US Products listing gets disabled after clicking on it
        When The element 'ProductListingLocators > product_listing_layout' is displayed
        And I click item '4' for element 'ProductListingLocators > brand_letter'
        Then I expect value '4' is not enabled for element 'ProductListingLocators > brand_letter'

    @TR-C205358 @automated @regression
    Scenario: Verify product links for US products are properly accessible from hcp site link
        When The element 'ProductListingLocators > product_listing_layout' is displayed
        And I click item '1' for element 'ProductListingLocators > hcp_site_link'
        Then The url 'https://benefix.pfizerpro.com/' is opened in a new tab

    @TR-C205357 @automated @regression
    Scenario: Verify product links for US products are properly accessible from patient site link
        When The element 'ProductListingLocators > product_listing_layout' is displayed
        And I click item '1' for element 'ProductListingLocators > patient_site_link'
        Then The url 'https://www.benefix.com/' is opened in a new tab

    @TR-C205356 @automated @regression
    Scenario: Verify product links for US products are properly accessible from prescribing info link
        When The element 'ProductListingLocators > product_listing_layout' is displayed
        And I click item '1' for element 'ProductListingLocators > prescribing_info_link'
        Then The url 'https://labeling.pfizer.com/showlabeling.aspx?id=492' is opened in a new tab

    @TR-C205355 @automated @regression
    Scenario: Verify on clicking brand letter for US products, respective products starting with that letter gets displayed
        When The element 'ProductListingLocators > product_listing_layout' is displayed
        And I click item '7' for element 'ProductListingLocators > brand_letter'
        Then I expect that item '7' for element 'ProductListingLocators > product_listing' is displayed
