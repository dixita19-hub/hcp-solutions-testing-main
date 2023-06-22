Python Test Automation Boilerplate
==================================

<hr />
<details open>
    <summary><strong>Table of Contents</strong></summary>
    <ol>
        <li><a href="#about-the-project">About The Project</a></li>
        <li><a href="#getting-started">Getting Started</a>
            <ol type="I">
                <li><a href="#prerequisites">Prerequisites</a>
                    <ol type="i">
                        <li><a href="#windows">Windows</a></li>
                        <li><a href="#macos">MacOS</a></li>
                    </ol>
                </li>
                <li><a href="#installation">Installation</a></li>
                <li><a href="#executing-test-cases-in-local-machine">Executing Test Cases in Local Machine</a></li>
            </ol>
        </li>
        <li><a href="#usage">Usage</a>
            <ol type="I">
                <li><a href="#web-automation">Web Automation </a></li>
                <li><a href="#mobile-app-automation">Mobile App Automation </a></li>
                <li><a href="#visual-automation">Visual Automation </a></li>
                <li><a href="#api-automation">API Automation </a></li> 
                <li><a href="#predefined-steps">Predefined Steps </a></li>
                <li><a href="#testrail-interaction">Testrail Interaction </a></li>
                <li><a href="#browserstack-interaction">Browserstack Interaction </a></li>
                <li><a href="#html-test-reports">Html Test Reports </a></li>
            </ol>
        </li>
        <li><a href="#best-practices">Best Practices</a></li>
        <li><a href="#boilerplate-update">Boilerplate Update</a></li>
        <li><a href="#changelog">Changelog</a></li>
        <li><a href="#frequently-asked-questions-faq">Frequently Asked Questions (FAQ)</a></li>
        <li><a href="#troubleshooting-guide">Troubleshooting Guide</a></li>
        <li><a href="#contributing">Contributing</a></li>
    </ol>
</details>
<hr />

About the Project
-----------------
The Python Test Automation Boilerplate contains reusable content, which will enable you to test web, hybrid, progressive
web and mobile apps on web and mobile platforms.

### IMPORTANT Update procedure for BP versions before 3.21

Starting with the BP release/3.21, the framework’s main structure has been changed. Due to this change, this update is <b>MANDATORY</b> before updating to further BP versions.    

There is a procedure to update your existing Boilerplate release version to newer one.

- For Boilerplate's update to **release/3.21**, please [follow this procedure](https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4035182696/BOILERPLATE+-+IMPORTANT+Update+procedure+for+BP+versions+before+3.15+and+following+releases#Update-procedure-for-BP-version-3.21-onwards).

### Versions

|     Version #     |   Support Status    |
|:-----------------:|:-------------------:|
| 3.22 **(LATEST)** | **YES<sup>^</sup>** |
|       3.21        |  **YES**            |

*<sup>^</sup> Recommended to upgrade to version 3.22*

### Supported Hardware/Software Information

| OS                 | Version  | Architecture        | Python Version<sup>*</sup> |                             Browsers                              |
|:------------------:|:--------:|:-------------------:|:--------------------------:|:-----------------------------------------------------------------:|
| Windows            | 10       | x86_64              |           3.9.12           |         Chrome (LATEST), Firefox (LATEST), Edge (LATEST)          |
| MacOS              | 10.15+   | **i386**, **arm64** | 3.9.12                     | Chrome (LATEST), Firefox (LATEST), Edge (LATEST), Safari (LATEST) |
| Ubuntu<sup>^</sup> | 18.04+   | x86_64              |           3.9.12           |         Chrome (LATEST), Firefox (LATEST), Edge (LATEST)          |

<i><sup>^</sup> Runs in Github Actions only. No consumer usage support.</i>
<i><sup>*</sup> No Support on Python 3.10, yet.</i>

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

Getting Started
---------------

### Prerequisites

This document assumes that user has:

* A valid github account & access to Pfizer org in github.
* Access to `python-test-automation-boilerplate` repository, and/or additional test repositories.
* Finished setting up SSO & 2FA, commit signing, and SSH/Personal Access Tokens to commit/pull/push changes to the repo.
* Have installed your favourite IDEs (VSCode - it's recommended, Pycharm - the license is not paid by Pfizer, etc.) and/or setup your terminal for development environment.

If above points aren't done yet, please follow this page on setting them
up: [Accessing Pfizer's repositories within GitHub][accessing-pfizer-repo].

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

#### Windows

*Recommended terminal application is GitBash*

For Windows machine setup, there is a well-written article hosted on Sharepoint describing the steps to be followed.
Please go through the document for setting up your machine for automation

- [Setting up your Pfizer test environment within Windows](https://pfizer.sharepoint.com/sites/DSEQualityTest/SitePages/Setting-up-your-Pfizer-test-environment-within-Windows.aspx)

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

#### MacOS

1. <u><strong>Homebrew</strong></u>

   Make sure that `homebrew` is successfully installed. Check if it is already installed by typing `brew --version` in
   your terminal. You should see output similar to below lines, if it is already installed
    ```shell
    Homebrew 3.2.10
    Homebrew/homebrew-core (git revision a96ad44067; last commit 2021-08-31)
    ```
   If not installed, please follow below instructions to install. Detailed Instructions
   here: [HomeBrew Installation](https://brew.sh/)
    ```shell
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
   After successful installation, execute following command (Only if you are on OSX 10.14, otherwise skip this step. Read more info [here](https://developer.apple.com/forums/thread/122762)).
    ```shell
    sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
    ```
2. <u><strong>Xcode Command-line Tools</strong></u>

   Ensure to have Xcode CLI tools installed. Check if it is already installed using command `xcode-select --version`. If
   it is successfully installed, you would see output similar to this: `xcode-select version 2384.` If not already
   installed, install by typing command `xcode-select --install` in terminal.

3. <u><strong>Git</strong></u>

   Most Mac Machines come with latest version of Git pre-installed. Check if you have git installed in your system by
   typing below command in your terminal
    ```shell
    git --version
    # you should see output similar to below if installed.
    git version 2.30.1
    ```
   If not already installed, execute command `brew install git` to install latest git version. After successful
   installation, check for the git version number using command `git --version`.

4. <u><strong>Python</strong></u>

   *Recommended Version of Python: 3.9.12*

   Though Mac comes pre-installed with Python 2.7 and Python 3 (mostly 3.6+), we would not want to 'disturb' the system
   python versions. Its best to leave it undisturbed. We would use `pyenv` to install latest version of Python by
   following below instructions. Detailed Instructions here: [pyenv](https://github.com/pyenv/pyenv)

   *For any issues faced during installation, please refer pyenv GitHub [here](https://github.com/pyenv/pyenv)*

    ```shell
    brew update
    brew install openssl readline sqlite3 xz zlib

    # Any issues encountered during execution of above command, please refer here: `https://github.com/pyenv/pyenv/wiki/Common-build-problems` for possible solutions/workarounds

    # pyenv-installer
    curl https://pyenv.run | bash

    # Restart Shell
    exec $SHELL

    # Verify pyenv is installed successfully
    pyenv --version


    # If you get issues with running above command, ensure the paths are properly set. Run below commands
    # Note: If you source bashrc in profile, then first two lines should come before the line which sources, `source ~/.bashrc` and last line should be at the bottom of the file.
    # If you are using `zsh`, replace .profile with .zprofile, and .bashrc with .zshrc

    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
    echo 'eval "$(pyenv init --path)"' >> ~/.profile'
    echo 'eval "$(pyenv virtualenv-init --path)"' >> ~/.profile'

    # Also add following lines to .zshrc (if your shell is zsh)
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    # Close the file and source it
    source ~/.zshrc

    # Verify Installation
    username@hostname ~ % exec $SHELL
    username@hostname ~ % pyenv --version

    # Install latest available version of python
    username@hostname ~ % pyenv install 3.9.12
    username@hostname ~ % pyenv global 3.9.12
    ```

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

### Installation

1. <u><strong>Clone Boilerplate Project</strong></u>
   Clone the Boilerplate `master` branch from Github to your local machine by following below instructions.

    ```shell
    mkdir workspaces && cd workspaces
    git clone https://github.com/pfizer/python-test-automation-boilerplate.git
    # alternatively, you could use ssh link if you have setup ssh in your work machine.
    ```

2. <u><strong>source install.sh</strong></u>
   After successful cloning, execute below commands to install BoilerPlate.

    ```shell
    cd python-test-automation-boilerplate/
    source install.sh

**_IMPORTANT_NOTE:_** In case the installation is not successful, please refer the troubleshooting link here [Troubleshooting doc](https://github.com/pfizer/python-test-automation-boilerplate/blob/master/bp_core/docs/troubleshooting.md)

3. <u><strong>Activate your Virtual Environment</strong></u>
   In the above step using source install.sh automatically activates the virtual environment.
   For eg: After installation you will see the following.Yet another Important Note: Please activate virtual environment
   using command ". /Users/username/.bp-venv/bin/activate" while running test cases from new shell. Need not activate
   now, since it is already activated.

   (.bp-venv) username@hostname python-test-automation-boilerplate %

   If Virtual Environment has to be activated without the installation step i.e once initial installation is completed
   then following command is used
    ```shell
    #Command Line for MAC
    source /Users/username/.bp-venv/bin/activate

    #Command Line for Windows
    source /Users/username/.bp-venv/Scripts/activate
    ``` 


4. <u><strong>Setup Environment Variables in `.local.env` & `pytest.ini` files</strong></u>
   After successful installation, check and update `configs/.local.env` and `pytest.ini` files with relevant details.


5. <u><strong>Appium setup for Mobile apps</strong></u>
   With release/3.5, we are bringing in support for mobile application automation in boilerplate.

   Please refer the below document for the setup:

   [Appium Prerequisites](https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/3736764621/Appium+Prerequisite)

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

### Executing Test Cases in Local Machine

Users can invoke **`pytest`** command to run test cases locally, with required arguments, as appropriate. Applicable
command line arguments to be passed to `pytest` command:

1. **`--driver=<test-browser-name>`**
   This should be passed **mandatorily** while running UI/selenium test cases. Test Browser name would be`chrome`
   or `firefox`, as per the test needs.
2. **`--driver-path=<path-to-driver>`**
   Mandatory CLI argument passed in conjunction with `--driver` option, and full/relative path to the driver executable
   should be passed. While setting up boilerplate framework, `chromedriver` and `geckodriver` would be saved in
   locations `./binaries/webdriver/chromedriver|.exe` and `./binaries/webdriver/geckodriver|.exe` respectively.
3. **`--locators=<path-to-locator-files>`**
   Framework, by default. looks for all the valid<sup>*</sup> locator files inside project root folder recursively.
   However, user can also provide specific folder/locator file to be used for the tests.
4. **`--language=<en|fr|etc.>`**
   Application Language, used in context of UI testing (selenium)
5. **`--proxy-url=<proxy-url>`**
   The proxy to be used by any network request - browser or otherwise.
6. **`--capability <individual-capability-value>`**
   Additional individual capabilities can be set using the --capability command line arguments. 
   As an example, for setting the run in a headless mode you will have '--capability headless True'
7. **`--variables <capabilities.json>`**
   To specify multiple capabilities, you can provide a JSON file on the command line using the pytest-variables plugin.
8. **`--tags=<tag name>`**
   This is the gherkin tag name mentioned in the feature file, to filter the tests. Some of the pre-defined sample tags
   that can be used for testing are:
    * `sample-ui-tests`
    * `sample-visual-demo`
    * `sample-api-collection-demo`
    * `sample-api-verbose-demo`
9. **`--gherkin-terminal-reporter`**
   To be used to override the default pytest terminal report, and display in gherkin format (from `pytest-bdd` plugin).
10. **`--html=<path-to-html-output> --self-contained-html`**
    To generate html report (from `pytest-html` plugin). To see full log output in the html report avoid `-s` argument in the same time.
11. **`-n <number-of-threads>`**
    To run tests with multiple number of threads in parallel (from `pytest-xdist` plugin).

Sample `pytest` invocation to run all sample ui tests in Chrome browser with 3 threads in parallel:

```shell
pytest -v --driver=Chrome --driver-path=./binaries/webdriver/chromedriver --capability headless True --tags=sample-ui-tests -n=3
```

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

Usage
-----

### Web Automation

Refer the document for details: [UI Testing](https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/3828645947/Creation+of+UI+Test+cases+using+Codeless+vs+Custom+feature+of+Boiler+plate)

### Mobile App Automation

Refer the document for details: [Mobile App Testing](https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/3864821873/Mobile+Apps-+Running+test+cases+on+Local+Machine+with+Emulators+Simulators+and+with+BrowserStack)

### Visual Automation

Refer the document for details: [Visual Testing](https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4221468906/Visual+Test)

### API Automation

Refer the document for details: [API Testing](https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4221468863/API+Test)

### Predefined Steps

Refer the document for details: [Predefined Steps](https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4220911617/BP+Predefined+Steps)

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

### Testrail Interaction

Ensure to set/update following details in `configs/.local.env` file before interacting with testrail.

> **_IMPORTANT_NOTE:_** If you are updating to BoilerPlate v3.10 or newer make sure to store your TestRail related
> configs in '.local.env' file.
> The reason for that is BoilerPlate releases up to v3.8, all TestRail related configs were stored in 'pytest.ini' file.
> With current release all TestRail data are stored in the file mentioned below:
>
>.local.env

```
TESTRAIL_EMAIL=[email of user to be used for communication]
TESTRAIL_KEY=[key of user to be used for communication]
TESTRAIL_URL=[URL of TestRail instance]
TESTRAIL_PROJECT_ID=[project id to which the data is sent]
JIRA_PROJECT_KEY=[Jira project key for integration with Jira]
```

1. <strong><u>Export Test Cases</u></strong>

   **To import/update test Scenarios for ALL feature files**
    ```shell
    python -m pytest -v --pytest-testrail-export-test-cases --pytest-testrail-feature-files-relative-path "[path-to-features-dir]"
    ```
   **To import/update test Scenarios for INDIVIDUAL .feature file**
    ```shell
    python -m pytest -v --pytest-testrail-export-test-cases --pytest-testrail-feature-files-relative-path "[DIR_NAME]/[FILE_NAME].feature"
    ``` 

2. <strong><u>Export Test Results</u></strong>

#### For TestRail type 3:
#### Create Test Plan in TestRail

- You have to manually create the test plan in TestRail
    - Naming convention: [JIRA_PROJECT_NAME]_[SPRINT_NAME]_[MARKET] - MARKET only if applied
        - eg: *JIRA_Sprint-1_us* or *JIRA_Regression_us*
- Then add the Test Suite to the test plan (While exporting tests, it automatically creates a testsuite)
- Add a configuration to the test suite and then run below command
    ```shell
    # Mandatory Parameters
    # pytest-testrail-test-plan-id : Testrail Plan ID
    # pytest-testrail-test-configuration-name: Testrail Configuration Name

#### For TestRail type 1:

Please refer for more details to this document: [Test Rail type #1 - How to export test cases & publish test results](https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/3963125816/Test+Rail+type+1+-+How+to+export+test+cases+publish+test+results)

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

### Browserstack Interaction

#### Browserstack execution through command line params

Run tests on different browsers using the below command:
```shell
# Usage example for Windows 11 - Chrome
username@hostname python-test-automation-boilerplate % python -m pytest -v --reruns 1 --reruns-delay 1 --gherkin-terminal-reporter --driver Remote --selenium-host '[BS_USERNAME]:[BS_KEY]@hub-cloud.browserstack.com' --capability browserName 'Chrome' --capability os 'Windows' --capability osVersion '11' --capability build 'eucrisahcpcom-qa' --capability browserstack 'True' --tags="p1"
```

For more details on usage, please read through these pages:

* [BS - Test Local Host Websites](https://www.browserstack.com/local-testing/automate#test-localhost-websites)
* [BS - Test Websites Hosted on Private Internal Servers](https://www.browserstack.com/local-testing/automate#test-websites-hosted-private-internal-servers)
* [BS usage with Python](https://www.browserstack.com/automate/python)

Please read BS documentation for more details on configurations:

* https://www.browserstack.com/automate/python
* https://www.browserstack.com/app-automate/appium-python

3. For running parallel test from local in the browserstack you can add **-n [parallel threads value] -> e.g.: "-n '2'"]** to your command.
   -n represents the number of processes to execute the test cases in parallel mode.
   We can also pass "**auto**" to use as many processes as your computer has CPU cores. This can lead to considerable
   speed ups, especially if your test suite takes a noticeable amount of time.

Reference Link - https://pypi.org/project/pytest-xdist/

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

#### Browserstack Mobile

* Upload your Android app (.apk or .aab file) or iOS app (.ipa file) to BrowserStack servers using our REST API. Here is
  an example cURL request to upload the app :

```shell
 curl -u "YOUR_USERNAME:YOUR_ACCESS_KEY" \
-X POST "https://api-cloud.browserstack.com/app-automate/upload" \
-F "file=@/path/to/app/file/Application-debug.apk"
```

* We will receive below sample response which we need to add it in the configs/googlePixel6_browserstack.json and
  configs/iPhone13Pro_browserstack.json file

```shell
{
    "app":"bs://j3c874f21852ba57957a3fdc33f47514288c4ba4"
}
```

Command for BS run for android:

```shell
python -m pytest -p no:randomly -v --gherkin-terminal-reporter --disable-warnings --driver Appium --selenium-host '[BS_USERNAME]:[BS_KEY]@hub-cloud.browserstack.com' --variables configs/googlePixel6_browserstack.json --tags "mobile_sanity"
```

Command for BS run for iOS:

```shell
python -m pytest -p no:randomly -v --gherkin-terminal-reporter --disable-warnings --driver Appium --selenium-host '[BS_USERNAME]:[BS_KEY]@hub-cloud.browserstack.com' --variables configs/iPhone13Pro_browserstack.json --tags "mobile_sanity"
```

<p align="right">(<a href="#about-the-project">back to top</a>)</p>


### Html Test Reports
To generate a html report please add following arguments to your command:
```shell
--html=<path_to_report> and --self-contained-html
```
`<path_to_report>` - Project path where the html report will be created.
</br>
For example:
</br>
`--html=./output/reports/`

Example of full command to generate html reports:
```shell
python -m pytest -v --tags="sample-ui-tests" -n=3 --variables=./configs/web_local.json --driver=chrome --driver-path="./binaries/webdriver/chromedriver" --html=./output/reports/ --self-contained-html
```
Please avoid adding `-s` in the CLI since it will not include any logs in the html report.
</br>
</br>
For GitHub actions please update .yaml including .html file and ./assets folder as in this example.

```
- name: Upload pytest test results
  uses: actions/upload-artifact@v2ł
  with:
    name: pytest-results
    path: |
      ./*.html
      ./assets/
      ./output/
  if: ${{ always() }}
```   
Please refer for more details on HTML reports:
[HTML Test Reports](https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/3971580046/HTML+Reports+using+pytest-html)

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

Best Practices
---------------------
**Use proper wait predefined step to handle the time needed between action steps**

Avoid using static wait between steps and use instead the predefined step to wait for a specific web element.
In this way we do not hardcode the amount of time needed for an element to appear, we are specifically waiting for it to be displayed.

Therefore, instead of having:

    When I click on 'login > sign-in'
    And I pause for '2' s
    And I set text 'username' to field 'login > email'

The right approach is:

    When I click on 'login > sign-in'
    And The element 'login > email' is displayed
    And I set text 'username' to field 'login > email'
  
<p align="right">(<a href="#about-the-project">back to top</a>)</p>

Boilerplate update
---------------------
<b>Below procedure is valid if your current BP version is v3.21 or newer.</b>

<b>If you are using an older BP version check the update procedure [here](https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/4035182696/BOILERPLATE+-+IMPORTANT+Update+procedure+for+BP+versions+before+3.15+and+following+releases#Update-procedure-for-BP-version-3.21-onwards).</b>


1. <b>Clone a Boilerplate repo</b>
   Make sure that you have a latest Boilerplate release pulled from the GitHub:
    ```shell
    git clone https://github.com/pfizer/python-test-automation-boilerplate.git
    ```
   This should be done in different folder than your local project repo folder you want update to.

###

2. <b>Update following files/folders from the BP repo root folder -> local project root folder </b></br>
    * <b>Files:</b>
        * conftest.py
        * install.py
        * install.sh
        * requirements.txt
        * README.md
        * .gitignore
        * .editorconfig
        * pytest.ini
    * <b>Folders:</b>
        * bp_core
###

3. <b>Update the project:</b>
   </br>Once the files are copied/merged to your local project repo you need to re-install initial framework setup.
   </br>In order to do that please run following command:
    ```shell
    source install.sh
    ```

###

4. <b>Verify the installation</b>
   </br>Assuming installation was successful please re-run the core test scenarios:
    ```shell
    python -m pytest -v --gherkin-terminal-reporter -n '3' --driver Chrome --driver-path ./binaries/webdriver/chromedriver --capability headless True --tags "sample-ui-tests"
    ```
   ###
    <p style="text-indent: 50px"><b>Note:</b> In case of any issues related of running <i>'install.sh'</i> script please remove your virtual environment first:</p>
    <p style="text-indent: 50px"> - deactivate existing virtual environment:</p>

    ```shell
     deactivate
     ```

     <p style="text-indent: 50px"> - remove existing virtual environment folder:</p>
     <p style="text-indent: 100px"> - for os x:</p>

   ```shell
     rm -r $HOME/.bp-venv
   ```

    <p style="text-indent: 100px"> - for win:</p>

   ```shell
     rmdir /s /q %HOMEPATH%\.bp-venv
   ```

   <p style="text-indent: 50px"> -  re-run install.sh:</p>
   <p style="text-indent: 100px"> - for os x:</p>

     ```shell
     source install.sh
     ```
   <p style="text-indent: 100px"> - for win:</p>

     ```shell
     sh install.sh
     ```


<p align="right">(<a href="#about-the-project">back to top</a>)</p>

Limitations
------------
* Firefox (version 109.0.1) geckodriver(0.32.0): WebElement().text returns empty string if webelement is created by shadow-root.<br>
  Workaround: To fetch the text of such elements, use HTML attribute "innerHTML" or "innerText". Following method can be used: 
  ```python
  selenium_generics.get_attribute_of_element(locator, attribute)
  ```


<p align="right">(<a href="#about-the-project">back to top</a>)</p>

Changelog
------------
See [this reference](https://github.com/pfizer/python-test-automation-boilerplate/blob/master/bp_core/docs/CHANGELOG.rst) to
understand what's new in each release

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

Frequently Asked Questions (FAQ)
------------
You can refer this link in case facing any issues during setup or cloning boilerplate framework.
See: [Frequently Asked Questions](https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/3853582353/Frequently+Asked+Questions+FAQ)

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

Troubleshooting Guide
---------------------
See [troubleshooting.md](https://github.com/pfizer/python-test-automation-boilerplate/blob/master/bp_core/docs/troubleshooting.md)

<p align="right">(<a href="#about-the-project">back to top</a>)</p>

Contributing
------------

You can contribute to the boilerplate project by:

* [Reporting issues with this boilerplate](https://pfizer.sharepoint.com/sites/DSEQualityTest/SitePages/Reporting-issues-with-the-boilerplate.aspx)
  , by creating a new issue within the [Issues](https://github.com/pfizer/python-test-automation-boilerplate/issues)
  page.
* Reading and adhering to
  the [Contribution Guidelines](https://github.com/pfizer/python-test-automation-boilerplate/blob/master/docs/CONTRIBUTING.rst)

<hr />

For additional information about using the Python Test Automation Boilerplate:

See [Working with this boilerplate](https://pfizer.sharepoint.com/sites/DSEQualityTest/SitePages/Working-with-the-Python-Test-Automation-Boilerplate.aspx)
within the [DSE Quality & Test](https://pfizer.sharepoint.com/sites/DSEQualityTest) Sharepoint site.
* Post a message in
  the [General channel](https://teams.microsoft.com/l/channel/19%3a4161e0292bab4616a0eaca32ab88e45e%40thread.tacv2/General?groupId=fa8a1a93-02b8-449f-858c-342d97610994&tenantId=7a916015-20ae-4ad1-9170-eefd915e9272)
  of the DSE - Test Guild MS Teams group.
* [Additional references](https://digitalpfizer.atlassian.net/wiki/spaces/CTG/pages/3888185390/BP+requirements.txt+-+References)
  for the libraries used for the Boiler Plate development

<!--Reference Links-->

[accessing-pfizer-repo]: https://pfizer.sharepoint.com/sites/DSEQualityTest/SitePages/Accessing-Pfizer%27s-repositories-within-GitHub.aspx

[api-testing]: docs/usage/apitesting.md

[visual-testing]: docs/usage/visualtesting.md

[testrail-config]: https://www.gurock.com/testrail/videos/test-plans-configurations

[troubleshooting]: docs/troubleshooting.md
