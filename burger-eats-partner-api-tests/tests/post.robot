*** Settings ***
Documentation        Tests API Partner
...                  Post /partners

Resource            ../resources/base.resource

*** Test Cases ***
Should Create a New Partner
    [Documentation]    Criar um novo parceiro
    [Tags]             post

    Purge All Messages
    
    ${partner}        Factory New Partner   

    Remove Partner By Name    ${partner}[name]
    
    ${response}       POST Partner    ${partner}
    
    Status Should Be    201
    ${results}          Find Partmer By Name              ${partner}[name]
    Should Be Equal     ${response.json()}[partner_id]    ${results}[_id]

    ${message}      Get Message
    Log             ${message}[payload]

    Should Contain    ${message}[payload]    ${partner}[email]



Should Return Duplicate Company name
    [Documentation]   Verifica a duplicadade no nome
    [Tags]            dup_name

    ${partner}        Factory Dup Name

    Create a New Partner    ${partner}

    ${response}         POST Partner    ${partner}
    Status Should Be    409
    Should Be Equal     ${response.json()}[message]    Duplicate company name