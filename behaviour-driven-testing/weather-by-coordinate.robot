*** Settings ***
Resource    ../common-library.robot

*** Variables ***
${lat}             21.0245
${long}            105.8412
${query_path}      /data/${api_version}/${module}

*** Keywords ***
Get the current weather with specific latitude and longitude
    [Documentation]    Call an api request with GET method to get the current weather by latitude and longitude
    [Arguments]     ${app_id}     ${lat}     ${long}
    ${request_body}     Create dictionary     appId=${app_id}     lat=${lat}     lon=${long}
    GET    ${query_path}      query=${request_body}

Get the current weather with global language
    [Documentation]    Call an api request with lang support
    [Arguments]     ${app_id}     ${lat}     ${long}      ${lang}
    ${request_body}     Create dictionary     appId=${app_id}     lat=${lat}     lon=${long}      lang=${lang}
    GET    ${query_path}      query=${request_body}

Verify status code should be "${expected_status_code}"
    [Documentation]    Asserts the api response status code
    Integer     response status     ${expected_status_code}

Response should be matched with the expected schema
    [Documentation]    Verify the response body with expected schema
    Expect Response     ${CURDIR}/json-schema.json    merge=false

Verify response body should have a specific properties with integer value
    [Documentation]    Verify the properties of the response body
    [Arguments]    ${json_path}     ${expected_value}
    Integer     ${json_path}      Hanoi

*** Test Cases ***
Weather API should response with success status code
    [Documentation]    This testcase is to make sure that the api is return successful with status code 200
    [Setup]    Response should be matched with the expected schema
    Get the current weather with specific latitude and longitude     app_id=${app_id}    lat=${lat}    long=${long}
    Verify status code should be "200"

Weather API should response with correct city name, lat long and country code
    [Documentation]    Advanced assertions testcases
    #Nested object assertions
    #Verify property 'country' should be value 'VN'
    String      $.sys.country   VN

    #Verify property 'lon' should be value '105.8412'
    Number      $.coord.lon     105.8412
    #Verify property 'lat' should be value '21.0245'
    Number      $.coord.lat     21.0245
    #Verify the response city name
    String      $.name     Hanoi


Weather API should response with multi languague support
    [Documentation]    Optional query parameters which is 'lang'
    Get the current weather with global language     app_id=${app_id}     lat=${lat}    long=${long}     lang=vi
    String     $.name     Hà Nội
