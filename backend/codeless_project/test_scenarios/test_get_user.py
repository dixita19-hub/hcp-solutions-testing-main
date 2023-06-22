import pytest

from bp_core.backend.common.step_definitions.steps_common import *
from bp_core.backend.common.utils.utils import load_json_file

LOGIN_USER = "login_user"
LOGIN_ENDPOINT = "v1/login"
AUTHORIZE_USER = "authorize_user"
AUTHORIZE_USER_ENDPOINT = "v1/authorize"
GET_USER = "get_user"
USER_ENDPOINT = "v1/user"


@pytest.mark.nondestructive
@pytest.mark.automated
@pytest.mark.api
@pytest.mark.get_user
@pytest.mark.test_name("Verify get user details")
def test_get_user(request, api_response_container):
    # login_user
    set_request_endpoint(request, request_name=LOGIN_USER, base_url='{%GRV_URL%}', endpoint=LOGIN_ENDPOINT)
    set_request_headers(request, request_name=LOGIN_USER,
                        headers="./test_data/api/payloads/headers.json")
    add_json_payload(request, request_name=LOGIN_USER, payload={
        "context": "login",
        "payload": {
            "traditionalSignIn_emailAddress": "mocked-s3-test-user@pfizer.com",
            "traditionalSignIn_password": "Pfizer@123"
        }
    })
    make_api_request(request, api_response_container, request_name=LOGIN_USER, request_type='POST')
    response = get_api_response(request, api_response_container, request_name=LOGIN_USER)
    assert response.status_code == 200

    # authorize_user
    set_request_endpoint(request, request_name=AUTHORIZE_USER, base_url='{%GRV_URL%}', endpoint=AUTHORIZE_USER_ENDPOINT)
    set_request_headers(request, request_name=AUTHORIZE_USER,
                        headers="./test_data/api/payloads/headers.json")
    setup_basic_auth(request, username="z45svpfudtfhyw7kizlwxyoj66c2rwcw", password="kzriq788uaik1z3xpr4797y8p5k3bnof")
    authorize_user = load_json_file("./test_data/api/payloads/authorize_user.json")
    authorize_user["payload"]["code"] = get_auth_code(request, api_response_container)
    add_json_payload(request, request_name=AUTHORIZE_USER, payload=authorize_user)
    make_api_request(request, api_response_container, request_name=AUTHORIZE_USER, request_type='POST')
    response = get_api_response(request, api_response_container, request_name=AUTHORIZE_USER)
    assert response.status_code == 200

    # get_user
    set_request_endpoint(request, request_name=GET_USER, base_url='{%GRV_URL%}', endpoint=USER_ENDPOINT)
    token = get_access_token(request, api_response_container)
    headers = load_json_file("./test_data/api/payloads/headers.json")
    headers["oauth-token"] = token
    set_request_headers(request, request_name=GET_USER, headers=headers)
    setup_basic_auth(request, username="z45svpfudtfhyw7kizlwxyoj66c2rwcw", password="kzriq788uaik1z3xpr4797y8p5k3bnof")
    make_api_request(request, api_response_container, request_name=GET_USER, request_type='GET')
    response = get_api_response(request, api_response_container, request_name=GET_USER)
    assert response.status_code == 200


def get_auth_code(request, api_response_container):
    response = get_api_response(request, api_response_container, request_name=LOGIN_USER)
    return response.json().get("authorization_code")


def get_access_token(request, api_response_container):
    response = get_api_response(request, api_response_container, request_name=AUTHORIZE_USER)
    return response.json().get("access_token")
