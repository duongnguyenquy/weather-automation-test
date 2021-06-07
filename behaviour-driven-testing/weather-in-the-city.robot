*** Settings ***
Resource    ../common-library.robot


*** Variables ***
${city_name}       Hanoi
${query_path}      /data/${api_version}/${module}

*** Keywords ***
Get the current weather with specific city name
    [Documentation]    Call an api request with GET method to get the current weather by city name
    [Arguments]     ${app_id}     ${city_name}
    ${request_body}     Create dictionary     appId=${app_id}     q=${city_name}
    GET    ${query_path}      query=${request_body}

Get the current weather with global language
    [Documentation]    Call an api request with lang support
    [Arguments]     ${app_id}     ${city_name}      ${lang}
    ${request_body}     Create dictionary     appId=${app_id}     q=${city_name}      lang=${lang}
    GET    ${query_path}      query=${request_body}

Verify status code should be "${expected_status_code}"
    [Documentation]    Asserts the api response status code
    Integer     response status     ${expected_status_code}

Response should be matched with the expected schema
    [Documentation]    Verify the response body with expected schema
    Expect Response     ${CURDIR}/json-schema.json    merge=false

Verify response body should have a specific properties with integer value
    [Documentation]    This keyword verify the properties of the response body
    [Arguments]    ${json_path}     ${expected_value}
    Integer     ${json_path}      Hanoi

*** Test Cases ***
Weather API should response with success status code
    [Documentation]    This testcase is to make sure that the api is return successful with status code 200
               ...     and the respone body is matching the schema
    [Setup]    Response should be matched with the expected schema
    Get the current weather with specific city name     app_id=${app_id}    city_name=${city_name}
    Verify status code should be "200"

Weather API should response with correct city name
    [Documentation]    Advanced assertions testcases
    #Verify the response city name
    String      $.name     Hanoi

Weather API should response with multi languague support
    [Documentation]    Optional query parameters which is 'lang'
    Get the current weather with global language     app_id=${app_id}     city_name=${city_name}     lang=vi
    String     $.name     Hà Nội