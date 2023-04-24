*** Settings ***
Documentation        Tests API Partner
...                  PUT /partners

Resource            ../resources/base.resource


*** Test Cases ***
Should Enable a Partner
    [Documentation]       Habilita um parceiro
    [Tags]                enable

    ${partner}          Factory Enable Partner

    ${partner_id}      Create a New Partner    ${partner}

    ${response}         Enable Partner    ${partner_id}
    Status Should Be    200


Should Return 404 On Enable a Partner
    [Documentation]    Retornar erro caso não encontre o parceiro pelo ID
    [Tags]             404
    
    ${partner}        Factory 404 Partner

    ${partner_id}      Create a New Partner    ${partner}
    
    Remove Partner By Name             ${partner}[name]    

    ${response}         Enable Partner    ${partner_id}
    Status Should Be    404    


    