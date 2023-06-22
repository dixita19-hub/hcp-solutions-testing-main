import os
import re
from lib2to3.pgen2 import driver

import selenium
from pytest_bdd import scenarios
from selenium.webdriver.chrome import webdriver

from bp_core.utils.gherkin_utils import data_table_vertical_converter, data_table_horizontal_converter
from frontend.galaxy_project.step_definitions.shared_steps.common_steps import *
from pytest_bdd import scenarios, when, then, parsers, given
from bp_core.plugin import PROJECT_DIR
from frontend.galaxy_project.step_definitions.shared_steps.common_steps import *
from bp_core.frontend.common.helpers.selenium_generics import SeleniumGenerics

scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/pcc"
                                    "/button_anchor_component.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/pcc"
                                    "/isi_component.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/pcc"
                                    "/accordion_component.feature"))


@then(parsers.re("The css property values for element '(?P<locator_path>.*)' are:(?P<data_table>.+)", flags=re.S),
      converters=dict(data_table=data_table_horizontal_converter))
def check_table_css_values(selenium_generics: SeleniumGenerics, locators: Locators, locator_path, data_table):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    templist = []
    for i in data_table:
        templist.append(data_table[i])
    properties = templist[0]
    values = templist[1]
    temp = 0
    while temp < len(properties):
        assert values[temp] == selenium_generics.get_css_value(locator, properties[temp])
        temp = temp + 1
