# pylint: disable=import-outside-toplevel
# pylint: disable=no-member
import errno
import json
import math
import os
import random
import string
import time
from collections import namedtuple
from datetime import datetime
from functools import reduce
from os import path, strerror
from pathlib import Path
from typing import Callable

import structlog

logger = structlog.get_logger(__name__)

OutputDirs = namedtuple(
    "OutputDirs",
    "ss_base ss_actual ss_diff vis_base vis_test vis_diff run_logs reports",
)

types_dict = {
    "piece_status": str,
    "user_role": str,
    "user_roles": str,
    "feature": str,
    "features": str,
    "category": str,
    "text": str,
    "name": str,
    "other_name": str,
    "names": str,
    "value": str,
    "values": str,
    "title": str,
    "index": int,
    "num": int,
    "count": int,
    "height": float,
    "width": float,
    'page_name': str,
    'component_type': str,
    'site_name': str,
    'page_nickname': str,
    'page1_nickname': str,
    'page2_nickname': str,
    'site_nickname': str,
    'site1_nickname': str,
    'site2_nickname': str,
    'var_name': str,
    'name1': str,
    'name2': str,
    'site_desc': str,
    'description': str,
    'url': str,
    'domain_url': str,
    'custom_block_name': str,
    'block_category': str,
    'block_name': str,
    'roles': str,
    'tab_index': int,
    'minutes': int,
    'seconds': int
}


def get_env_name(caps: dict):
    os = caps["os"] if "os" in caps else None
    os_version = caps["os_version"] if "os_version" in caps else ""
    env = (
        caps["browser"]
        if "browser" in caps
        else caps["device"]
        if "device" in caps
        else "Chrome"
    )

    if os is None:
        env_name = "%s - %s" % (env, os_version)
    else:
        env_name = "%s %s - %s" % (os, os_version, env)
    logger.info(
        'Test results will be exported to "%s" TestRail Configuration' % env_name
    )
    return env_name


def initialize_output_dirs():
    # ss_base ss_actual ss_diff vis_base vis_test vis_diff run_logs reports
    output_dir = Path(__file__ + "../../../output/").resolve()
    directories = OutputDirs(
        output_dir / "screenshots" / "base",
        output_dir / "screenshots" / "actual",
        output_dir / "screenshots" / "diff",
        output_dir / "visualtesting" / "base",
        output_dir / "visualtesting" / "test",
        output_dir / "visualtesting" / "diff",
        output_dir / "run_logs",
        output_dir / "reports",
    )

    for directory in directories:
        if not directory.exists():
            directory.mkdir(parents=True)
    return directories


def read_file(file_name):
    logger.info("Started reading file", file_name)
    # file_path = re.sub(r'utils.(\w+)', file_name, path.abspath(__file__))
    file_path = get_file_path(file_name)
    with open(file_path, encoding="utf-8") as fl:
        extension = path.splitext(file_path)[1]
        if extension == ".json":
            raw_data = json.load(fl)
            return raw_data
        if extension == ".txt":
            raw_data = fl.read()
            return raw_data
        raise extension
    logger.info("Completed reading the file: ", file_name)


def get_file_path(file_name):
    path_object = Path(file_name)
    if not path_object.exists():
        logger.error("File: %s not found", str(file_name))
        raise FileNotFoundError(errno.ENOENT, strerror(errno.ENOENT), file_name)
    return path_object.resolve()


def compare_images(
    image_b,
    base_screenshot_url,
    actual_screenshot_url,
    diff_screenshot_url=None,
    base_score=1,
):
    import cv2
    import imutils
    from skimage.metrics import structural_similarity

    # load the two input images
    logger.info("About to compare images")
    if image_b is None:
        image_b = cv2.imread(actual_screenshot_url)
    image_a = cv2.imread(base_screenshot_url)
    if image_a is None:
        os.makedirs(
            actual_screenshot_url[: actual_screenshot_url.rfind("/")], exist_ok=True
        )
        cv2.imwrite(actual_screenshot_url, image_b)
        logger.error("There is no base image for: %s" % base_screenshot_url)
        raise AssertionError("There is no base image for: %s" % base_screenshot_url)

    # compute the Structural Similarity Index (SSIM) between the two
    # images, ensuring that the difference image is returned

    if image_a.shape != image_b.shape:
        height, width, channels = image_b.shape
        logger.info("Resizing the image")
        image_a = cv2.resize(image_a, (width, height), interpolation=cv2.INTER_AREA)
        # os.makedirs(actual_screenshot_url[:actual_screenshot_url.rfind('/')], exist_ok=True)
        # cv2.imwrite(actual_screenshot_url, image_b)
        # raise AssertionError(
        #     'Base: %s and\n Actual: %s\n have different sized' % (base_screenshot_url, actual_screenshot_url))

    # convert the images to grayscale
    logger.info("Converting the images to grayscale")
    gray_a = cv2.cvtColor(image_a, cv2.COLOR_BGR2GRAY)
    gray_b = cv2.cvtColor(image_b, cv2.COLOR_BGR2GRAY)

    logger.info("Calculating structural similarity")
    (score, diff) = structural_similarity(gray_a, gray_b, full=True)
    if score < base_score and diff_screenshot_url is not None:
        os.makedirs(
            actual_screenshot_url[: actual_screenshot_url.rfind("/")], exist_ok=True
        )
        os.makedirs(
            diff_screenshot_url[: diff_screenshot_url.rfind("/")], exist_ok=True
        )
        cv2.imwrite(actual_screenshot_url, image_b)
        diff = (diff * 255).astype("uint8")

        # threshold the difference image, followed by finding contours to
        # obtain the regions of the two input images that differ
        thresh = cv2.threshold(diff, 0, 255, cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
        cnts = cv2.findContours(
            thresh.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE
        )
        cnts = imutils.grab_contours(cnts)

        # loop over the contours
        for cnt in cnts:
            # compute the bounding box of the contour and then draw the
            # bounding box on both input images to represent where the two
            # images differ
            (x_point, y_point, width, height) = cv2.boundingRect(cnt)
            cv2.rectangle(
                image_b,
                (x_point, y_point),
                (x_point + width, y_point + height),
                (0, 0, 255),
                2,
            )

        cv2.imwrite(diff_screenshot_url, image_b)
        logger.info("Diff image has been uploaded to path : ", str(diff_screenshot_url))

    return score


def get_horizontal_spacing(elem_1, elem_2):
    spacing = 0

    return spacing


def get_vertical_spacing(elem_1, elem_2):
    spacing = 0

    return spacing


def round_down(n, decimals=0):
    multiplier = 10**decimals
    return math.floor(n * multiplier) / multiplier


def deep_get(dictionary, *keys):
    return reduce(lambda d, key: d.get(key) if d else None, keys, dictionary)


class Waiter:
    def __init__(
        self,
        timeout: int = 5,
        poll_interval: float = 1,
        raise_error_on_failure: bool = False,
        error_message: str = None,
    ):
        self._timeout: int = timeout
        self._poll_interval: float = poll_interval
        self._throw_error: bool = raise_error_on_failure
        self._error_msg: str = error_message

    """Waits for the predicate to return true. Timeout, poll interval, etc, are set via other methods"""

    def wait_for(self, predicate):
        start_time = time.time()
        is_success = False
        last_error = None

        while not is_success:
            time.sleep(self._poll_interval)

            try:
                logger.debug("Checking predicate")
                is_success = predicate()
            except Exception as e:
                last_error = e

            elapsed_time = time.time() - start_time
            if not is_success and elapsed_time >= self._timeout:
                logger.debug(f"Wait failed after {elapsed_time} seconds")

                if self._throw_error:
                    if self._error_msg:
                        raise Exception(self._error_msg)
                    raise last_error if last_error else Exception()

                break


class Retry:
    def __init__(
        self,
        limit: int = 2,
        retry_interval: int = 1,
        raise_error_on_failure: bool = False,
        error_message: str = None,
    ):
        self._limit: int = limit
        self._retry_interval: float = retry_interval
        self._throw_error: bool = raise_error_on_failure
        self._error_msg: str = error_message
        self._operation: Callable = None

    def action(self, operation: Callable):
        self._operation = operation
        return self

    def till_success_of(self, predicate):
        """Retries the operation until it succeeds or the retry limit is reached.
        The limit, retry interval, etc, are set via other methods"""
        count = 0
        is_failure = True
        last_error = None

        while count < self._limit and is_failure:
            try:
                self._operation()
                is_failure = not predicate()
            except Exception as e:
                last_error = e

            count += 1
            time.sleep(self._retry_interval)

        if self._throw_error and is_failure:
            logger.debug(f"Retry failed after {count} tries")
            if self._error_msg:
                raise Exception(self._error_msg)
            raise last_error


def get_random_string(size: int, no_digits: bool = False):
    chars = string.ascii_letters if no_digits else string.ascii_letters + string.digits
    return "".join(random.choices(chars, k=size))


def get_random_bool():
    return random.choice([True, False])


def get_datetime_string():
    return f"{datetime.now():%Y-%m-%d %H-%M-%S}"


def get_date_string():
    return f"{datetime.now():%Y-%m-%d}"


def get_random_int(end: int, start: int = 0):
    return random.randint(start, end - 1)
