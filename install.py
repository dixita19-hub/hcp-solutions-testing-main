import os
import platform
import shlex
import shutil
import subprocess
import sys
import venv
from collections import namedtuple
from pathlib import Path
from bp_core.installation.installation_scripts.text_formatting import BColors, print_red, print_green, print_cyan


TERMINAL_WIDTH = 100  # default 100
try:
    TERMINAL_WIDTH = os.get_terminal_size().columns
except OSError:
    # while running in IDE/containers, this method might raise OSError.
    # in that case stick to default defined above try/except block.
    pass


VENV_PATH = Path(os.environ.get("HOME"), ".bp-venv").resolve()


def install_selenium_drivers():
    print_green(_ := "Installing Selenium Drivers")
    print_green("-" * len(_))

    from bp_core.installation.installation_scripts.download_assets import (
        get_bs_local_by_platform,
        get_chromedriver_by_platform,
        get_geckodriver_by_platform,
        get_edgedriver_by_platform
    )

    PROJECT_DIR = os.getcwd()
    TEMP_DIR = PROJECT_DIR + "/temp"
    BINARIES_DIR = PROJECT_DIR + "/binaries/webdriver"

    get_bs_local_by_platform(TEMP_DIR, BINARIES_DIR)

    if os.getenv("CI") == "true" :
        print("Using webdriver binaries provided in the github runner image")
        shutil.copy2(f"{os.getenv('CHROMEWEBDRIVER')}/chromedriver", f"{BINARIES_DIR}")
        shutil.copy2(f"{os.getenv('GECKOWEBDRIVER')}/geckodriver", f"{BINARIES_DIR}")
        shutil.copy2(f"{os.getenv('EDGEWEBDRIVER')}/msedgedriver", f"{BINARIES_DIR}")
    else:
        print("Not in CI environment. Downloading webdriver binaries")
        get_chromedriver_by_platform(TEMP_DIR, BINARIES_DIR)
        get_geckodriver_by_platform(TEMP_DIR, BINARIES_DIR)
        get_edgedriver_by_platform(TEMP_DIR, BINARIES_DIR)


    shutil.rmtree(TEMP_DIR)
    print_green(f"Successfully Downloaded Selenium Drivers at location {BINARIES_DIR}")
    print("\n")


def run_install_tests():
    import pytest

    TESTS_ARGS = [
        "-v",
        "--gherkin-terminal-reporter",
        "--tags=installation_check"
    ]

    print_green(_ := "Running default tests to validate installation")
    print_green("-" * len(_))
    os.environ['BOILERPLATE_INSTALLATION'] = 'True'
    test = pytest.main(TESTS_ARGS)

    if test == 0:
        print_green("=" * TERMINAL_WIDTH)
        print_green("INSTALLATION SUCCESSFUL")
    else:
        print_red("=" * TERMINAL_WIDTH)
        print_red("Installation Tests Returned Exit Code:", test)
        print_red("INSTALLATION FAILED !!!.")
        print_red(
            "Please review the installation check results in terminal logs above, fix the script, and re-run. If the issue seems to be in boilerplate framework itself, then raise an issue in github."
        )


class PlatformDetails:
    @property
    def os_name(self) -> str:
        return platform.system()

    @property
    def sys_info(self) -> platform.uname_result:
        return platform.uname()

    @property
    def py_ver(self) -> str:
        return platform.python_version()

    def check_for_python_v3_9(self) -> None:
        if not self.py_ver.startswith("3.9"):
            sys.exit(
                BColors.FAIL
                + "Unsupported Python Version. Please install Python Version 3.9.X and proceed (Recommended = 3.9.6 and above). For installation intruction, please refer project README.md"
                + BColors.ENDC
            )


class InstallRequirements:
    def __init__(self, req_file: Path):
        self.req_file = req_file
        self.reqs = self.__read_reqs_file()

    def __read_reqs_file(self):
        with open(self.req_file, "r") as f:
            reqs = f.readlines()
        reqs = [
            req.split("#")[0].strip()
            for req in reqs
            if not (req.strip().startswith("#") or not req.strip())
        ]
        return reqs

    def print_stderr(self, stderr_msg):
        stderr_msg = stderr_msg.strip().split("\n")
        for line in stderr_msg:
            print_red("\t", "|", line)

    def print_stdout(self, stdout_msg):
        stdout_msg = stdout_msg.strip().split("\n")
        for line in stdout_msg:
            print_cyan("\t", "|", line)

    def install_reqs(self):
        errored_libs = []
        print_green(_ := f"Installing Dependencies from {self.req_file}")
        print_green("-" * len(_))
        print_cyan("Upgrading pip ...")
        subprocess.run(shlex.split(f"pip install --upgrade pip"))
        for req in self.reqs:
            output = subprocess.run(
                ["pip", "install", req], capture_output=True, encoding="utf-8"
            )
            if _ := output.stderr:
                errored_libs.append(req)
                print_red("Error installing {}".format(req))
                self.print_stderr(_)
            else:
                print_green("Successfully Installed {}".format(req))
                self.print_stdout(output.stdout)
        print("\n")
        return errored_libs


class VirtualEnv:
    EnvPath = namedtuple("EnvPath", "python pip activate")

    def __init__(self, directory: Path):
        self.dir = directory
        self.bin_path = "Scripts" if platform.system() == "Windows" else "bin"
        self.env_path = VirtualEnv.EnvPath(
            Path(self.dir, self.bin_path, "python"),
            Path(self.dir, self.bin_path, "pip"),
            Path(self.dir, self.bin_path, "activate"),
        )

    def __call__(self):
        return self._create()

    def _is_venv_exists(self):
        # we consider venv exists if self, python, pip and activate scripts are available
        return (
            self.dir.exists()
            and self.dir.is_dir()
            and self.env_path.python.exists()
            and self.env_path.pip.exists()
            and self.env_path.activate.exists()
        )

    def _remove_bp_venv(self):
        if self.dir.exists():
            if self.dir.is_dir():
                print_cyan(f"Removing Directory {self.dir}...")
                shutil.rmtree(self.dir)
            else:
                print_cyan(f"Removing File {self.dir}...")
                os.remove(self.dir)

    def _create(self):
        if not self._is_venv_exists():
            # remove existing .bp-venv dir if it exists (in case some corrupted one)
            self._remove_bp_venv()
            env_builder = venv.EnvBuilder(with_pip=True, upgrade_deps=True)
            try:
                env_builder.create(self.dir)
            except shutil.SameFileError:
                # when virtual environment with same name is already activated
                print_cyan(
                    "Virtual Environment {} is already activated in the current shell".format(
                        self.dir
                    )
                )
        else:
            print_cyan(f"Virtual Environment already exists at {self.dir}")


class Setup:
    def __init__(self):
        self.venv_dir = Path(os.environ.get("HOME"), ".bp-venv")
        self.req_file = Path().cwd() / "requirements.txt"

    def _check_prerequisites(self):
        platform_details = PlatformDetails()
        print_green(_ := "System Information")
        print_green("-" * len(_))

        print_cyan(
            "\t",
            "|",
            "Operating System ->",
            platform_details.sys_info.system,
            f"(Release: {platform_details.sys_info.release})",
        )
        print_cyan(
            "\t", "|", "System Architecture ->", platform_details.sys_info.machine
        )

        platform_details.check_for_python_v3_9()
        print_cyan("\t", "|", "Python Version ->", platform_details.py_ver)
        print("\n")

    def _create_venv(self):
        print_green(_ := f"Creating Virtual Environment at {self.venv_dir}")
        print_green("-" * len(_))
        env = VirtualEnv(self.venv_dir)
        env()
        print_cyan("\t", "|", "Virtual Environment Python ->", env.env_path.python)
        print_cyan("\t", "|", "Virtual Environment Pip ->", env.env_path.pip)
        print("\n")
        return env.env_path

    def _install_reqs(self):
        install_failure_status = InstallRequirements(self.req_file).install_reqs()
        if install_failure_status:
            print_red(_ := "Following Packages Failed To Install.")
            print_red("-" * len(_))
            for lib in install_failure_status:
                print_red("\t", "|", lib)
            print_red("Aborting Setup Process. Please fix the errors and re-do.")
            sys.exit(1)

    def global_setup(self):
        self._check_prerequisites()
        self._create_venv()

    def venv_setup(self):
        self._install_reqs()
        install_selenium_drivers()
        run_install_tests()


def global_setup():
    setup = Setup()
    setup.global_setup()


def venv_setup():
    setup = Setup()
    setup.venv_setup()


if __name__ == "__main__":
    arg = sys.argv[1:][0]
    if arg == "global":
        global_setup()
    elif arg == "venv":
        venv_setup()
    else:
        pass
