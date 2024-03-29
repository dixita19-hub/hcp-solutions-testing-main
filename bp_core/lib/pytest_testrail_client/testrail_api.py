"""
Description
"""
from __future__ import annotations

from . import _category
from ._exception import TestRailConfigurationError
from ._session import Session


def validate_setup(tr: TestRailAPI, project_id):
    if not project_id:
        TestRailConfigurationError(
            f"Project ID must be set. Invalid value {project_id}"
        )

    """ This can be un-commented after completely moving to Project Type1"""
    # project_id = int(project_id)
    # if tr.projects.get_project(project_id).suite_mode != 1:
    #     TestRailConfigurationError(
    #         f"Project suite_mode {tr.projects.get_project().suite_mode} not compatible with this plugin. "
    #         f"Use Single repository to manage cases"
    #     )


class TestRailAPI(Session):
    @property
    def cases(self):
        """http://docs.gurock.com/testrail-api2/reference-cases"""
        return _category.Cases(self)

    @property
    def case_fields(self):
        """http://docs.gurock.com/testrail-api2/reference-cases-fields"""
        return _category.CaseFields(self)

    @property
    def case_types(self):
        """http://docs.gurock.com/testrail-api2/reference-cases-types"""
        return _category.CaseTypes(self)

    @property
    def configurations(self):
        """http://docs.gurock.com/testrail-api2/reference-configs"""
        return _category.Configurations(self)

    @property
    def milestones(self):
        """http://docs.gurock.com/testrail-api2/reference-milestones"""
        return _category.Milestones(self)

    @property
    def plans(self):
        """http://docs.gurock.com/testrail-api2/reference-plans"""
        return _category.Plans(self)

    @property
    def priorities(self):
        """http://docs.gurock.com/testrail-api2/reference-priorities"""
        return _category.Priorities(self)

    @property
    def projects(self):
        """http://docs.gurock.com/testrail-api2/reference-projects"""
        return _category.Projects(self)

    @property
    def results(self):
        """http://docs.gurock.com/testrail-api2/reference-results"""
        return _category.Results(self)

    @property
    def result_fields(self):
        """http://docs.gurock.com/testrail-api2/reference-results-fields"""
        return _category.ResultFields(self)

    @property
    def runs(self):
        """http://docs.gurock.com/testrail-api2/reference-runs"""
        return _category.Runs(self)

    @property
    def sections(self):
        """http://docs.gurock.com/testrail-api2/reference-runs"""
        return _category.Sections(self)

    @property
    def statuses(self):
        """http://docs.gurock.com/testrail-api2/reference-sections"""
        return _category.Statuses(self)

    @property
    def suites(self):
        """http://docs.gurock.com/testrail-api2/reference-suites"""
        return _category.Suites(self)

    @property
    def templates(self):
        """http://docs.gurock.com/testrail-api2/reference-templates"""
        return _category.Templates(self)

    @property
    def tests(self):
        """http://docs.gurock.com/testrail-api2/reference-tests"""
        return _category.Tests(self)

    @property
    def users(self):
        """http://docs.gurock.com/testrail-api2/reference-users"""
        return _category.Users(self)

    @property
    def attachments(self) -> _category.Attachments:
        """http://docs.gurock.com/testrail-api2/reference-attachments"""
        return _category.Attachments(self)
