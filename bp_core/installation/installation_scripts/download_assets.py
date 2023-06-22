import json
import os
import platform
import shutil
import tarfile
import requests

from pathlib import Path
from bp_core.installation.installation_scripts.text_formatting import print_cyan
from bp_core.utils.env_variables import EnvVariables


BROWSERSTACK_LOCAL_MAC = (
    "https://www.browserstack.com/browserstack-local/BrowserStackLocal-darwin-x64.zip"
)
BROWSERSTACK_LOCAL_LINUX = (
    "https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip"
)
BROWSERSTACK_LOCAL_WINDOWS = (
    "https://www.browserstack.com/browserstack-local/BrowserStackLocal-win32.zip"
)

CHROMEDRIVER_MAC = (
    "https://chromedriver.storage.googleapis.com/%s/chromedriver_mac64.zip"
)
CHROMEDRIVER_LINUX = (
    "https://chromedriver.storage.googleapis.com/%s/chromedriver_linux64.zip"
)
CHROMEDRIVER_WINDOWS = (
    "https://chromedriver.storage.googleapis.com/%s/chromedriver_win32.zip"
)

EDGEDRIVER_LATEST_TAG = (
    "https://msedgedriver.azureedge.net/LATEST_STABLE"
)
EDGEDRIVER_LINUX = (
    "https://msedgedriver.azureedge.net/%s/edgedriver_linux64.zip"
)
EDGEDRIVER_WINDOWS = (
    "https://msedgedriver.azureedge.net/%s/edgedriver_win64.zip"
)
EDGEDRIVER_MAC = (
    "https://msedgedriver.azureedge.net/%s/edgedriver_mac64.zip"
)

GECKO_DRIVER_LATEST_URL = (
    "https://api.github.com/repos/mozilla/geckodriver/releases/latest"
)
GECKO_DRIVER_URL = (
    "https://github.com/mozilla/geckodriver/releases/download/%s/geckodriver-%s"
)
GECKODRIVER_MAC = GECKO_DRIVER_URL + "-macos.tar.gz"
GECKODRIVER_LINUX = GECKO_DRIVER_URL + "-linux32.tar.gz"
GECKODRIVER_WINDOWS = GECKO_DRIVER_URL + "-win64.zip"

BINARY_NAMES = ["chromedriver", "geckodriver", "msedgedriver", "BrowserStackLocal"]
DO_NOT_DELETE_DURING_CLEANUP = [".gitkeep"]

env_variable = EnvVariables()


def _clean_binaries_dir(dir):
    for item in os.listdir(dir):
        item = item.split('.')[0] if '.exe' in item and item.split('.')[0] in BINARY_NAMES else item
        if item not in BINARY_NAMES and item not in DO_NOT_DELETE_DURING_CLEANUP:
            item_path = f"{dir}/{item}"
            shutil.rmtree(item_path) if os.path.isdir(item_path) else os.remove(item_path)


def _unzip(zip_file, unzip_dir):
    stream = os.popen("unzip -o %s -d %s" % (zip_file, unzip_dir))
    output = stream.read()
    _clean_binaries_dir(unzip_dir)
    print(output)


def _extract_tarball(tar_file, out_dir):
    tf = tarfile.open(tar_file)
    tf.extractall(out_dir)
    _clean_binaries_dir(out_dir)
    tf.close()


def _create_dir_if_needed(dir_path):
    if not os.path.exists(dir_path):
        os.makedirs(dir_path)


def _download_file(url, dest_path):
    response = requests.get(url, allow_redirects=True)
    with open(dest_path, "wb") as f:
        f.write(response.content)


def _get_platform_name():
    return platform.system().lower()


def _download_platform_specific_file(
    name, temp_dir, dest_dir, platform_url_map, platform_filename_map
):
    platform_type = _get_platform_name()
    print(f"Downloading {name} for {platform_type} platform")

    _create_dir_if_needed(temp_dir)

    download_filename = platform_filename_map[platform_type]
    download_path = temp_dir + f"/{download_filename}"
    _download_file(platform_url_map[platform_type], download_path)

    _create_dir_if_needed(dest_dir)
    if "tar.gz" in download_filename:
        _extract_tarball(download_path, dest_dir)
    else:
        _unzip(download_path, dest_dir)
    print(f"'{name}' saved at location: {dest_dir} \n")


def get_bs_local_by_platform(temp_dir, scripts_dir):
    platform_url_map = {
        "darwin": BROWSERSTACK_LOCAL_MAC,
        "linux": BROWSERSTACK_LOCAL_LINUX,
        "windows": BROWSERSTACK_LOCAL_WINDOWS,
    }

    bs_filename = "BrowserstackLocal.zip"
    platform_filename_map = {
        "darwin": bs_filename,
        "linux": bs_filename,
        "windows": bs_filename,
    }

    _download_platform_specific_file(
        "Browserstack Local - Latest",
        temp_dir,
        scripts_dir,
        platform_url_map,
        platform_filename_map,
    )


def get_chromedriver_by_platform(temp_dir, scripts_dir):
    chrome_version = env_variable.get("CHROME_VERSION")
    if chrome_version == 'latest':
        latest_release = get_chromedriver_latest_version_tag()
    else:
        print("Getting ChromeDriver release version %s" % chrome_version)
        latest_release = chrome_version

    platform_url_map = {
        "darwin": CHROMEDRIVER_MAC % latest_release,
        "linux": CHROMEDRIVER_LINUX % latest_release,
        "windows": CHROMEDRIVER_WINDOWS % latest_release,
    }

    bs_filename = "ChromeDriver.zip"
    platform_filename_map = {
        "darwin": bs_filename,
        "linux": bs_filename,
        "windows": bs_filename,
    }

    _download_platform_specific_file(
        f"Chromedriver - {latest_release}",
        temp_dir,
        scripts_dir,
        platform_url_map,
        platform_filename_map,
    )


def get_geckodriver_by_platform(temp_dir, scripts_dir):
    latest_release = get_geckodriver_latest_version_tag()
    print("Getting GeckoDriver release version %s" % latest_release)
    platform_url_map = {
        "darwin": GECKODRIVER_MAC % (latest_release, latest_release),
        "linux": GECKODRIVER_LINUX % (latest_release, latest_release),
        "windows": GECKODRIVER_WINDOWS % (latest_release, latest_release),
    }

    platform_filename_map = {
        "darwin": "GeckoDriver.tar.gz",
        "linux": "GeckoDriver.tar.gz",
        "windows": "GeckoDriver.zip",
    }

    _download_platform_specific_file(
        f"Geckodriver - {latest_release}",
        temp_dir,
        scripts_dir,
        platform_url_map,
        platform_filename_map,
    )


def get_edgedriver_by_platform(temp_dir, scripts_dir):
    from webdriver_manager.microsoft import EdgeChromiumDriverManager
    if EdgeChromiumDriverManager().driver.get_browser_version() is not None:
        _create_dir_if_needed(temp_dir)
        version = get_edgedriver_latest_version_tag(temp_dir)
        print("Getting MSEdgeDriver release version %s" % version)
        platform_url_map = {
            "darwin": EDGEDRIVER_MAC % version,
            "linux": EDGEDRIVER_LINUX % version,
            "windows": EDGEDRIVER_WINDOWS % version,
        }

        platform_filename_map = {
            "darwin": "edgedriver_mac64.zip",
            "linux": "edgedriver_linux64.zip",
            "windows": "edgedriver_win64.zip",
        }

        _download_platform_specific_file(
            f"Edgedriver - {version}",
            temp_dir,
            scripts_dir,
            platform_url_map,
            platform_filename_map,
        )
    else:
        print_cyan("Microsoft Edge Browser is not installed. Skipping the installation of EdgeDriver.")


def get_edgedriver_latest_version_tag(temp_dir):
    version_download_path = Path(temp_dir + "/latest_edge_version.txt").resolve()
    if not version_download_path.is_file():
        _create_dir_if_needed(temp_dir)
        for retry in range(3):
            driver_api_response = requests.get(EDGEDRIVER_LATEST_TAG, allow_redirects=True)
            if driver_api_response.status_code == 200:
                with open(version_download_path, "w") as f:
                    f.write(driver_api_response.text)
                break
            if retry == 2 and driver_api_response.status_code != 200:
                raise ConnectionError("Something went wrong, please try again!")
    with open(version_download_path, "r") as f:
        version = f.read().strip()
    return version


def get_geckodriver_latest_version_tag():
    print("Getting GeckoDriver latest release version")
    for retry in range(3):
        driver_api_response = requests.get(GECKO_DRIVER_LATEST_URL)
        if driver_api_response.status_code == 200:
            return json.loads(driver_api_response.text)["tag_name"]
        if retry == 2 and driver_api_response.status_code != 200:
            raise ConnectionError("Something went wrong, please try again!")


def get_chromedriver_latest_version_tag():
    print("Getting ChromeDriver latest release version")
    for retry in range(3):
        driver_api_response = requests.get("https://chromedriver.storage.googleapis.com/LATEST_RELEASE")
        if driver_api_response.status_code == 200:
            return driver_api_response.text
        if retry == 2 and driver_api_response.status_code != 200:
            raise ConnectionError("Something went wrong, please try again!")


def get_latest_chrome_browser_version():
    chrome_browser_latest_version = "https://omahaproxy.appspot.com/%s"
    platform_type = _get_platform_name()
    platform_url_map_for_version = {
        "darwin": chrome_browser_latest_version % "mac",
        "linux": chrome_browser_latest_version % "linux",
        "windows": chrome_browser_latest_version % "win",
    }
    response = requests.get(platform_url_map_for_version[platform_type])
    return response.text


def get_latest_firefox_browser_version():
    safari_browser_release_version = "https://product-details.mozilla.org/1.0/firefox_versions.json"
    response = requests.get(safari_browser_release_version)
    return json.loads(response.text)["LATEST_FIREFOX_VERSION"]


def get_latest_edge_browser_version(temp_dir):
    return get_edgedriver_latest_version_tag(temp_dir)


def update_chromedriver(current_version: str, temp_dir, binaries_dir):
    if get_chromedriver_latest_version_tag() != current_version:
        get_chromedriver_by_platform(temp_dir, binaries_dir)
        # Delete temp directory used to download zip files
        shutil.rmtree(temp_dir)
        return "Updated Chrome Driver to the latest Available Version"
    else:
        return f"ChromeDriver is up-to-date with latest version {current_version}"


def update_geckodriver(current_version: str, temp_dir, binaries_dir):
    if get_geckodriver_latest_version_tag().replace('v','') != current_version:
        get_geckodriver_by_platform(temp_dir, binaries_dir)
        # Delete temp directory used to download zip files
        shutil.rmtree(temp_dir)
        return "Updated GeckoDriver to the latest Available Version."
    else:
        return f"GeckoDriver is up-to-date with latest version {current_version}"


def update_edgedriver(current_version: str, temp_dir, binaries_dir):
    if get_edgedriver_latest_version_tag(temp_dir) != current_version:
        get_edgedriver_by_platform(temp_dir, binaries_dir)
        # Delete temp directory used to download zip files
        shutil.rmtree(temp_dir)
        return "Updated MSEdgeDriver to the latest Available Version."
    else:
        return f"MSEdgeDriver is up-to-date with latest version {current_version}"
