import pytest


# We need this fixture to override the pytest_selenium default implementation for non-bdd tests
@pytest.fixture
def driver():
    return


@pytest.fixture(scope="session")
def api_response_container() -> dict:
    return dict()
