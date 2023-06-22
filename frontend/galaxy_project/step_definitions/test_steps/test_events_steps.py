import os
import time

from pytest_bdd import scenarios
from frontend.galaxy_project.step_definitions.shared_steps.common_steps import *
from pytest_bdd import scenarios, when, then, parsers, given
from bp_core.plugin import PROJECT_DIR
from bp_core.frontend.common.helpers.selenium_generics import SeleniumGenerics

from datetime import datetime
from bp_core.frontend.common.utils.locator_parser import Locators

scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/events/common_uk.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/events/common_us.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/events/events_us.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/events/events_uk.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/events/materials_uk.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/events/materials_us.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/events/videos_us.feature"))
scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/events/videos_uk.feature"))

scenarios(os.path.join(PROJECT_DIR, "frontend/galaxy_project/features/events/podcasts_us.feature"))


@then(parsers.re("I expect '(?P<locator_path_pagination>.*)' when 9 '(?P<locator_path_cards>.*)' are displayed"),
      converters=dict(locator_path_pagination=str, locator_path_cards=str))
def check_pagination(selenium_generics: SeleniumGenerics, locators: Locators, locator_path_pagination: str,
                     locator_path_cards: str):
    locator_cards = locators.parse_and_get(locator_path_cards, selenium_generics)
    cards = selenium_generics.get_elements(locator_cards)
    locator_pagination = locators.parse_and_get(locator_path_pagination, selenium_generics)
    if len(cards) == 9:
        assert selenium_generics.is_element_visible(locator_pagination)
    else:
        assert selenium_generics.is_element_invisible(locator_pagination)


@then(parsers.re(
    "I expect '(?P<locator_path_pagination>.*)' when less than 9 '(?P<locator_path_cards>.*)' are displayed"),
      converters=dict(locator_path_pagination=str, locator_path_cards=str))
def check_pagination(selenium_generics: SeleniumGenerics, locators: Locators, locator_path_pagination: str,
                     locator_path_cards: str):
    locator_cards = locators.parse_and_get(locator_path_cards, selenium_generics)
    cards = selenium_generics.get_elements(locator_cards)
    locator_pagination = locators.parse_and_get(locator_path_pagination, selenium_generics)
    if len(cards) < 9:
        assert selenium_generics.is_element_visible(locator_pagination)


@then(parsers.re("I see the video '(?P<locator_path_video>.*)' and timer '(?P<locator_path_timer>.*)' is progressing"),
      converters=dict(locator_path_video=str, locator_path_timer=str))
def check_video_playing(selenium_generics: SeleniumGenerics, locators: Locators, locator_path_video: str,
                        locator_path_timer: str):
    locator_video = locators.parse_and_get(locator_path_video, selenium_generics)
    selenium_generics.scroll_into_view(locator_video)
    selenium_generics.click(locator_video)
    selenium_generics.click(locator_video)
    locator_timer = locators.parse_and_get(locator_path_timer, selenium_generics)
    start_time = selenium_generics.get_element_text(locator_timer)
    # Wait for 15 seconds for the video to play. Verify current timer after that.
    time.sleep(15)
    selenium_generics.click(locator_video)
    final_time = selenium_generics.get_element_text(locator_timer)
    assert datetime.strptime(final_time, '%H:%M').time() > datetime.strptime(start_time, '%H:%M').time()


@then(parsers.re("The element '(?P<locator_path>.*)' is not present"), converters=dict(locator_path=str))
@then(parsers.re("I expect that element '(?P<locator_path>.*)' is not present"), converters=dict(locator_path=str))
def element_not_present(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str):
    assert not selenium_generics.is_element_present_on_dom(
        locators.parse_and_get(locator_path, selenium_generics)), f"Element {locator_path} is present."


# WEB context Predefined Step Update
@then(parsers.re("The url opened in new (tab|window) contains '(?P<url>.*)'"))
def check_is_opened_in_new_window(selenium_generics: SeleniumGenerics, url: str):
    selenium_generics.switch_to_last_window()
    assert selenium_generics.does_current_url_contains(url)


@when(parsers.re(
    "I save count of preferred TA cards '(?P<locator_path>.*)' and save as environment variable '(?P<env_var1>.*)'"),
    converters=dict(locator_path=str))
def get_preferred_cards_count(selenium_generics: SeleniumGenerics, locators: Locators, locator_path, env_var1: str):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    elements = selenium_generics.get_elements(locator)
    ta_count = len(elements)
    os.environ[env_var1] = str(ta_count)


@then(parsers.re(
    "The count of preferred TAs '(?P<total_cards>.*)' is same as TA preferences '(?P<locator_path>.*)'"),
    converters=dict(locator_path=str))
def check_element_count(selenium_generics: SeleniumGenerics, locators: Locators, locator_path, total_cards: str):
    locator = locators.parse_and_get(locator_path, selenium_generics)
    total_cards = os.environ['TOTAL_TA_CARDS']
    ta_preferences = selenium_generics.get_elements(locator)
    pref_count = len(ta_preferences)
    assert total_cards == str(pref_count)


@then(parsers.re(
    "I should see that '(?P<color>.*)' from '(?P<locator_path>.*)' matches active and in focus css as '(?P<env_var>.*)'"))
def compare_active_n_focus_tab(selenium_generics: SeleniumGenerics, locators: Locators, locator_path: str,
                               env_var: str,
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




