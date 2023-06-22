# pylint: disable=line-too-long

has_class = 'contains( concat(" ", normalize-space(@class), " "), " {} " )'


class ForbiddenPageLocators:
    forbidden_page = "//div[@class='error-message']//div[text()='403']"


class BriefHomePageLocators:
    create_new_brief = '//a[contains(text(),"New Project Brief")]'
    exit_btn = '//a[normalize-space(.)="Exit"]'
    logout_form = '//*[@id="logout-form"]'

class BriefStandardsPageLocators:
    baseline_info_by_text = f'//div[ contains(@class, "tw-items-baseline" ) and following::p[ contains(text(), "{{}}") ] ]'
    back_to_top = '//div[contains(@class, "return-to-top")]'
