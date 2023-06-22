@nondestructive @automated @test-project
Feature: Project sample site
    Sample scenarios for the test site - https://championspfizercom-preview.dev.pfizerstatic.io/

    Background:
        Given The browser resolution is '1367' per '768'
        Given I am on the url 'https://championspfizercom-preview.dev.pfizerstatic.io/'


    Scenario: Navigate to MEGS page through header
        When I click on 'sample dev site > header navigation > megs link'
        Then The page url is 'https://championspfizercom-preview.dev.pfizerstatic.io/medical-and-educational-goods-and-services-megs'
        Then The trimmed text on element 'sample dev site > page heading' is 'Medical and Educational Goods and Services (MEGS)'
