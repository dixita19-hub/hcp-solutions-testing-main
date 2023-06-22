"""Generic TOML File Parser Module.

Usage:
>>> from pathlib import Path
>>> toml_file_path = Path('data.toml').resolve()
>>> toml2dict(toml_file_path)

This module exposes one public function toml2dict, which would take absolute path
of toml file as input and outputs a dictionary mapping. See Details here: 
https://github.com/uiri/toml

By design, toml file does not support variable substitution or referring from environment
variables. However, these two concepts are vital to the overall framework and is 
implemented in addition to normal dictionary conversion.

* Environment Variable Reference:
In order to refer an environment variable for a parameter, user has to provide environment
variable name as a string (double quoted) in following syntax in toml file.
```
Example:
url = "{%APP-URL%}"
```
Environment variable name should be prefixed with `{%` and suffixed with `%}`

* Variable Assignments
In the toml file, user can refer the value of a constant that is defined in the same section or
its hierarchy using similar syntax as above.
```
Example:
project = 350

my-project = "{{project}}_450"
```
This would assign value of 350_450 to my-project key during conversion.
"""
import os
import re
from pathlib import Path

import toml

__all__ = ["toml2dict"]


def _var_formatted(string_to_format: str, mapping: dict):
    """_var_formatted

    Arguments
    ---------
    `string_to_format: str`
    `mapping: dict`

    Returns
    -------
    Formatted `string_to_format` with constant variable
    """
    type_ = type(string_to_format)
    string_to_format = str(string_to_format)
    re_var = r"{{[0-9a-zA-Z_-]+}}"
    while matches := re.findall(re_var, string_to_format):
        for match in matches:
            match_ = match[2:-2]
            string_to_format = string_to_format.replace(match, mapping.get(match_, ""))
    if string_to_format.isnumeric():
        string_to_format = int(string_to_format)
    return type_(string_to_format)


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


def _recursive_env_var_update(d_: dict):
    """_recursive_env_var_update

    Arguments
    ---------
    `d_: dict`

    Returns
    -------
    None
    """
    for k, v in d_.items():
        if isinstance(v, dict):
            _recursive_env_var_update(v)
        else:
            d_[k] = env_formatted(v)


def _recursive_var_update(d_: dict, mapping: dict):
    """_recursive_var_update

    Arguments
    ---------
    `d_: dict`
    `mapping: dict`

    Returns
    -------
    None
    """
    for k, v in d_.items():
        if isinstance(v, dict):
            m_ = mapping.copy()
            m_.update(v)
            m_ = {k: v for k, v in m_.items() if not isinstance(v, dict)}
            _recursive_var_update(v, m_)
        else:
            m_ = mapping.copy()
            m_.update(d_)
            m_ = {k: v for k, v in m_.items() if not isinstance(v, dict)}
            d_[k] = _var_formatted(v, m_)


def __raise_for_file_errors(file_path: Path):
    """__raise_for_file_errors

    Function to raise exception in case of missing file or file format not .toml

    Arguments
    ---------
    `file_path: Path`

    Returns
    -------
    None

    Raises
    ------
    `ValueError`
        * If file is not present at the location specified
        * If file is not a toml file.
    """
    if not file_path.is_file():
        raise ValueError(f"No File present at location: {file_path}")
    if file_path.suffix != ".toml":
        raise ValueError(
            "Provided File is not a .toml file. Please provide a valid TOML file."
        )


def __load_file(file_path: Path):
    """__load_file

    Arguments
    ---------
    `file_path: Path`

    Returns
    -------
    Key-Value pairs of loaded toml file

    Raises
    ------
    `toml.TomlDecodeError`
    """
    with open(file_path, "r") as f:
        try:
            return toml.load(f)
        except toml.TomlDecodeError:
            raise


def toml2dict(toml_path: Path):
    """toml2dict

    Arguments
    ---------
    `toml_path: Path`
        Absolute Path of the toml file name

    Returns
    -------
    Key-Value Pairs of loaded toml data
    """
    __raise_for_file_errors(toml_path)
    data = __load_file(toml_path)
    _recursive_env_var_update(data)
    _recursive_var_update(data, data)
    return data
