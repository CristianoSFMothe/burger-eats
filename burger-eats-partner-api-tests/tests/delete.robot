*** Settings ***
Documentation        Tests API Partner
...                  DELETE /partners

Resource            ../resources/base.resource

*** Test Cases ***
Should Remove a Partner
    [Documentation]        Remoção de um parceiro pelo o id
    [Tags]                 remove
    
    ${partner}        Factory Remove Partner
    ${partner_id}     Create a New Partner    ${partner}

    Delete Partner      ${partner_id}
    Status Should Be    204

Should Return 404 On Remove a Partner
    [Documentation]        Não encontrar o parceiro pelo o id para remover
    [Tags]                 not_found
    
    ${partner}        Factory 404 Partner
    ${partner_id}     Create a New Partner    ${partner}

    Remove Partner By Name    ${partner}[name]

    Delete Partner      ${partner_id}
    Status Should Be    404
    