Usage Instructions for API Testing using Pytest Boilerplate Framework
======================================================================

Collection Approach
-------------------
In this approach, all the request parameters are stored as a collection in a .json file, placed within the framework defined test data folder. Current defined test data folder for storing collections is `test_data/api/collections`. It has to be noted that one collection (.json) file corresponds to one request. Users are free to organize their collections as child folders within. For example, if we want to categorize our collections based on requests sections, like `get_users`, `create_user`, `update_user`, etc, then we can create our collections in a structure similar to below:

    -----------Folder Tree Start--------------------
    |                                              |
    |test_data/                                    |
    |  api/                                        |
    |      collections/                            |
    |          get_users/                          |
    |              valid_use_case.json             |
    |              invalid_use_case.json           |
    |          create_user/                        |
    |              create_valid_user.json          |
    |              create_existing_user.json       |
    |          update_user/                        |
    |              update_non_existent_user.json   |
    |              update_valid_user.json          |
    |                                              |
    ---------------Folder Tree End -----------------

    -----------------------------Sample collection file format -1 (.json)----------------------------------
    | # This is a sample comment in a .json file.                                                         |
    | # Any reference to environment variables should be enclosed within "{%" and "%}"                    |
    | # In below example, API_BASE_URL is an environment variable with value https://httpbin.org          |
    | # test.json is a reference to external json payload, which should be saved in child folders or      |
    | # directly within `test_data/api/payloads` folder - framework defined payloads folder structure     |
    | CONSTANT-1 = "My First Constant"                                                                    |
    |   {                                                                                                 |
    |   "CONSTANT-1": "My First Constant",                                                                |
    |   "CONSTANT-2": 1000,                                                                               |
    |   "request-args": {                                                                                 |
    |      "url": "{%API_BASE_URL%}",                                                                     |
    |      "json": "test.json",                                                                           |
    |      "timeout": 1,                                                                                  |
    |      "params": {                                                                                    |
    |         "search": 1,                                                                                |
    |         "q": "my-param"                                                                             |
    |      },                                                                                             |
    |      "headers": {                                                                                   |
    |         "accept": "application/json",                                                               |
    |         "set-cookies": "Cookies: True"                                                              |
    |      }                                                                                              |
    |   },                                                                                                |
    |   "set-env": {                                                                                      |
    |      "PRODUCT_FORM": "$.data"                                                                       |
    |   }                                                                                                 |
    |}                                                                                                    |                                   
    -------------------------------------------------------------------------------------------------------

    -----------------------------Sample collection file format -2 (.json)----------------------------------
    | # This is a sample comment in a .json file.                                                         |
    | # Any reference to constants defined in the collection should be enclosed within "{{" and "}}"      |
    | {                                                                                                   |                                     
    |  "CONSTANT-2": 1000,                                                                                |
    |  "TIMEOUT": 5,                                                                                      |
    |  "request-args": {                                                                                  |
    |    "url": "https://httpbin.org",                                                                    |
    |    "headers": {                                                                                     |
    |      "accept": "application/json",                                                                  |
    |      "set-cookies": "Cookies: True"                                                                 |
    |    },                                                                                               |
    |    "json": {                                                                                        |
    |      "my-data": "hello",                                                                            | 
    |      "my_num": 10,                                                                                  |
    |      "set-cookies": true                                                                            |  
    |    },                                                                                               |
    |    "params": {                                                                                      |
    |      "q": "my-param",                                                                               |
    |      "search": 1                                                                                    |
    |   }                                                                                                 |
    |  },                                                                                                 |
    |  "set-env": {                                                                                       |
    |    "PRODUCT_FORM": "$.data"                                                                         |  
    | }                                                                                                   |
    |}                                                                                                    |
    -------------------------------------------------------------------------------------------------------

### Key Points
* All the arguments that has to be passed in requests like url, json, params, headers, timeout, etc. should be put inside the **`[request-args]`** table.
* **`[set-env]`** table takes multiple key-value pairs (and is optional) in case where we want to take some values from response output and add them to environment variables. key-value pairs would be NAME-JSONPATH, where NAME is the environment variable that has to be created, and value is a jsonpath corresponding to the value from response json. For details on jsonpath, please have a read:
    1. https://pypi.org/project/jsonpath-ng/
    2. https://github.com/h2non/jsonpath-ng
    3. https://www.journaldev.com/33265/python-jsonpath-examples

### Common Step Definitions
1. <strong>Make Request</strong>
To make a request - This is the only step definition required to make a http call, save response and any environment variables from response. This request is applicable for both Given & When steps. This step takes in three variables:
    * request type - GET, POST, PUT, PATCH, DELETE
    * request name - an identifier/variable name to identify a unique request within a test case/scenario.
          In this example, 'auth-flow' is the request name.
    * collection path - Path to collection file.


2. <strong>Authentication</strong>
Framework supports Basic, Bearer and Digest Authentication modes. For other authentication, respective apps must add custom authentication step definitions. All steps should be implemented as Given. For all steps, credentials can be hardcoded or substituted from environment variables enclosed in pairs of {% and %}. For example, {%API_BASE_URL%}
```
    ----------------------------------------------------------------------------------------------------
    |   Given BASIC Auth is setup with username 'user' and password 'passwd'                           |
    |   Given DIGEST Auth is setup with username 'user' and password 'passwd'                          |
    |   Given BEARER Auth is setup with bearer token 'my-bearer-token-a123-j09867'                     |
    ----------------------------------------------------------------------------------------------------
```

3. <strong>Response Verification</strong>
Verifying Status Codes & Response Content - All the verification items would be using Then step, and all the items are at request level, i.e. request name would be specified for all the steps. All response json verification is done using jsonpath.
```
    ----------------------------------------------------------------------------------------------------
    |   # verify status code: 'auth-flow' -> request name & '200' -> Status Code                       |
    |   Then I Verify Status Code of request 'auth-flow' equals '200'                                  |
    |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
    |   # verify value type                                                                            |
    |   And I verify value TYPE:                                                                       |
    |        | name_of_request | jsonpath_str    | type |                                              |
    |        | auth-flow       | $.authenticated | true |                                              |
    |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
    |   # verify value equality - this supports multiple values verification for a request             |
    |   And I verify values equality for request 'my-request':                                         |
    |        | jsonpath_str    |  expected_value   |                                                   |
    |        | $.user          | {%CODELESS-USER%} |                                                   |
    |        | $.json.data     |      1            |                                                   |
    |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
    |   # verify value inequality                                                                      |
    |   And I verify value NOT EQUALS:                                                                 |
    |        | name_of_request | jsonpath_str    |  not_expected_value   |                             |
    |        | my-request      | $.user          |  {%CODELESS-USER%}    |                             |
    |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
    |   # verify value length                                                                          |
    |   And I verify value LENGTH:                                                                     |
    |        | name_of_request | jsonpath_str    | length |                                            |
    |        | auth-flow       | $.authenticated | 6      |                                            |
    |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
    |   # verify value is non-null                                                                     |
    |   And I verify value is NON-NULL:                                                                |
    |        | name_of_request | jsonpath_str    |                                                     |
    |        | auth-flow       | $.authenticated |                                                     |
    |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
    |   # verify value membership                                                                      |
    |   Then I verify integer '17' is a member of 'request-name > $.projects[*].id'                    |
    |   The I verify real number '17.002' is a member of 'request-name > $.projects[*].id'             |
    |   Then I verify text 'my-value' is a member of 'request-name > $.projects[*].name'               |
    |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
    |   # verify value non-membership                                                                  |
    |   Then I verify integer '17' is not a member of 'request-name > $.projects[*].id'                |
    |   The I verify real number '17.002' is not a member of 'request-name > $.projects[*].id'         |
    |   Then I verify text 'my-value' is not a member of 'request-name > $.projects[*].name'           |
    ----------------------------------------------------------------------------------------------------
```

Verbose Approach
----------------

This is a sample feature file to demonstrate API Testing with verbose/detailed approach. Unlike, the first approach of having all request paramaeters in a collection file and use feature file as a triggering source for making a request, this approach uses feature file as a main source of request setup, with micro-steps for each and every request arguments, right from base url setup to making a call and setting environment variables from the response json. However, it has to be noted that the authentication & verification steps would be exact ones as specified in the apitest-collection.feature. No change there.

### Common Step Definitions:

1. <strong>Set Base URL</strong>
    This step works at test case (scenario) level, and will be applied across all the requests within the same test case. This step can be used in Background or in respective scenarios as requirements demand. This step also supports fetching base url from environment variables.
    ```
    ----------------------------------------------------------------------------------------------------
    |   Given Base Url is set to 'https://httpbin.org'                                                 |
    |   Given Base Url is set to '{%MY_BASE_URL%}'                                                     |
    ----------------------------------------------------------------------------------------------------
    ```
2. <strong>Set Default Headers</strong>
    Similar to setting base url, this also works at test case level, and preferably used in a Background, where a set of default headers are to be passed to all the requests in a test case (scenario) or feature.
    ```
    ----------------------------------------------------------------------------------------------------
    |    Given Default Headers are set:                                                                |
    |        |     key             |         value          |                                          |
    |        |    accept           |    application/json    |                                          |
    |        |    allow-cookies    |    true                |                                          |
    ----------------------------------------------------------------------------------------------------
    ```
3. <strong>Set Request Endpoint</strong>
    This is set at request level, i.e. each unique request should have an endpoint set, and this works in conjunction with #1 Set Base Url. Similar to setting base url, endpoint can also be fetched from environment variable.
    ```
    ----------------------------------------------------------------------------------------------------
    |    Given Endpoint for request 'my-request' is set to 'get'                                       |
    |    Given Endpoint for request 'my-request' is set to '{%GET_ENDPOINT%}'                          |
    ----------------------------------------------------------------------------------------------------
    ```
4. <strong>Set Request Headers</strong>
    This step is used to set request specific headers within a scenario. This can be defined with or without setting default headers. When default headers are set, final headers passed to http request would be a merged dictionary of default and request headers. In case of common keys, the the value set in request header would be updated.
    ```
    ----------------------------------------------------------------------------------------------------
    |    Given Headers for request 'my-request' are set:                                               |
    |        |     key             |         value          |                                          |
    |        |    accept           |    application/json    |                                          |
    |        |    allow-cookies    |    true                |                                          |
    ----------------------------------------------------------------------------------------------------
    ```
5. <strong>Set Url Endpoint to a request</strong>
    This is set at request level. This step should be used when a particular request's complete url has to be set in a single step, or in case where a single request has to override the base url set at scenario / background level.
    ```
    ----------------------------------------------------------------------------------------------------
    |    Given Endpoint Url for request 'my-request' is set to 'https://httpbin.org/delay/4'           |
    |    Given Endpoint Url for request 'my-request' is set to '{%DELAY_ENDPOINT_URL%}'                |
    ----------------------------------------------------------------------------------------------------
    ```
6. <strong>Add Url Params to a request</strong>
    Note that this step depends on the current state of the url value, and would do a ordered modification of the url. This step has to be done only after setting base url and endpoint. As an example, if you have a test url like this: https://httpbin.org/delay/4/2. then, base url would be `https://httpbin.org` and endpoint would be `delay` and the first url parameter would be 4 and second one would be 2, should be called in order.
    ```
    ----------------------------------------------------------------------------------------------------
    |    Given An Url Parameter '4' is added to request 'my-request'                                   |
    |    Given An Url Parameter '{%MY_URL_PARAM%}' is added to request 'my-request'                    |
    ----------------------------------------------------------------------------------------------------
    ```
7. <strong>Add Query Params to a request</strong>
    This step has to be done only after setting base url and endpoint, and works at request level. And this would add the parameters in the form of key-value pair as `params` key to the request_args.
    ```
    ----------------------------------------------------------------------------------------------------
    |   Given Query Parameters are added to request 'my-request':                                      |
    |        |   key   |  value   |                                                                    |
    |        |    q    |   20     |                                                                    |
    |        |    hi   |   hello  |                                                                    |
    ----------------------------------------------------------------------------------------------------
    ```
8. <strong>Add Json Payload to a request</strong>
    This step is request specific and has to be used after setting url & endpoint. Payload can be set using an external json file placed directly/nested within framework defined payloads folder (currently it is `test_data/api/payloads`) and specifying path to file relative to framework defined folder. For example, in below example, 'test.json' is path of json  file relative to `test_data/api/payloads` directory.Also, for smaller & simpler payloads, we can use a datatable to do the same. While specifying as a table, json types should also be specified for conversion. Valid supported types are:
        `string -> str`
        `number (int) -> int`
        `number (real) -> float`
        `true -> True`
        `false -> False`
        `null -> None`
    ```
    ----------------------------------------------------------------------------------------------------
    |    Given Json Payload added to request 'my-request':                                             |
    |        |   key   |  value   |   type        |                                                    |
    |        |    q    |   20     |  number (int) |                                                    |
    |        |    hi   |   hello  |  string       |                                                    |
    |                                                                                                  |
    |    Given Json Payload is loaded from 'test.json' for request 'my-request'                        |
    ----------------------------------------------------------------------------------------------------
    ```
9. <strong>Make API Call</strong>
    This step has to be called only after setting all required parameters - base url, endpoint, headers, params and data as applicable. This step definition supports both Given and When Steps.
    ```
    ----------------------------------------------------------------------------------------------------
    |   Given 'GET' http call is made for request 'my-request'                                         |
    |   When 'POST' http call is made for request 'my-request'                                         |
    ----------------------------------------------------------------------------------------------------
    ```
10. <strong>Set Environment Variables</strong>
    This step has to be called only after sending the request out. Note that, the environment variables will be set only if the status code is < 400. This step has to be used in conjunction with verbose request mode. This step definition supports both Given and When Steps.
    ```
    ----------------------------------------------------------------------------------------------------
    |    Given Following environment variable are set from request 'my-request':                       |
    |        |   name        |   jsonpath    |                                                         |
    |        |   PROJECT_ID  |     $.id      |                                                         |
    |        |  PROJECT_NAME |    $.name     |                                                         |
    ----------------------------------------------------------------------------------------------------
    ```

Passing API Response Data for UI Testing
----------------------------------------
In our regular web application testing using Selenium, there might be numerous situations where we need to perform time taking setup activities, like registering users to check login functionality or there might be need to generate multiple test data for UI testing. Not all times, these activites can be performed using Selenium, as the setup itself would consume lot of time and there are high chances setup might fail due to flakiness. To resolve these issues, API comes handy to do the job (provided application under test provides one). This section describes how-to perform such scenarios using boilerplate framework.

Reading above sections might have made users aware of setting environment variables from the response output. We would use this capability to pass data between requests and also to UI steps. Flow would be roughly like this: `User sends API request -> Gets Response Output as Json -> Saves certain attribute values from response json as environment variables -> Use Environment Variables as input to UI Testing steps`. User can pass environment variables to pass textual inputs like url, expected_text and text to enter in form inputs, etc. 

For usage demo, please refer the sample feature file located at `codeless_project/features/api-ui-integrated.feature`