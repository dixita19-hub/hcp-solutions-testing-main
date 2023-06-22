import pytest

from bp_core.backend.common.step_definitions.steps_common import *

USER_UNIQUE = "user_unique"

USER_UNIQUE_ENDPOINT = "v1/check-user-unique"


@pytest.mark.nondestructive
@pytest.mark.automated
@pytest.mark.api
@pytest.mark.user_unique
@pytest.mark.test_name("Verify unique user")
def test_user_unique(request, api_response_container):
    set_request_endpoint(request, request_name=USER_UNIQUE, base_url='{%GRV_URL%}', endpoint=USER_UNIQUE_ENDPOINT)
    set_request_headers(request, request_name=USER_UNIQUE,
                        headers="./test_data/api/payloads/headers.json")
    add_json_payload(request, request_name=USER_UNIQUE, payload="./test_data/api/payloads/user_unique.json")
    make_api_request(request, api_response_container, request_name=USER_UNIQUE, request_type='POST')
    response = get_api_response(request, api_response_container, request_name=USER_UNIQUE)
    assert response.status_code == 200
