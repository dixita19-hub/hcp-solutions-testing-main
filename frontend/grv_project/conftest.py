from collections import defaultdict
from pathlib import Path
import time
import structlog
from _pytest.fixtures import FixtureRequest
import pytest
import json
import os
import errno
from os import path, strerror

PROJECT_DIR = os.getcwd()
test_data_dir = os.path.join(PROJECT_DIR, "frontend/grv_project/test_data/i18n.json")
grv_test_data_dir = os.path.join(PROJECT_DIR, "frontend/grv_project/test_data/grv_test_data.json")
pytest.globalDict = defaultdict()
logger = structlog.get_logger(__name__)


@pytest.fixture
def selenium(request: FixtureRequest, selenium, env_variables):
    enhanced_driver = None
    try:
        screenshotting_driver = request.getfixturevalue("enhance_driver")
        enhanced_driver = screenshotting_driver(selenium)
    except Exception as e:
        logger.error(f"Failed to enhance driver with screenshotting capabilities: {e}")

    new_driver = enhanced_driver if enhanced_driver else selenium
    yield new_driver

    if bool(env_variables.get("PYTEST_KEEP_BROWSER", default=False)):
        time.sleep(600)


def pytest_configure(config) -> None:
    """Called after the ``Session`` object has been created and before performing collection
    and entering the run test loop.

    :param pytest.Session session: The pytest session object.

    Reference for docstring:
    https://docs.pytest.org/en/6.2.x/_modules/_pytest/hookspec.html#pytest_sessionstart
    """
    with open(f"{test_data_dir}") as mock_data:
        pytest.globalDict['test_data'] = json.load(mock_data)
    tags = "eu-uk-prod"
    language = "eu-uk-prod"
    tags = config.getoption("--tags")
    if 'stg' in tags:
        if 'us' in tags:
            language = "us-us-stg"
        elif 'uk' in tags:
            language = "eu-uk-stg"
    else:
        if 'us' in tags:
            language = "us-us-prod"
        elif 'uk' in tags:
            language = "eu-uk-prod"
        elif 'br' in tags:
            language = "sa-br-prod"
    pytest.globalDict['language'] = language
    pytest.globalDict['i18n'] = pytest.globalDict['test_data'].get(language)
    pytest.globalDict['test_data'] = {}
    pytest.globalDict['test_data']['users'] = get_users_values(language)


def get_users_values(language):
    print('ACTUAL language selected: %s' % language)
    raw_data = None
    with open(f"{grv_test_data_dir}") as mock_data_2:
        pytest.globalDict['test_data'] = json.load(mock_data_2)
    raw_data = pytest.globalDict['test_data'].get(language)
    return raw_data['USERS']


def read_file(file_name):
    # file_path = re.sub(r'utils.(\w+)', file_name, path.abspath(__file__))
    file_path = get_file_path(file_name)
    with open(file_path, encoding="utf-8") as fl:
        extension = path.splitext(file_path)[1]
        if extension == '.json':
            raw_data = json.load(fl)
            return raw_data
        if extension == '.txt':
            raw_data = fl.read()
            return raw_data
        raise extension


def get_file_path(file_name):
    path_object = Path(file_name)
    if not path_object.exists():
        raise FileNotFoundError(errno.ENOENT, strerror(errno.ENOENT), file_name)
    return path_object.resolve()
