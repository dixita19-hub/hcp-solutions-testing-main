import re, os
from bp_core.installation.installation_scripts.text_formatting import print_red, print_green, print_cyan


def get_current_webdriver_version(binaries_dir: str, webdriver_name: str):
    # to check the version of webdriver in /binaries/webdriver folder
    import subprocess
    output = subprocess.Popen(
        f"{binaries_dir}/{webdriver_name} --version",
        stdout=subprocess.PIPE, shell=True).communicate()[0].decode()
    current_webdriver_version = output.split('(')[0].strip().split(' ')[-1:][0]
    return current_webdriver_version


def update_chromedriver_if_needed(temp_dir: str, binaries_dir):
    from bp_core.installation.installation_scripts.download_assets import (
        update_chromedriver,
        get_latest_chrome_browser_version
    )
    from webdriver_manager.chrome import ChromeDriverManager
    from webdriver_manager.core.utils import PATTERN, ChromeType
    chrome_version = ChromeDriverManager().driver.get_browser_version()
    if chrome_version is None:
        print_red(_ := "Google Chrome is not installed. ChromeDriver will fail to launch.")
    elif chrome_version == \
        re.search(PATTERN.get(ChromeType.GOOGLE),get_latest_chrome_browser_version()).group(0):
        print_cyan(_ := "Latest Google Chrome is installed. Checking if ChromeDriver needs to be updated..")
        print_green(_ := update_chromedriver(get_current_webdriver_version(binaries_dir, 'chromedriver'),
                                             temp_dir,
                                             binaries_dir))
    else:
        print_red(_ := "You have an outdated Google Chrome Browser installed. Please update Chrome Browser to let "
                       "Boilerplate automatically download updated chromedriver.")


def update_geckodriver_if_needed(temp_dir: str, binaries_dir: str):
    from bp_core.installation.installation_scripts.download_assets import (
        update_geckodriver,
        get_latest_firefox_browser_version
    )
    from webdriver_manager.firefox import GeckoDriverManager
    from webdriver_manager.core.utils import PATTERN
    firefox_version = GeckoDriverManager().driver.get_browser_version()
    if firefox_version is None:
        print_red(_ := "Firefox is not installed. GeckoDriver will fail to launch.")
    elif firefox_version == re.search(PATTERN.get('firefox'), get_latest_firefox_browser_version()).group(0):
        print_cyan(_ := "Latest Firefox is installed. Checking if GeckoDriver needs to be updated..")
        print_green(_ := update_geckodriver(get_current_webdriver_version(binaries_dir, 'geckodriver'),
                                             temp_dir,
                                             binaries_dir))
    else:
        print_red(_ := "You have an outdated Firefox Browser installed. Please update Firefox Browser to let "
                       "Boilerplate automatically download updated geckodriver.")


def update_msedgedriver_if_needed(temp_dir: str, binaries_dir: str):
    from bp_core.installation.installation_scripts.download_assets import (
        update_edgedriver,
        get_latest_edge_browser_version
    )
    from webdriver_manager.microsoft import EdgeChromiumDriverManager
    from webdriver_manager.core.utils import PATTERN, ChromeType
    edge_version = EdgeChromiumDriverManager().driver.get_browser_version()
    if edge_version is None:
        print_red(_ := "Microsoft Edge is not installed. MSEdgeDriver will fail to launch.")
    elif edge_version == re.search(PATTERN.get(ChromeType.CHROMIUM), get_latest_edge_browser_version(temp_dir)).group(0):
        print_cyan(_ := "Latest Microsoft Edge is installed. Checking if MSEdgeDriver needs to be updated..")
        print_green(_ := update_edgedriver(get_current_webdriver_version(binaries_dir, 'msedgedriver'),
                                             temp_dir,
                                             binaries_dir))
    else:
        print_red(_ := "You have an outdated Microsoft Edge Browser installed. Please update Microsoft Edge Browser to let "
                       "Boilerplate automatically download updated msedgedriver.")


def update_webdriver_if_needed(browser: str, project_dir: str):
    if os.getenv("CI") == "true":
        return

    TEMP_DIR = project_dir + "/temp"
    BINARIES_DIR = project_dir + "/binaries/webdriver"

    if browser.lower() == "chrome":
        update_chromedriver_if_needed(TEMP_DIR, BINARIES_DIR)
    elif browser.lower() == 'firefox':
        update_geckodriver_if_needed(TEMP_DIR, BINARIES_DIR)
    elif browser.lower() == 'edge':
        update_msedgedriver_if_needed(TEMP_DIR, BINARIES_DIR)
