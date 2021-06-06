*** Settings ***
Library           DataDriver     dialect=excel
Resource          ../common-library.robot

Test Template     Call api request to get current weather information

*** Variables ***
${api_version}     2.5
${module}          weather
${query_path}      /data/${api_version}/${module}

*** Test Cases ***
Get current weather testcases     ${app_id}     ${city_code}    ${expected_http_status}     ${expected_cod}    ${expected_message}

*** Keywords ***
Call api request to get current weather information
    [Arguments]     ${app_id}     ${city_code}     ${expected_http_status}     ${expected_cod}     ${expected_message}
    ${request_body}     Create dictionary     q=${city_code}     appId=${app_id}
    GET    ${query_path}      query=${request_body}
    Verify response status code     ${expected_http_status}
    ${status}     Run keyword and return status     Verify response cod integer    ${expected_cod}
    Run keyword if     ${status}==${False}     Verify response cod string     ${expected_cod}
    Verify response message         ${expected_message}

Verify response status code
    [Arguments]    ${expected_http_status_code}
    Integer     response status     ${expected_http_status_code}

Verify response cod integer
    [Arguments]    ${expected_cod}
    Integer     $.cod     ${expected_cod}

Verify response cod string
    [Arguments]    ${expected_cod}
    String     $.cod     ${expected_cod}

Verify response message
    [Arguments]    ${expected_message}
    String     $.message     ${expected_message}