@nondestructive @pet @usabove @sitemap
Feature: Official sites load urls
    Check deployment using real HCPP sites
    
    Background: Set browser
        Given I am on the page '/'
        And The browser resolution is '1920' per '1080'

    @automated @TR-C357121 @sitemap-pro
    Scenario: Check HCPP site still load using sitemap URLs
        When I fetch all urls from external site '/' sitemap
        Then Sitemap urls are fetching