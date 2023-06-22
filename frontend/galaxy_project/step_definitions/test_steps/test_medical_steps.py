import os

from pytest_bdd import scenarios
from frontend.galaxy_project.step_definitions.shared_steps.common_steps import *
from bp_core.plugin import PROJECT_DIR

scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/medical/medical.feature"))


@then(parsers.re("Card title '(?P<card_name>.*)' is present on the page where count is '("
                 "?P<locator_path_core_card>.+)' and header_path is '(""?P<locator_path_core_heading>.+)'"),
      converters=dict(text=env_variables.env_formatted))
def card_exist(selenium_generics: SeleniumGenerics, locators: Locators, locator_path_core_card,
               locator_path_core_heading, card_name):
    locator1 = locators.parse_and_get(locator_path_core_card, selenium_generics)
    elements = selenium_generics.get_elements(locator1)
    length = len(elements)
    results_counter = []
    for i in range(0, length):
        locator = locators.parse_and_get(locator_path_core_heading, selenium_generics)
        locator2 = locator.format(str(i + 1))
        value = selenium_generics.get_attribute_of_element(locator2, "innerText")
        results_counter.append(value)
    assert card_name in results_counter


@then(parsers.re("Card title '(?P<card_name>.*)' is not present on the page and count is '("
                 "?P<locator_path_core_card>.+)' and header_path is '(""?P<locator_path_core_heading>.+)'"),
      converters=dict(text=env_variables.env_formatted))
def card_not_exist(selenium_generics: SeleniumGenerics, locators: Locators, locator_path_core_card,
                   locator_path_core_heading, card_name):
    locator1 = locators.parse_and_get(locator_path_core_card, selenium_generics)
    elements = selenium_generics.get_elements(locator1)
    length = len(elements)
    results_counter = []
    for i in range(0, length):
        locator = locators.parse_and_get(locator_path_core_heading, selenium_generics)
        locator2 = locator.format(str(i + 1))
        value = selenium_generics.get_attribute_of_element(locator2, "innerText")
        results_counter.append(value)
    assert card_name not in results_counter


@when(parsers.re("I press back button from browser"))
def one_page_backward(selenium_generics: SeleniumGenerics):
    selenium_generics.driver.back()
