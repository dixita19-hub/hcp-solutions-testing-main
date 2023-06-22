Boilerplate - Troubleshooting, Recommendations & Workarounds Guide
==================================================================

This document details certain common troubleshooting and workaround tips.

### Project-specific Requirements Installation
`requirements.txt` file in the boilerplate root directory is meant to handle boilerplate core requirements, and should not be modified by consumer applications. In case of additional project-specific dependency requirements, consumer teams are required to create `requirements.txt` file inside custom_project/ folder and handle the installation from the respective project repositories.

### Directories & File Naming Recommendation
It is strongly advised to get rid of `spaces` in the folder and file names. Instead, it is advisable to convert the spaces to `-` or `_`.

### Selenium Exception due to Browser - Driver Version Mismatch.
Running `source install.sh` would automatically install selenium drivers to `binaries/webdriver/` folder. By deafult BP installs the latest version of driver for Chrome and Firefox.

As listed in README prerequisite, having latest version of Chrome and Firefox browsers installed in the machine, should hold good. In certain rare situations, the installed driver and browser version might not be compatible, and might be facing error during Selenium test execution, similar to below:
```shell
selenium.common.exceptions.SessionNotCreatedException: Message: session not created: This version of ChromeDriver only supports Chrome version 105
INTERNALERROR> Current browser version is 104.0.5112.102 with binary path /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

```
If such error occurs, try following below steps for resolution:
* For Chrome, there is an option to specify the driver version to be installed by updating the env_variable 'CHROME_VERSION' in configs/.local.env file and then re-run `source install.sh`
  OR
* Try checking the browser version and update to the latest version.
* If updating fails due to any reason, uninstall the affected browser from system completely, and re-install the latest available version.

### Windows Subsystem for Linux
*Note: WSL uses Ubuntu Variant of Linux.*
In Windows 10, recommended approach is to use Git Bash. However, for any reason, if developing or testing on WSL, then ensure to have below dependencies met.
#### Git
Run below commands in terminal sequentially.
```shell
# update package index
sudo apt update
# install git 
sudo apt install git
# check for successful git installation
git --version  # should return something similar to `git version 2.30.1`
```
#### zip/unzip
Install `zip` and `unzip` command-line tools.
```shell
username@hostname ~ $ sudo apt update
# commands after $ symbol
# install zip
username@hostname ~ $ sudo apt install zip
# Check installed zip version
username@hostname ~ $ zip -v

# install unzip
username@hostname ~ $ sudo apt install unzip
username@hostname ~ $ unzip -v
```

#### Python
*Recommended version of Python is 3.9.12*

Install Python using `pyenv-installer`. Detailed Instructions: [pyenv](https://github.com/pyenv/pyenv). 
*For any issues faced during installation, please refer pyenv GitHub [here](https://github.com/pyenv/pyenv)*
```shell
# Install Build Environment
sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

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

# Verify Installation
exec $SHELL
pyenv --version

# Install python
pyenv install 3.9.12
pyenv global 3.9.12
```