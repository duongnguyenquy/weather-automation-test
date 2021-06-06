*** Settings ***
Library           DataDriver     dialect=excel
Resource          ../common-library.robot

Test Template     Call api request to get current weather information by latitude and longitude

*** Variables ***
${api_version}     2.5
${module}          weather
${query_path}      /data/${api_version}/${module}

*** Test Cases ***
Get current weather with lat and long testcases     ${app_id}     ${lat}     ${long}    ${expected_http_status}     ${expected_cod}    ${expected_message}

*** Keywords ***
Call api request to get current weather information by latitude and longitude
    [Arguments]     ${app_id}     ${lat}     ${long}     ${expected_http_status}     ${expected_cod}     ${expected_message}
    ${request_body}     Create dictionary     appId=${app_id}     lat=${lat}     lon=${long}
    GET    ${query_path}      query=${request_body}
    Verify response status code     ${expected_http_status}
    Verify response cod             ${expected_cod}
    Verify response message         ${expected_message}

Verify response status code
    [Arguments]    ${expected_http_status_code}
    Integer     response status     ${expected_http_status_code}

Verify response cod
    [Arguments]    ${expected_cod}
    String     $.cod     ${expected_cod}

Verify response message
    [Arguments]    ${expected_message}
    String     $.message     ${expected_message}
