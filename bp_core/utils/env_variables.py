import os
import re
from pathlib import Path
from typing import Union
from dotenv import load_dotenv
from bp_core.utils.singleton import SingletonMeta


def load_env_from_local_dotenv_file(
    dotenv_file_path: Union[str, None] = None
):
    """Function to load environment variables from `.local.env` file

    Args:
        dotenv_file_path: str | None (Default) - Absolute Path of the .local.env file.

    Returns:
        None
    """
    if dotenv_file_path is None:
        dotenv_file = Path(__file__ + "/../../../configs/.local.env").resolve()
    else:
        dotenv_file = Path(dotenv_file_path).resolve()

    if dotenv_file.is_file():
        load_dotenv(dotenv_path=dotenv_file, verbose=True)


def env_formatted(string_to_format: str):
    """env_formatted

    Arguments
    ---------
    `string_to_format: str`

    Returns
    -------
    Formatted `string_to_format` with environment variable
    """
    type_ = type(string_to_format)
    string_to_format = str(string_to_format)
    re_var = r"{%[0-9a-zA-Z_-]+%}"
    matches = re.findall(re_var, string_to_format)
    for match in matches:
        match_ = match[2:-2]
        string_to_format = string_to_format.replace(match, os.environ.get(match_, ""))
    return type_(string_to_format)


class EnvVariables(metaclass=SingletonMeta):
    def __init__(
        self,
        local_dotenv_file_path: Union[str, None] = None,
    ) -> None:
        self.env = local_dotenv_file_path
        load_env_from_local_dotenv_file(self.env)


    @property
    def base_url(self):
        return os.getenv("BASE_URL", "")

    @property
    def basic_auth_username(self):
        return os.getenv("BASIC_AUTH_USERNAME", "")

    @property
    def basic_auth_password(self):
        return os.getenv("BASIC_AUTH_PASSWORD", "")

    @property
    def login_username(self):
        return os.getenv("LOGIN_USERNAME", "")

    @property
    def login_password(self):
        return os.getenv("LOGIN_PASSWORD", "")

    def get(self, var_name, default=None) -> str:
        return os.getenv(var_name, default)
