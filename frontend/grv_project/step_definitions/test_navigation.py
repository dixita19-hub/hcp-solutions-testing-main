from pytest_bdd import given, when, then, scenarios, parsers
from frontend.grv_project.page_objects.ultimateqa_automation_page import UltimateqaAutomationPage
import os
PROJECT_DIR = os.getcwd()
#scenarios(os.path.join(PROJECT_DIR, "./frontend/grv_project/features/registration/Registration_Step_1/registration_Step_1_first_last_name_email.feature"))



@when(parsers.re("I click on '(?P<link_name>.*)' link"), converters=dict(link_name=str))
def navigate_to_efficacy_tab_1(selenium, base_url, variables, link_name):
    UltimateqaAutomationPage(selenium, base_url, variables['env']).click_link(link_name)
