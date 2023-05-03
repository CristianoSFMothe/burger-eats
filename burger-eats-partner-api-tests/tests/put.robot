*** Settings ***
Documentation        Tests API Partner
...                  PUT /partners

Resource            ../resources/base.resource


*** Test Cases ***
Should Enable a Partner
    [Documentation]       Habilita um parceiro
    [Tags]                enable

    ${partner}         Factory Enable Partner

    ${partner_id}      Create a New Partner    ${partner}

    ${response}        Enable Partner    ${partner_id}
    Status Should Be   200

Should Dissable a Partner
    [Documentation]       Desabilata um parceiro
    [Tags]                enable

    ${partner}         Factory Disable Partner

    ${partner_id}      Create a New Partner    ${partner}
    Enable Partner     ${partner_id}

    ${response}        Enable Partner    ${partner_id}
    Status Should Be   200


Should Return 404 On Enable a Partner
    [Documentation]    Retornar erro caso não encontre o parceiro pelo ID
    [Tags]             404_enable
    
    ${partner}        Factory 404 Partner

    ${partner_id}      Create a New Partner    ${partner}
    
    Remove Partner By Name             ${partner}[name]    

    ${response}         Enable Partner    ${partner_id}
    Status Should Be    404    

Should Return 404 On Disable a Partner
    [Documentation]    Retornar erro caso não encontre o parceiro pelo ID
    [Tags]             404_disable
    
    ${partner}        Factory 404 Partner

    ${partner_id}      Create a New Partner    ${partner}
    
    Remove Partner By Name             ${partner}[name]    

    ${response}         Disable Partner    ${partner_id}
    Status Should Be    404    


    