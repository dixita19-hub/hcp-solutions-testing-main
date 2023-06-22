import pytest

from bp_core.backend.common.step_definitions.steps_common import *

LOGIN_USER = "login_user"

LOGIN_ENDPOINT = "v1/login"


@pytest.mark.nondestructive
@pytest.mark.automated
@pytest.mark.api
@pytest.mark.login
@pytest.mark.test_name("Verify user login")
def test_login_user(request, api_response_container):
    set_request_endpoint(request, request_name=LOGIN_USER, base_url='{%GRV_URL%}', endpoint=LOGIN_ENDPOINT)
    set_request_headers(request, request_name=LOGIN_USER,
                        headers="./test_data/api/payloads/headers.json")
    add_json_payload(request, request_name=LOGIN_USER, payload="./test_data/api/payloads/login.json")
    make_api_request(request, api_response_container, request_name=LOGIN_USER, request_type='POST')
    response = get_api_response(request, api_response_container, request_name=LOGIN_USER)
    assert response.status_code == 200
