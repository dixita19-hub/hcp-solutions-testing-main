
import pytest
from pytest_bdd import given, parsers

from frontend.grv_project.page_objects.ultimateqa_automation_page import UltimateqaAutomationPage


@given(parsers.re("I navigate to '(?P<page_name>.*)' page"), converters=dict(page_name=str))
def navigate_to_efficacy_tab_1(selenium, base_url, variables, page_name):
    if variables['env']['device'] == 'desktop':
        selenium.set_window_size('1366', '768')
    pass
    UltimateqaAutomationPage(selenium, base_url, variables['env']).open()
