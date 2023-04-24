*** Settings ***
Documentation        Tests API Partner
...                  Post /partners

Resource            ../resources/base.resource


*** Test Cases ***
Should Create a New Partner
    ${partner}        Factory New Partner   

    Remove Partner By Name    Pizzas Mothe
    
    ${response}       POST Partner    ${partner}
    
    Status Should Be    201
    ${results}          Find Partmer By Name              Pizzas Mothe
    Should Be Equal     ${response.json()}[partner_id]    ${results}[_id]