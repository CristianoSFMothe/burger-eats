*** Settings ***
Documentation        Tests API Partner
...                  Post /partners

Resource            ../resources/base.resource

*** Test Cases ***
Should Create a New Partner
    ${partner}        Factory New Partner   

    Remove Partner By Name    ${partner}[name]
    
    ${response}       POST Partner    ${partner}
    
    Status Should Be    201
    ${results}          Find Partmer By Name              ${partner}[name]
    Should Be Equal     ${response.json()}[partner_id]    ${results}[_id]


Should Return Duplicate Company name
    [Tags]            dup_name

    ${partner}        Factory Dup Name

    Remove Partner By Name    ${partner}[name]
    POST Partner    ${partner}

    ${response}       POST Partner    ${partner}
    Status Should Be    409
    Should Be Equal    ${response.json()}[message]    Duplicate company name