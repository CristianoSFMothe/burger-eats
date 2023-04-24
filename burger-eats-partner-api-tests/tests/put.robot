*** Settings ***
Documentation        Tests API Partner
...                  PUT /partners

Resource            ../resources/base.resource


*** Test Cases ***
Should Enable a Partner

    ${partner}          Factory Enable Partner

    Remove Partner By Name     ${partner}[name]    
    ${response}                POST Partner   ${partner}

    ${partner_id}       Set Variable    ${response.json()}[partner_id]

    ${response}         Enable Partner    ${partner_id}
    Status Should Be    200


Should Return 404 On Enable a Partner
    
    ${partner}        Factory 404 Partner

    Remove Partner By Name      ${partner}[name]    
    ${response}                 POST Partner   ${partner}

    ${partner_id}       Set Variable    ${response.json()}[partner_id]
    
    Remove Partner By Name             ${partner}[name]    

    ${response}         Enable Partner    ${partner_id}
    Status Should Be    404    


    