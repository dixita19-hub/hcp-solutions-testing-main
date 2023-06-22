import uuid
from datetime import datetime

import pytest

from bp_core.backend.common.step_definitions.steps_common import *
from bp_core.backend.common.utils.utils import load_json_file

CREATE_USER = "create_user"

USER_ENDPOINT = "v1/user"


@pytest.mark.nondestructive
@pytest.mark.automated
@pytest.mark.api
@pytest.mark.create_user
@pytest.mark.test_name("Verify create user")
def test_create_user(request, api_response_container):
    set_request_endpoint(request, request_name=CREATE_USER, base_url='{%GRV_URL%}', endpoint=USER_ENDPOINT)
    set_request_headers(request, request_name=CREATE_USER,
                        headers="./test_data/api/payloads/headers.json")
    user = load_json_file("./test_data/api/payloads/create_user.json")
    user["payload"]["email"] = get_new_email()
    add_json_payload(request, request_name=CREATE_USER, payload=user)
    make_api_request(request, api_response_container, request_name=CREATE_USER, request_type='POST')
    response = get_api_response(request, api_response_container, request_name=CREATE_USER)
    assert response.status_code == 200


def get_new_email():
    return str(uuid.uuid4()) + datetime.now().strftime('%Y%m%d%H%M%S') + '@pfizer.com'
