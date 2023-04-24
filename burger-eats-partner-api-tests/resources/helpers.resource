*** Settings ***
Documentation        Helpers

Resource            ../resources/base.resource

*** Keywords ***
Create a New Partner
    [Arguments]        ${partner}

    Remove Partner By Name     ${partner}[name]    
    ${response}                POST Partner   ${partner}

    ${partner_id}       Set Variable    ${response.json()}[partner_id]

    [Return]        ${partner_id}
