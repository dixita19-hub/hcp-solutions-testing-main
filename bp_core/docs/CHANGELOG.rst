*********
Changelog
*********


Description
===========

This Changelog contains changes for each version of this project and adheres to `Semantic Versioning`_ and uses a format based on `Keep a Changelog`_.

Types of changes include:

-	**Added** for new features.

-	**Changed** for changes in existing functionality.

-	**Deprecated** for soon-to-be removed features.

-	**Removed** for now removed features.

-	**Fixed** for any bug fixes.


3.26 - 2023-06-16 LATEST
-----------------------
**Added**

- We have added new BDD steps for UI/Mobile:

  - Boilerplate framework enables now the selection of page elements by their visible text or given attribute and value:

    - Step to select an item with given index from a searchable dropdown with placeholder, label or visible text and searched phrase
    - Step to click on element with visible text
    - Step to enter the text in the input field based on the attribute
    - Step to select the radio option with given label value
    - Step to select an item by visible text from dropdown with given placeholder or visible text

  - Step for comparing numbers: between given number and page element text number
  - Step for adding a past, current or future time value as an input field with given format
  - Step for analytics testing to enable/disable the cache

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4220911617/BP+Predefined+Steps>`_

- We have implemented new API step to facilitate sending query parameters along with the request:

    add_url_query_parameters()

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4221468863/API+Test#Step-Definitions>`_


**Changed**

- We have updated following dependencies and ensured they are consistent with the framework:

  - pytest-rerunfailures: 10.2.0 → 11.1.2
  - pytest-xdist: 2.5.0 → 3.3.1
  - python-dotenv: 0.20.0 → 1.0.0
  - pyclean: 2.2.0 → 2.7.3
  - Faker: 10.0.0 → 18.10.1


- We have updated the documentation regarding API tests:

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4221468863/API+Testing>`_

- We have updated BDD steps and functionality of analytics testing for merging json objects

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4225794055/Analytics+Testing#Merge-two-JSON-payloads-using-the-same-step>`_

- We have added an encoding format UTF-8 within the framework to ensure compatibility across different operating systems

- We have updated the documentation regarding usage of the environment variables in the framework

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4221468792/3+-+Creating+Test+Cases#Best-Practice---How-to-use-environmental-variables>`_

- As part of the Boilerplate recommendations and best practices we have updated the example workflows to support multi-word env. variables


**Deprecated**

None

**Removed**

None

**Fixed**

- Execution tests on Edge browser locally now works in headless mode
- Random string generation BDD step now properly store the value as a environment variable

**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

3.25 - 2023-05-26
-----------------------
**Added**

- We have updated and added new BDD steps for UI/Mobile:

  - Updated steps with timeout value to check if DOM attribute/CSS attribute of an element is/is not equal to a value within timeout:

    - Step to check if the CSS attribute of a element is equal given value within predefined time in seconds
    - Step to check if the CSS attribute of a element is not equal given value within predefined time in seconds
    - Step to check if the DOM attribute of a element is equal given value within predefined time in seconds
    - Step to check if the DOM attribute of a element is not equal given value within predefined time in seconds

  - Step to click on the corner of an element

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4220911617/BP+Predefined+Steps>`_

- We have implemented new API steps to facilitate the upload of files/data through API requests:

    add_files_payload(), add_data_payload()

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4221468863/API+Test#Step-Definitions>`_

- We have implemented support for API tests to be recognized within the Python test classes

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4221468863/API+Test>`_


**Changed**

- We have updated following dependencies and ensured they are consistent with the framework:

  - Appium-Python-Client: 2.2.0 -> 2.10.0
  - pytest-bdd: 5.0.0 -> 6.1.1
  - gherkin-official: 22.0.0 -> 24.1.0

- We have improved flexibility and compatibility of multiple BDD Steps so that they can now support environment variables as inputs

- We have updated the documentation regarding the usage of the conftest files and BrowserStack as part of the Boilerplate recommendations and best practices:

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4222222537/5-+Getting+Started+with+Boilerplate>`_

- We have updated a reusable GitHub action that supports now the execution of Mobile tests using Docker containers

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4278976662/Boilerplate+Docker+Image>`_

- We have updated BDD steps and functionality of analytics testing

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4225794055/Analytics+Testing>`_


**Deprecated**

None

**Removed**

None

**Fixed**

- Fix TestRail export results issue: Avoid shifting the test result with a position equals with the no of background

**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

3.24 - 2023-05-05
-----------------------
**Added**

- We have added several new BDD steps for UI/Mobile:

  - Handle CSV files BDD Steps:

    - Step to check if text inside a cell on CSV file is equal to given text
    - Step to check if text inside a cell on CSV file contains given text
    - Step to check if text inside a cell on CSV file is equal with the text of the given element
    - Step to check if text inside a cell on CSV file is contained in the text of the given element
    - Step to check if text inside a cell on CSV file does not contain any text
    - Step to check number of rows containing given text in CSV file is equal to given number
    - Step to check number of total non empty rows on CSV file is equal to given number
    - Step to get text inside a cell on CSV file and save it as environment variable with given name
    - Step to write text inside a cell in the CSV file
    - Step to create an CSV file and save it on given location

  - Step for long tap on elements for mobile apps
  - Step for swiping right/left for mobile apps
  - Step to turn-(on/off) the network connection for mobile devices
  - Step to reset and put the mobile app to background
  - Step for scrolling on the top/bottom of the page for web and mobile

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4220911617/BP+Predefined+Steps>`_

- We have added the compatibility cross-browser GitHub workflows for BrowserStack and GitHub VM
- We have integrated a reusable GitHub action that enables the execution of tests using Docker containers

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4278976662/Boilerplate+Docker+Image>`_


**Changed**

- We have made improvements to the analytics BDD steps and functionality

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4225794055/Analytics+Testing>`_


**Deprecated**

None

**Removed**

None

**Fixed**

None


**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_


3.23 - 2023-04-14
-----------------------
**Added**

- We have added several new BDD steps for UI/Mobile:

  - Handle excel files BDD Steps:

    - Step to check if text inside a cell on excel sheet is equal to given text
    - Step to check if text inside a cell on excel sheet contains given text
    - Step to check if text inside a cell on excel sheet is equal with the text of the given element
    - Step to check if text inside a cell on excel sheet is contained in the text of the given element
    - Step to check if text inside a cell on excel sheet does not contain any text
    - Step to check number of rows containing given text on excel sheet is equal to given number
    - Step to check number of total non empty rows on excel sheet is equal to given number
    - Step to get text inside a cells on excel sheet and save it as environment variables
    - Step to get text inside a cell on excel sheet and save it as environment variables with given name
    - Step to write text inside a cell on excel sheet
    - Step to Create an excel file and save it on given location
    - Step to Delete an excel file with given name

  - Evaluating the values of a dropdown element
  - Storing current URL as an environmental variable
  - Adding current date as a value of an input element
  - Adding random future or past date as a value of an input element

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4220911617/BP+Predefined+Steps>`_

- We have added a Dockerfile and example workflows that make use of the Boilerplate framework inside a Docker container

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4278976662/Boilerplate+Docker+Image>`_


- We have added video recordings and documentation updates as part of the Boilerplate recommendations and best practices:

  `UI/API Cross Testing <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4264820849/UI+API+Cross-Testing>`_ |
  `GitHub Actions and workflows <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/3335684214/GitHub+Actions>`_ |
  `Getting Started <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4221468778/1+-+Introduction>`_ |
  `API Testing <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4221468863/API+Test>`_ |


**Changed**

- We have modify BDD step: "I clear text using keys from field '(?P<locator_path>.*)'" to support now Android and iOS as well
- We have updated BDD steps and functionality of analytics testing

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4225794055/Analytics+Testing>`_


**Deprecated**

None

**Removed**

None

**Fixed**

None


**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_


3.22 - 2023-03-24
-----------------------
**Added**

- We have added several new BDD steps for UI/Mobile and e2e (Web+API):

  - Handle browser tabs BDD steps:

    - Step to open new tab with given url
    - Step to switch to specific tab
    - Step to reload current tab/page
    - Step to close specific tab

  - Handle web table elements BDD steps:

    - Step for evaluating the headers of the table
    - Step for evaluating the content of a column
    - Step that evaluates that a value exist in a column

  - Integration of the UI and API BDD steps:

    - Step to send API request and store a response
    - Step to compare a response of the API request and text of the web element

  - Step for generating a random string or number
  - Step to write the value of an environment variable to local '.local.env' config file
  - Step for clicking elements without defining the Xpath

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/3971580046/HTML+Reports+using+pytest-html#4.-Rename-the-HTML-report-based-on-an-Environment-variable-value>`_

- We have included a sample workflow on Github to run tests with Edge locally on GH Runner

  More info: `here <https://github.com/pfizer/python-test-automation-boilerplate/tree/master/.github/workflows/edge_cloudflare_local.yml>`_

- We have added video recordings as part of the BP documentation and best practices:

  `BP installation <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4221468778/1+-+Introduction>`_ |
  `How to perform BP update <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4035182696/BOILERPLATE+-+IMPORTANT+Update+procedure#Boilerplate-update-video-recordings>`_ |
  `BP Architecture <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/3335651333/PYTEST+ARCHITECTURE+-+Boilerplate>`_ |
  `How to use BP predefined steps <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4221468834/UI+Test#Video---How-to-use-BP-Predefined-Steps>`_


**Changed**

None


**Deprecated**

None

**Removed**

- We have removed the old legacy framework files and code

**Fixed**

None


**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

3.21 - 2023-03-03
-----------------------
**Added**

- We have added the option to rename the HTML report for a test run.

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/3971580046/HTML+Reports+using+pytest-html#4.-Rename-the-HTML-report-based-on-an-Environment-variable-value>`_

- We have added a support to test Adobe analytics with a generic step

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4225794055/Analytics+Test>`_

- We have added new BDD steps:

  - Step to upload a file for web tests

        For Example:
        When I attach file 'test_data/image.jpeg' to input field 'file > add_file_input'

  - Step for navigating back using browser back arrow button

  - Step to store an element's text between two boundaries to an environmental variable

    More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4220911617/BP+Predefined+Steps>`_



**Changed**

- **[IMPORTANT]** With the release of BP 3.21, the framework's structure has undergone a significant change. The framework's core files, are now aggregated within the newly created bp_core folder.

  This change requires a new update procedure: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4035182696/BOILERPLATE+-+IMPORTANT+Update+procedure+for+BP+versions+before+3.15+and+following+releases>`_



**Deprecated**

None

**Removed**

None

**Fixed**

None


**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

3.20 - 2023-02-10
-----------------------
**Added**

- We have added a new BDD step that prints out the environment variable's value and incorporates it into the HTML report under the environment section

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4164517942/Predefined+Steps>`_

- We have implemented an automated update manager for webdrivers (for Chrome and Firefox) which will automatically always detect any version mismatch between the user's webdriver and their browser, and auto-update the webdrivers if necessary to the latest available version before the test begins.


**Changed**

- We have upgraded the TestRail plugin, providing users with the ability to upload API test results in the similar manner as with UI tests

  More info: `here <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4083188001/Test+runs+and+results#API---Exporting-results-using-the-CLI-command>`_

- We have improved the HTML reports for API tests so that users can access requests and responses data on demand

    For Example:
    set_request_endpoint(request, ..., with_logs=True)


**Deprecated**

None

**Removed**


**Fixed**

- Firefox dropdown issue on BDD Step: "I select the value '<any>' from dropdown '<any>'"
- Issues with Safari and Firefox browsers for BDD step: "I wait for maximum <number> seconds, and I click on '<string>'"


**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_


3.19 - 2023-01-20
-----------------------
**Added**

- We have added support for the soft assertions for web and mobile. Please refer to the README.md file "Predefined Steps" section for more details


**Changed**

- We adjusted the logging configuration to prevent any redundant warning messages while waiting for the element to become visible


**Deprecated**

None

**Removed**

- Old GitHub workflow


**Fixed**

None


**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_


3.18 - 2022-12-16
-----------------------
**Added**

- We have added example regression tests for visual testing.

**Changed**

- Updated lib:
    - Pillow==9.3.0

- GH workflows
    - Updated to use 'random' instead of hardcoded string for BS local_identifier. Removed the local_identifier from config json and passed the same in CLI

**Deprecated**

None

**Removed**

None

**Fixed**

- https://github.com/pfizer/python-test-automation-boilerplate/issues/519


**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_


3.17 - 2022-11-25
-----------------------
**Added**

- Tag by type for all steps from the frontend's steps_common.py file
- Workflow to help to remove old GH job runs
- Libraries support in requirements.txt: beautifulsoup4 == 4.11.0 and polling == 0.3.0


**Changed**

- HTML reports improvements
- Logging mechanism visual improvements and use of plain traceback in case of test failure


**Deprecated**

None

**Removed**

None

**Fixed**

- https://github.com/pfizer/python-test-automation-boilerplate/issues/485
- https://github.com/pfizer/python-test-automation-boilerplate/issues/454
- https://github.com/pfizer/python-test-automation-boilerplate/issues/505

**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_


3.16 - 2022-11-04
-----------------------
**Added**

None

**Changed**

- Upgraded libraries
    - pytest-base-url == 2.0.0
    - pytest-selenium == 4.0.0
- Moved installation related scripts and tests to new folder called 'installation'

**Deprecated**

None

**Removed**

None

**Fixed**

- https://github.com/pfizer/python-test-automation-boilerplate/issues/452

**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_


3.15 - 2022-10-14
-----------------------
**Added**

- API Testing Framework using 'requests'
- BDD Step to take a screenshot during the Scenario
- New Column in HTML Reports to display a Test Case tag
- Support for TestRail type #1

**Changed**

- Root structure of the project
    - frontend - it contains UI tests (Web & Mobile)
    - backend - it contains API tests
- HTML reports improvements

**Deprecated**

None

**Removed**

- API Testing using BDD

**Fixed**

None

**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_


3.14 - 2022-09-23
-----------------------
**Added**

- Best practice recommendation for avoiding using static waits as steps

- Support for TestRail interaction type #1

**Changed**

- HTML Reporting Enhancements

**Deprecated**

None

**Removed**

None

**Fixed**

None

**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

3.13 - 2022-09-02
-----------------------
**Added**

None

**Changed**

- Test Reporting Enhancements
- Mobile Applications - Pre-defined steps improvements

**Deprecated**

None

**Removed**

None

**Fixed**

- Earlier, Background from feature file was not getting exported to testrail. We have fixed Background to be exported in the testrail as "PreConditions" - `<https://github.com/pfizer/python-test-automation-boilerplate/issues/23>`_

- For security reasons, we have improved the way automated tests are ran via Browserstack (both Web and Mobile). This is a mandatory change for all the teams and they have to - `<https://github.com/pfizer/python-test-automation-boilerplate/issues/398>`_ :

    - remove the selenium-port attribute from CLI command

    - when running within BS, make sure that the attribute "browserstack" is set to "True" within capabilities files

**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

3.12 - 2022-08-12
-----------------------
**Added**

None

**Changed**

- Refactored Cookie related step definitions

**Deprecated**

None

**Removed**

None

**Fixed**

- We have added new GitHub Workflows for Edge and Safari browsers for running web test cases

**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

3.11 - 2022-07-25
-----------------------
**Added**

- We have added capabilities logs on the TestRail reports used for each test. You can find them on top of the test result.

- We have added new GitHub Actions workflow templates

- All predefined steps have been adapted in order to be used for mobile automation too (for the steps that are applicable now)

- The mobile strategy that is currently supported within BoilerPlate is fully implemented and documented in Confluence.

- Removed the usage of toml(files & methods) from the framework

**Changed**

- Changed the logic to create locator json file under locator directory. It can be created by any name under sub directories as well if needed.

- Change the toml files to Json files for API test cases and collections in the test_data folder

- Change the toml parser logics to Json parser as applicable in the framework

**Deprecated**
None

**Removed**

- Removed toml parser related files and methods from the framework

- Removed screenshots/base folder

- Removed steps_custom.py file
    - Removed sitemap related step definitions from the framework
    - Adjusted other steps in the steps_common.py file

- Removed device-matrix from the framework
    - We will be using CLI commands for test execution
    - Refactored conftest.py and capabilities

- Removed App.py file while considering the hybrid testing strategy for mobile apps

- Clean up activities:
    - Removed page_objects directory and files from ./common/ui location
    - Removed notable-changes directory from ./docs location

**Fixed**
- https://github.com/pfizer/python-test-automation-boilerplate/issues/363

**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

3.10 - 2022-07-01
-----------------------
**Added**

We added a way to use the same step definition for clicking both WEB or Mobile element:

 - Performing a step in the web view context:
    When I click on button 'patient_info > item'
        "item" : "{web-locator}"

 - Performing a step in the mobile context:
    When I click on button 'patient_info > item_mob'
        "item" : "{mobile-native-locator}

**Changed**

- Changed the requirements.txt from range of versions to fixed version for all packages

- Moved all env variables to .local.env file from envconf.toml file. With this change now .local.env file is going to be part of BP repo.

- pytest.ini file will be a part of BP repo.

- Changed the conftest.py file. We have commented and structured in code blocks for better understanding and readability

- We came up with a solution to handle the situations where we have different locators between Android & iOS using the same step definition. In order to do this, you have to use "_os_locator" as a suffix to your locator. For example:

    **Before**

        - For Android: When On android, I click on button 'home_page > yes_button_android'

        - For iOS: When On iOS, I click on button 'home_page > yes_button_ios'

    **After**

        - When I click on button 'home_page > yes_button_os_locator'

    Then in the locators files you will have two specific platform locators:

         - "yes_button_android": "..."

         - "yes_button_ios": "..."

- Currently we support 2 methods for scrolling for an element:

     - WEBVIEW context -> steps_common.py: scroll_to_element()

        We scroll for finding an element as long as it is present in the DOM.

        - As a limitation: this method won't work for shadow elements, there is an open issue for Appium in regards of this.

     - NATIVE context -> steps_common.py: scroll_to_native_element()

        This method can be used for the above limitation / any other cases where we need native context for scroll. It receives as a parameter the number of iterations that should be done until the element becomes visible

- All the locators have been moved to sample_locators.json file from sample_locators.toml file.

- We refactored the pre-defined steps:

    - All GIVEN, WHEN & THEN steps are now moved to the steps_common.py file
    - We created an explicit structure based on the types of actions for the steps
    - All GIVEN steps are now accessible with WHEN keyword too
    - All WHEN steps are now accessible with GIVEN keyword too

**Deprecated**
None

**Removed**

- Removed envconf.toml file from the framework
- test_data folder clean up:
    - API: Removed *.toml files

    - Visual testing: Removed screenshots files, updated docs

- Removed README.rst file. We have added the relevant information to README.md

- Removed the sample_locators.toml file from the framework

- Removed steps_given.py, steps_when.py and steps_then.py from the framework

**Fixed**
None

**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

3.9 - 2022-06-10
-----------------------
**Added**

- Added new pre-defined steps for iframe automation.
    `@when(parsers.re("I switch to iframe '(?P<locator_path>.*)'")` - Switch to iframe

- Added new pre-defined steps for clearing text box using action keys.
    `@when(parsers.re("I clear text using keys from field '(?P<locator_path>.*)'"))` - Using action keys we can clear
    the text box in case clear() method doesn't support

- Added new step definition file (./common/ui/step_definitions/steps_common)
    It includes the set of steps having multiple Gherkin keywords
    `@given(parsers.re("The element '(?P<locator_path>.*)' is displayed"))
    @when(parsers.re("The element '(?P<locator_path>.*)' is displayed"))
    @then(parsers.re("The element '(?P<locator_path>.*)' is displayed"))`

- Added new section as "Frequently Asked Questions" in the README.md file
    This will help you find common issues faced while doing setup configuration and cloning boilerplate framework

- Added new section as "Boilerplate Update" in the README.md file
    It has guidelines to update the boilerplate framework

**Changed**

- Changed Testrail configuration files from pytest.ini to envconf.toml & .localenv file
    When you update to BP 3.9 version please store your pytest.ini and .local.env first and then remove these files before running install.sh script. It will regenerate files with current structure. TestRail data will be stored in .local.env and envconf.toml files. Please fill your TestRail data in these files. More info in the README.md file (TestRail Interaction section).
- Changed the logic in order to automatically determine the platform name without having it passed within the CLI command
    **Before**: python -m pytest -s -v -p no:randomly --disable-warnings --device-matrix "configs/ios_browserstack.json" --tags "mobile-sanity" --platform "iOS"

    **After**: python -m pytest -s -v -p no:randomly --disable-warnings --device-matrix "configs/ios_browserstack.json" --tags "mobile-sanity"

**Deprecated**
None

**Removed**

- Removed run_tests.sh file from the framework
    We have removed run_tests.sh file to execute the test cases. You can use CLI command for the test execution.
    Refer "Installation" section for cloning and executing test cases from Boilerplate framework.

**Fixed**

- `<https://github.com/pfizer/python-test-automation-boilerplate/issues/308>`_

- Fixed exception handling in the is_element_invisible method

- Fixed a method to fetch Environment variable's value when passed as key/value data in Headers request.

**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

3.8 - 2022-05-20
-----------------------
**Added**

- Added new pre-defined steps for mobile automation.
    `@when(parsers.re("I swipe down to element '(?P<locator>.*)'"))` - Scroll down until element is visible
    `@given(parsers.re("The app is launched"))` - For re-launching the app whenever required

- New capability added for BrowserStack in mobile test execution.
    Added `"browserstack.appium_version"` capability in android_browserstack.json and ios_browserstack.json config files
    to avoid BS selecting random appium version

**Changed**

- Refactored the context switching method in Mobile automation.
    Added a utility method under common → mob → lib → utils → context.py to handle context switching in a systematic way.

- Added support for multiple configurations in mobile config json file
    Previously we did not have support for passing multiple set of configurations in device-matrix json file for mobile automation
    In this release we have added support for multiple set of configurations. Changes are done in device-matrix json files and conftest.

**Deprecated**
None

**Removed**
None

**Fixed**
None

**Known Issues**
- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_


3.7 - 2022-04-29
-----------------------
**Added**
None

**Changed**

- Executable path has been fully removed from Boilerplate.
    Service Class object is used for passing driver path. For this the teams will have to update their conftest.

- Desired capabilities partially removed:
    Options class is replacing Desired Capabilities in Local execution flow. For this the teams will have to update their conftest.
    Desired capabilities is still being used for BrowserStack flow. For us to be able to remove Desired capabilities fully we will have to wait for BrowserStack and Selenium integration flow implements the new Option class solution.

**Deprecated**
None

**Removed**

- Removed below Shadow element specific step definitions from file `steps_custom.py` which were deprecated in Release 3.4. Use corresponding
available step definitions instead
    "The shadowElement '(?P<locator_path>.*)' text is '(?P<text>.*)'"
    "I set text '(?P<text>.*)' to shadowField '(?P<element_path>.*)'"
    "ShadowElement '(?P<locator_path>.*)' style should be:(?P<data_table>.*)"
    "I hover over shadowElement <locator_path>"
    "I click on shadowElement <locator_path>"

**Fixed**

- Fixed GH issues
    `find_elements() method for shadow elements <https://github.com/pfizer/python-test-automation-boilerplate/issues/267>`_
    `Handled installation of chrome driver based on chrome version mentioned in config file(latest by default) <https://github.com/pfizer/python-test-automation-boilerplate/issues/255>`_
    `Implement step for mobile app launch <https://github.com/pfizer/python-test-automation-boilerplate/issues/289>`_


**Known Issues**

- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

3.6 - 2022-04-08
-----------------------
**Added**

- Enhancement of mobile applications predefined steps

- Support execution of mobile applications test on Browserstack

**Changed**
None

**Deprecated**
None

**Removed**
None

**Fixed**

- Fixed GH issue `Regression issue with find_elements <https://github.com/pfizer/python-test-automation-boilerplate/issues/268>`_

- Fixed Scenario Outline export test cases and test results in the test rail

**Known Issues**

- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

**Note**
- Please uninstall allure-pytest before running install.sh.

3.5 - 2022-03-17
-----------------------
**Added**
- Support for automation of Mobile Apps - With release/3.5, boilerplate framework can be used for automation of mobile applications with codeless_approach. Currenty support is limited
  to LOCAL run only.. In this release only the basic steps like tap, swipe, verify has been covered. Refer the document for creating feature files and locator files.
  `Mobile Automation <https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/3730538729/BP+with+Appium+Mobile+Android+iOS>`_

- Support for specifying file download location for webdriver session for CHROME - An environment variable 'DOWNLOAD_DIR' is added to configs/envconf.toml file which will be used automatically by
  webdriver instance to download the files as part of test case.

- Added two new pre-defined steps for handling dropdown elements for elements without select tag.

**Changed**
None

**Deprecated**
None

**Removed**
None

**Fixed**
- Fixed GH issue `base_url_fix <https://github.com/pfizer/python-test-automation-boilerplate/issues/247>`_

**Known Issues**

- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_

3.4 - 2022-02-25
----------------
**Added**
- Specify locators in `.toml` file - Ability to specify locators in a `.toml` file, in addition to `.json` file format
  that was supported throughout. This change is intended to bring in a file format that would be readable and easy to handle, and at the same time, serializable to python dictionary object, similar to `json` files.

- Support multiple locator types - Support for all selenium-supported locator types for element identification
  (ID, Class Name, Tag Name, Name, CSS Selector, Link Text, Partial Link Text and XPath). Prior to 3.4, boilerplate framework
  supported only XPath locator. This change brings in a new "syntax" for specifying locators in *locators.json|.toml files.

**Changed**
- Handling Shadow elements - In addition to syntactic difference to locators, boilerplate framework also made changes in
  interacting with shadow elements. Prior to release/3.4, framework had different step defs/methods for normal elements vs shadow
  elements. With this release, there would be one step def/method to perform an action on an element, irrespective of them being shadow or normal,
  unless and otherwise specifically mentioned as exceptions. Step Definitions and Selenium Generics Methods catering specifically to shadow elements (shadow_click, find_shadow_element, etc.) are deprecated with this release,
  and users would get a DeprecationWarning on usage. These methods are slatted for removal in v3.6.

  With release/3.4, we have upgraded to `Selenium4`, there is no user action required, but note some deprectation warnings, which will be dealt in future bp versions.

**Deprecated**
None

**Removed**
None

**Fixed**
None

**Known Issues**

- `Open Issues <https://github.com/pfizer/python-test-automation-boilerplate/issues>`_
