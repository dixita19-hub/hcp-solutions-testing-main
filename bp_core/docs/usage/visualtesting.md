Usage Instructions for Visual Testing using Boilerplate Framework
=================================================================

Boilerplate framework supports three mode of visual testing:
* <b>Standalone Visual Regression Verification</b>
    Standalone Visual Regression is a scenario, where we have one or many base and actual screenshots/images for comparison, and use boilerplate to run visual regression and output the result.
* <b>Element Visual Regression using Selenium</b>
    Scenario where we want to test a particular web element’s visual regression with a pre-defined base element image.
* <b>Full Page (non-scrolling) Visual Regression with Selenium</b>
    Scenario to check if a webpage (non-scrolling) as a whole is not visually regressed.

It has to be noted that, full scrolling page screenshot is not supported currently though we have methods to capture full scrolling page screenshots using Selenium, those methods depend on capturing images in pieces and stitching them together. These methods are not reliable enough because of below reasons:
* Image Size could not be guaranteed to be of same size as Base Image.
* In case of fixed headers, the screenshot could have fixed header in all the portions and when comparing the results from base image from design documents might give poor results.

Usage
-----

### Test Data & Results Output Folders

As part of implementation, we have defined folder structure for storing base & test images by the user or selenium screenshots in `test_data/` root folder, and diff images in `output/` root folder.

<strong>Base Images: `test_data/visualtesting/base`</strong>
<strong>Test Images: `test_data/visualtesting/test`</strong>
<strong>Diff Images: `output/visualtesting/diff`</strong>

### Images Saving Instructions

In terms of naming the image files for testing, both base and test images are to be saved with same name. Framework would pick up based on the name from respective folders and post image comparison, diffs would be saved in specified folder using the same name as of base & test images. For example, in case of standalone visual regression, captured base image would be named as, say, `MyImage.png`, which should go in to `test_data/visualtesting/base` folder. Test Image with same name `MyImage.png` would go in to `test_data/visualtesting/test` folder (In case of webpage/webelement, test screenshot would be captured during run and saved as `test_data/visualtesting/test/MyImage.png`). After performing diffing, if two images have variations, diff image with name `MyImage.png` would be saved in `output/visualtesting/diff` folder.


### Key Points
* Ensure Base Image and Test Image are of same size/resolution.
* Ensure Base Image and Test Image are of same format.
    ```python
    from PIL import Image
    img = Image.open('<give full path to image location with extension>')
    print(img.size)  # output similar to (1200, 800)
    print(img.format)  # output similar to "png", "jpeg"
    # if you wish to resize the image
    img_resize = img.resize((X, Y))  # replace X and Y with required size
    img_resize.save('full-path-to-img-location-with-extension')
    ```

### Step Definitions

1. <strong>Standalone Visual Regression</strong>

    * Should be a Scenario Outline.
    * Add a Then Step: `I verify images <name> have no visual regression`
    * Add all your image names as Examples.
    * Sample Test:

    ```gherkin
    @standalone-visual-regression
    Scenario Outline: Standalone Visual Regression
        Then I verify images '<name>' have no visual regression
        Examples:
            | name                     |
            | standalone_pfizerpro.png |
    ```

2. <strong>Web Element Visual Regression.</strong>

    * Add Then Step:

    ```gherkin
        Then I verify that element '<locator_path>' is not visually regressed:
            | base_image                  |
            | YourImageName.WithExtension |
    ```

    * Ensure that the web element to be verified is present on page using selenium steps. This step first asserts that the element to capture is available on screen to take screenshot.

    Sample Test:
    ```gherkin
    @ele-visual-regression
    Scenario: Element Visual Regression
        Given The browser resolution is '1367' per '768'
        And I am on the url 'https://bulma.io/'
        And The element 'bulma > download' is displayed
        # ..basically all other steps to display the element on page should go above..
        Then I verify that element 'bulma > download' is not visually regressed:
            | base_image        |
            | BulmaDownload.png |
    ```

3. <strong>Web Page Visual Regression.</strong>

    * Add a Then Step: 
    ```gherkin
    Scenario: Web Page Visual Regression
        # Add all selenium steps to load the required page
        Then I verify the page is not visually regressed:
            | base_image              |
            | YourImage.WithExtension |
    ```

    * Ensure required webpage is loaded and present on screen to capture screenshot.

    * Sample Test:
    ```gherkin
    @page-visual-regression
    Scenario: Full Non-Scrolling Page Visual Regression
        Given The browser resolution is '1367' per '768'
        And I am on the url 'https://www.pfizerpro.com/'
        When I click on 'pfizerpro-site > login > sign-in'
        And The element 'pfizerpro-site > login > login-button' is displayed
        Then I verify the page is not visually regressed:
            | base_image         |
            | login_page.png     |
    ```

### Running Tests
Run Tests using pytest commands with respective tags. For example:

```shell
pytest -v --tags="visual_sanity" -n=1 --variables=./configs/web_local.json --capability headless True --driver=chrome --driver-path="./binaries/webdriver/chromedriver" --html=./output/reports/ --self-contained-html
```
Post successful run, if there is a visual regression, the diff images would be captured and saved in output/visualtesting/diff folder with image names same as those of base & test (in test_data folder).

Sample Feature Files can be found at location: `frontend/codeless_project/features/visual.feature`
