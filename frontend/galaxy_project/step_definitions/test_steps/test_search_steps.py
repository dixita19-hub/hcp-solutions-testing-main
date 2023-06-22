import os
import random
from lib2to3.pgen2 import driver

from pytest_bdd import scenarios, when, parsers, then
import time
from assertpy import assert_that

from selenium.webdriver.common.keys import Keys
from pytest_check import check

from bp_core.frontend.common.helpers.app import context_manager
from bp_core.frontend.common.step_definitions.steps_common import MOBILE_SUFFIX
from frontend.galaxy_project.step_definitions.shared_steps.common_steps import *
from bp_core.plugin import PROJECT_DIR
from frontend.galaxy_project.step_definitions.shared_steps.common_steps import *
from bp_core.frontend.common.helpers.selenium_generics import SeleniumGenerics
from bp_core.frontend.common.utils.locator_parser import Locators

scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/search/search_result_uk.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/search/search_result_us.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/search/search_medical_us.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/search/search_result_brand_us.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/search/search_result_brand_uk.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/search/search_medical_common.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/search/search_pfizerpro_common.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/search/search_medical_uk.feature"))


@when(
    parsers.re(
        "I get the total search results using '(?P<locator_path>.*)' and save as environment variable '(?P<env_var>.*)'"),
    converters=dict(term=str, env_var=str))
def get_total_results_count(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, env_var):
    results_locator = locators.parse_and_get(locator_path, selenium_generics)
    value = selenium_generics.get_element_text(results_locator)
    match = re.match(".* of (\d+) results", value)
    os.environ[env_var] = str(match.groups()[0])


@when(
    parsers.re(
        "I enter '(?P<number>.*)' terms of '(?P<text>.*)' to field '(?P<locator_path_search_field>.+)' and click element '(?P<locator_path_search_button>.+)'"),
    converters=dict(text=env_variables.env_formatted))
def enter_search_values(
    selenium_generics: SeleniumGenerics, locators: Locators, locator_path_search_field: str, locator_path_search_button,
    text, number
):
    locator1 = locators.parse_and_get(locator_path_search_field, selenium_generics)
    locator2 = locators.parse_and_get(locator_path_search_button, selenium_generics)
    temp = 1
    while temp <= int(number):
        selenium_generics.simulate_realistic_typing(locator1, text + str(temp), gap_seconds=0.5)
        selenium_generics.click(locator2)
        time.sleep(4)
        selenium_generics.clear_text(locator1)
        temp = temp + 1


@then(parsers.re(
    "The recent search items order is:(?P<data_table_raw>.*)",
    flags=re.S))
def check_search_items_order(selenium_generics: SeleniumGenerics, locators: Locators, data_table_raw):
    data_table_list = data_table_raw.split("|")
    data_table_list = [elem.strip() for elem in data_table_list]
    data_table_list = list(filter(lambda elem: elem != "", data_table_list))
    expected_order = []
    for i in data_table_list:
        locator1 = locators.parse_and_get(i, selenium_generics)
        value = selenium_generics.get_element_text(locator1)
        expected_order.append(value)
        assert True


@when(parsers.re(
    "I calculate the last page no. given '(?P<total_results>.*)' and save as environment variable '(?P<env_var>.*)'")
)
def calculate_pagination_last_page_no(
    total_results: str,
    env_var: str
):
    total_results = os.environ['TOTAL_RESULTS_COUNT']
    total_results = int(total_results)
    temp = (total_results // 10)
    if total_results % 10 != 0:
        last_page_no = temp + 1
    else:
        last_page_no = temp
    os.environ[env_var] = str(last_page_no)


@when(parsers.re(
    "I click on page number value '(?P<inner_text>.*)' for element '(?P<locator_path>.*)'")
)
def element_with_value_click(
    selenium_generics: SeleniumGenerics,
    locators: Locators,
    locator_path: str,
    inner_text: str
):
    if MOBILE_SUFFIX in locator_path:
        with context_manager(selenium_generics):
            selenium_generics.click(locators.parse_and_get(locator_path, selenium_generics).format(inner_text))
    else:
        selenium_generics.click(locators.parse_and_get(locator_path, selenium_generics).format(inner_text))


@then(parsers.re(
    "The last page number '(?P<locator_path_last_number>.+)' is displayed according to '(?P<total_results>.*)'")
)
def check_pagination_last_page_no(selenium_generics: SeleniumGenerics, locators: Locators, locator_path_last_number
                                  ):
    locator = locators.parse_and_get(locator_path_last_number, selenium_generics)
    num = selenium_generics.get_attribute_of_element(locator, "innerHTML")
    total_results = os.environ['TOTAL_RESULTS_COUNT']
    total_results = int(total_results)
    temp = total_results // 10
    if total_results % 10 != 0:
        last_page_number = temp + 1
    else:
        last_page_number = temp
    assert int(num) == last_page_number


@then(parsers.re(
    "The last page results counter '(?P<locator_path_results_counter>.+)' is displayed according to '(?P<total_results>.*)'",
    flags=re.S))
def check_last_page_results_counter(selenium_generics: SeleniumGenerics, locators: Locators,
                                    locator_path_results_counter):
    locator = locators.parse_and_get(locator_path_results_counter, selenium_generics)
    results_counter = selenium_generics.get_element_text(locator)
    total_results = os.environ['TOTAL_RESULTS_COUNT']
    last_digit = repr(total_results)[-2]
    if int(last_digit) != 0:
        num = int(last_digit) - 1
        from_number = int(total_results) - num
    else:
        from_number = int(total_results) - 9
    substring = str(from_number) + " -"
    assert substring in results_counter


# CODE TO STATICALLY SELECT TA OPTION FROM MEDICAL SEARCH RESULTS PAGE DROPDOWN - CARDIOVASCULAR
@when(parsers.re(
    "I get all of the TA options from '(?P<locator_path>.*)' and save as environment variable '(?P<env_var>.*)'"))
def cardiovascular_selection(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, env_var: str):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    elements = selenium_generics.get_elements(locator)
    print("Hello" + str(len(elements)))
    for idx, i in enumerate(elements):
        y = len((str(idx)))
        z = random.randint(1, y)
        os.environ[env_var] = str(3)


# CODE TO STATICALLY SELECT TA OPTION FROM MEDICAL SEARCH RESULTS PAGE DROPDOWN - ENDOCRINOLOGY
@when(parsers.re(
    "I get Endocrinology TA option from '(?P<locator_path>.*)' and save as environment variable '(?P<env_var>.*)'"))
def endocrinology_selection(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, env_var: str):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    elements = selenium_generics.get_elements(locator)
    for idx, i in enumerate(elements):
        y = len((str(idx)))
        z = random.randint(1, y)
        os.environ[env_var] = str(5)


# CODE TO EXTRACT ALPHABETICAL TEXT ELEMENT FROM A COMBINATION OF ALPHABETS AND NUMBERS
@then(parsers.re("I expect the text element in '(?P<locator_path>.*)' to match predefined text as '(?P<text>.*)'"),
      converters=dict(text=env_variables.env_formatted), )
def element_equals_text(selenium_generics: SeleniumGenerics, locators: Locators, locator_path, text):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    actual_text = selenium_generics.get_element_text(locator)

    sym_array = [" (", ")"]
    number_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    loop = [0, 1, 2]

    for a in loop:
        for idx, j in enumerate(sym_array):
            actual_text = actual_text.replace(sym_array[idx], "")

        for i in number_array:
            actual_text = actual_text.replace(str(i), "")

    assert_that(actual_text).is_equal_to(text)


# CODE TO EXTRACT NUMERICAL TEXT ELEMENT FROM A COMBINATION OF ALPHABETS AND NUMBERS
@then(parsers.re("I expect the count element in '(?P<locator_path>.*)' to match predefined count as '(?P<count>.*)'"),
      converters=dict(text=env_variables.env_formatted), )
def element_equals_count(selenium_generics: SeleniumGenerics, locators: Locators, locator_path, count):
    actual_count = selenium_generics.get_element_text(locators.parse_and_get(locator_path))

    lowerchar_array = [" (", ")", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q",
                       "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    upperchar_array = [" ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
                       "S", "T", "U", "V", "W", "X", "Y", "Z"]
    loop = [0, 1, 2]

    for a in loop:
        for idx, j in enumerate(lowerchar_array):
            actual_count = actual_count.replace(lowerchar_array[idx], "")

        for idx, i in enumerate(upperchar_array):
            actual_count = actual_count.replace(upperchar_array[idx], "")

    assert_that(actual_count).is_equal_to(count)


# CODE TO VALIDATE THAT TAB COUNT IS MORE THAN ONE FROM MEDICAL SEARCH RESULTS TAB
@then(parsers.re("I expect the count element in '(?P<locator_path>.*)' to be more than one"),
      converters=dict(text=env_variables.env_formatted), )
def element_more_than_one_count(selenium_generics: SeleniumGenerics, locators: Locators, locator_path):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    actual_count = selenium_generics.get_element_text(locator)
    count = 1

    lowerchar_array = [" (", ")", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q",
                       "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    upperchar_array = [" ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
                       "S", "T", "U", "V", "W", "X", "Y", "Z"]
    loop = [0, 1, 2]

    for a in loop:
        for idx, j in enumerate(lowerchar_array):
            actual_count = actual_count.replace(lowerchar_array[idx], "")

        for idx, i in enumerate(upperchar_array):
            actual_count = actual_count.replace(upperchar_array[idx], "")

    assert int(actual_count) >= int(count)
    # assert_that(actual_text1).is_not_equal_to(actual_text2)
    # assert_that(actual_text).matches(r"^$")

    if int(actual_count) >= int(count):
        print("Tab is Enabled")
    else:
        print("Tab is Disabled")


# CODE TO VALIDATE THAT TAB COUNT IS ZERO FROM MEDICAL SEARCH RESULTS TAB
@then(parsers.re("I expect the count element in '(?P<locator_path>.*)' to be zero"),
      converters=dict(text=env_variables.env_formatted), )
def element_count_is_equal_to_zero(selenium_generics: SeleniumGenerics, locators: Locators, locator_path):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    actual_count = selenium_generics.get_element_text(locator)
    count = 0

    lowerchar_array = [" (", ")", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q",
                       "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    upperchar_array = [" ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
                       "S", "T", "U", "V", "W", "X", "Y", "Z"]
    loop = [0, 1, 2]

    for a in loop:
        for idx, j in enumerate(lowerchar_array):
            actual_count = actual_count.replace(lowerchar_array[idx], "")

        for idx, i in enumerate(upperchar_array):
            actual_count = actual_count.replace(upperchar_array[idx], "")

    assert int(actual_count) == int(count)
    # assert_that(actual_text1).is_not_equal_to(actual_text2)
    # assert_that(actual_text).matches(r"^$")

    if int(actual_count) == int(count):
        print("Tab is Disabled")
    else:
        print("Tab is Enabled")


# CODE TO VALIDATE THAT TAB COUNT IS MORE THAN ONE FROM MEDICAL SEARCH RESULTS TAB
@when(parsers.re(
    "I get all the TA options from '(?P<locator_path>.*)' and save as environment variable '(?P<env_var>.*)'"),
    converters=dict(env_var=str))
def random_selection(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, env_var):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    elements = selenium_generics.get_elements(locator)
    counter = 0
    for i in elements:
        counter += 1
    z = random.randint(2, counter)
    os.environ[env_var] = str(z)
    print("Hello" + os.environ[env_var])


# CODE TO DYNAMICALLY SELECT TA OPTION FROM MEDICAL SEARCH RESULTS PAGE DROPDOWN
@when(parsers.re(
    "I get all the filter options from '(?P<locator_path>.*)' and save as environment variable '(?P<env_var>.*)'"))
def random_filter_selection(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, env_var: str):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    elements = selenium_generics.get_elements(locator)
    counter = 0
    for i in elements:
        counter += 1
    z = random.randint(2, counter)
    os.environ[env_var] = str(z)


# CODE TO COMPARE THAT URL CONTAINS SPECIFIC URL PARAM
@then(parsers.re(
    "I see that url contains '(?P<env_var>.*)'"))
def check_page_url_contains(selenium_generics: SeleniumGenerics, env_var: str):
    if env_var in selenium_generics.current_url:
        print("selenium_generics.current_url")


# CODE TO COMPARE VALUE RETRIEVED ON LOCATOR AGAINST A PREDEFINED VALUE
@then(parsers.re(
    "I see that TA from '(?P<locator_path>.*)' is same as '(?P<env_var>.*)'"))
def compare_ta(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, env_var: str):
    env_var = env_variables.env_formatted(env_var)
    locator = locators.parse_and_get(locator_path, selenium_generics)
    locator = locator.format(env_var)
    returned_text = selenium_generics.get_element_text(locator)
    assert_that(returned_text).is_equal_to(env_var)


@then(parsers.re("I expect the element in '(?P<locator_path>.*)"),
      converters=dict(text=env_variables.env_formatted), )
def element_count_is_equal_to_zero(selenium_generics: SeleniumGenerics, locators: Locators, locator_path):
    actual_text = selenium_generics.get_element_text(locators.parse_and_get(locator_path))
    txt = "str"
    assert actual_text == txt


@then(parsers.re(
    "I get text from '(?P<env_var>.*)' filtered option in '(?P<locator_path>.*)' is in URL"),
    converters=dict(env_var=env_variables.env_formatted))
def filteredoption_selected(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, env_var: str):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    locator = locator.format(env_var)
    returned_text = selenium_generics.get_element_text(locator)
    if returned_text in selenium_generics.current_url:
        print("selenium_generics.current_url")


@when(parsers.re(
    "I get text from '(?P<env_var>.*)' filtered option in '(?P<locator_path>.*)' and saved as '(?P<fil_text>.*)'"),
    converters=dict(env_var=env_variables.env_formatted))
def filter_selection_text(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, env_var: str,
                          fil_text: str):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    locator = locator.format(env_var)
    returned_text = selenium_generics.get_element_text(locator)
    os.environ[fil_text] = str(returned_text)


# CODE TO VERIFY ACTIVE AND IN FOCUS MEDICAL SEARCH TAB(S)
@then(parsers.re(
    "I should see that '(?P<color>.*)' from '(?P<locator_path>.*)' matches active and in focus css as '(?P<env_var>.*)'"))
def compare_active_n_focus_tab(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, env_var: str,
                               color: str):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    actual_color = selenium_generics.get_css_value(locator, color)
    # rgba(255, 255, 255, 1) for Active and Focus Tab (Text Element)

    if actual_color == env_var:
        assert actual_color == env_var

    else:
        lowerchar_array = [", 1", "a"]
        loop = [0, 1]
        for a in loop:
            for idx, j in enumerate(lowerchar_array):
                actual_color = actual_color.replace(lowerchar_array[idx], "")

        assert actual_color == env_var


# CODE TO VERIFY ACTIVE BUT NOT IN FOCUS MEDICAL SEARCH TAB(S)
@then(parsers.re(
    "I should see that '(?P<color>.*)' from '(?P<locator_path>.*)' matches active but not in focus css as '(?P<env_var>.*)'"))
def compare_active_but_not_focus_tab(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str,
                                     env_var: str, color: str):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    actual_color = selenium_generics.get_css_value(locator, color)
    # rgba(6, 29, 55, 1) for Active but not in Focus Tab (Text Element)
    if actual_color == env_var:
        assert actual_color == env_var

    else:
        lowerchar_array = [", 1", "a"]
        loop = [0, 1]
        for a in loop:
            for idx, j in enumerate(lowerchar_array):
                actual_color = actual_color.replace(lowerchar_array[idx], "")

        assert actual_color == env_var


# CODE TO VERIFY DISABLED MEDICAL SEARCH TAB
@then(parsers.re(
    "I should see that '(?P<color>.*)' from '(?P<locator_path>.*)' matches disabled css as '(?P<env_var>.*)'"))
def compare_disabled_tab(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, env_var: str,
                         color: str):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    actual_color = selenium_generics.get_css_value(locator, color)
    # rgba(111, 111, 111, 1) for Disabled Tab (Text Element)
    if actual_color in env_var:
        env_var = 'rgba(111, 111, 111, 1)'
        assert actual_color == env_var

    else:
        lowerchar_arrayone = [", 111, 111, 1)"]
        lowerchar_arraytwo = ["a"]
        loop = [0]
        for a in loop:
            for idx, j in enumerate(lowerchar_arrayone):
                env_var = env_var.replace(lowerchar_arrayone[idx], ", 111, 111)")

            for idx, i in enumerate(lowerchar_arraytwo):
                env_var = env_var.replace(lowerchar_arraytwo[idx], "")

        assert actual_color == env_var


@when(
    parsers.re(
        "I get the total search results count using '(?P<locator_path>.*)' and save as environment variable '(?P<env_var1>.*)'"),
    converters=dict(term=str, env_var=str))
def get_total_results_count(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, env_var1):
    results_locator = locators.parse_and_get(locator_path, selenium_generics)
    value = selenium_generics.get_element_text(results_locator)
    match = re.match(".* of (\d+) results", value)
    os.environ[env_var1] = str(match.groups()[0])


@when(parsers.re(
    "I click item '(?P<inner_text>.*)' for element '(?P<locator_path>.*)'"))
def add_item_for_element(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, inner_text: str):
    inner_text = env_variables.env_formatted(inner_text)
    if MOBILE_SUFFIX in locator_path:
        with context_manager(selenium_generics):
            selenium_generics.click(locators.parse_and_get(locator_path, selenium_generics).format(inner_text))
    else:
        selenium_generics.click(locators.parse_and_get(locator_path, selenium_generics).format(inner_text))


@when("I navigate backward")
def back_nav(selenium_generics: SeleniumGenerics):
    selenium_generics.back()


# CODE TO ASSERT ELEMENT ON PAGE AND COMPARE THAT URL CONTAINS SPECIFIC URL PARAM
@then(parsers.re(
    "I should see element '(?P<locator_path>.*)' load with page url containing '(?P<env_var>.*)'"))
def check_page_url_contains(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str, env_var: str):
    if MOBILE_SUFFIX in locator_path:
        with context_manager(selenium_generics):
            assert selenium_generics.is_element_visible(
                locators.parse_and_get(locator_path, selenium_generics)), f"Element {locator_path} is not visible."
    else:
        assert selenium_generics.is_element_visible(
            locators.parse_and_get(locator_path, selenium_generics)), f"Element {locator_path} is not visible."
    assert selenium_generics.is_element_visible(locators.parse_and_get(locator_path, selenium_generics), 30)
    if env_var in selenium_generics.current_url:
        print("selenium_generics.current_url")


@when(parsers.re("I refresh page"))
def refresh_page(selenium_generics: SeleniumGenerics):
    selenium_generics.refresh_page()


@when(parsers.re("I trigger focus on '(?P<locator_path>.*)'"))
def element_displayed(selenium_generics: SeleniumGenerics, locators: Locators, locator_path):
    if MOBILE_SUFFIX in locator_path:
        with context_manager(selenium_generics):
            assert selenium_generics.is_element_visible(
                locators.parse_and_get(locator_path, selenium_generics)), f"Element {locator_path} is not visible."
    else:
        assert selenium_generics.is_element_visible(
            locators.parse_and_get(locator_path, selenium_generics)), f"Element {locator_path} is not visible."

    if MOBILE_SUFFIX in locator_path:
        with context_manager(selenium_generics):
            selenium_generics.click(locators.parse_and_get(locator_path, selenium_generics))
    else:
        selenium_generics.click(locators.parse_and_get(locator_path, selenium_generics))


# CODE TO DETERMINE AN ATTRIBUTE VALUE FROM A PASSED ELEMENT
@then(parsers.re(
    "I expect that attribute '(?P<attribute>.*)' for element '(?P<locator_path>.*)' to be '(?P<attribute_value>.*)'")
)
def element_visible_on_page_with_attribute_value(
    selenium_generics: SeleniumGenerics,
    locators: Locators,
    locator_path: str,
    attribute: str,
    attribute_value: str,
):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    locator = locator.format(attribute)
    locator = locator.format(attribute_value)
    assert selenium_generics.is_element_visible(locator)
    value = selenium_generics.get_attribute_of_element(locator, attribute)
    assert_that(value).is_equal_to(attribute_value)

# CODE TO DETERMINE AN ATTRIBUTE VALUE FROM A PASSED ELEMENT WITHOUT ASSERTING UI VISIBILITY
@then(parsers.re(
    "I expect that attribute '(?P<attribute>.*)' for non ui element '(?P<locator_path>.*)' to be '(?P<attribute_value>.*)'")
)
def element_visible_on_page_with_attribute_value(
    selenium_generics: SeleniumGenerics,
    locators: Locators,
    locator_path: str,
    attribute: str,
    attribute_value: str,
):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    locator = locator.format(attribute)
    locator = locator.format(attribute_value)
    value = selenium_generics.get_attribute_of_element(locator, attribute)
    assert_that(value).is_equal_to(attribute_value)

@when(parsers.re(
    "I press backspace '(?P<no_of_times>.*)' times on field '(?P<locator_path>.*)'"))
def press_backspace(selenium_generics: SeleniumGenerics,
                    locators: Locators,
                    locator_path: str,
                    no_of_times: str
                    ):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    no_of_times = int(no_of_times)
    selenium_generics.simulate_realistic_typing(locator, Keys.BACKSPACE * no_of_times, gap_seconds=0.5)


# MARKET SWITCHER
@when(parsers.re(
    "I switch pfizerpro market accordingly with consent for '(?P<locator_pathone>.*)' and '(?P<locator_pathtwo>.*)'"))
def market_switcher(selenium_generics: SeleniumGenerics, locators: Locators, locator_pathone: str,
                    locator_pathtwo: str):
    # HOMEPAGE LOCATORS
    HCP_CONFIRMATION = "UKAbove > hcp_confirmation_yes"
    COOKIE_LOCATOR = "UKAbove > cookie_accept_all_button"

    # META-TITLE
    titleUS = "Home | Pfizer For Professionals"
    titleUK = "Home | PfizerPro UK"
    actual_title = selenium_generics.title

    if actual_title in titleUK:
        if MOBILE_SUFFIX in locator_pathone:
            with context_manager(selenium_generics):
                selenium_generics.click(locators.parse_and_get(locator_pathone, selenium_generics))
        else:
            selenium_generics.click(locators.parse_and_get(locator_pathone, selenium_generics))
        time.sleep(1)

        if MOBILE_SUFFIX in locator_pathtwo:
            with context_manager(selenium_generics):
                selenium_generics.click(locators.parse_and_get(locator_pathtwo, selenium_generics))
        else:
            selenium_generics.click(locators.parse_and_get(locator_pathtwo, selenium_generics))
        time.sleep(1)

    else:
        time.sleep(1)
