import pytest

from bp_core.backend.common.step_definitions.steps_common import *

FORGOT_PASSWORD = "forgot_password"

FORGOT_PASSWORD_ENDPOINT = "v1/forgot-password"


@pytest.mark.nondestructive
@pytest.mark.automated
@pytest.mark.api
@pytest.mark.forgot_password
@pytest.mark.test_name("Verify forgot password")
def test_forgot_password(request, api_response_container):
    set_request_endpoint(request, request_name=FORGOT_PASSWORD, base_url='{%GRV_URL%}',
                         endpoint=FORGOT_PASSWORD_ENDPOINT)
    set_request_headers(request, request_name=FORGOT_PASSWORD,
                        headers="./test_data/api/payloads/headers.json")
    add_json_payload(request, request_name=FORGOT_PASSWORD, payload="./test_data/api/payloads/forgot_password.json")
    make_api_request(request, api_response_container, request_name=FORGOT_PASSWORD, request_type='POST')
    response = get_api_response(request, api_response_container, request_name=FORGOT_PASSWORD)
    assert response.status_code == 200
