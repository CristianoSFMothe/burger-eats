*** Settings ***
Documentation        Tests API Partner
...                  Post /partners

Resource            ../resources/base.resource

*** Test Cases ***
Should Create a New Partner
    ${payload}        Create Dictionary
    ...               name=Pizzas Mothe
    ...               email=contato@mothe.com
    ...               whatsapp=21988775566
    ...               business=Restaurante    
    Remove Partner By Name    Pizzas Mothe    
    
    ${response}       POST Partner    ${payload}
    
    Status Should Be    201
    ${results}          Find Partmer By Name              Pizzas Mothe
    Should Be Equal     ${response.json()}[partner_id]    ${results}[_id]