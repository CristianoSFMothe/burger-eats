*** Settings ***
Documentation        Tests API Partner
...                  Post /partners

Library              RequestsLibrary


*** Variables ***
${BASE_URL}            http://localhost:3333/partners

*** Test Cases ***
Should Create a New Partner
    ${payload}        Create Dictionary
    ...               name=Pizzas Mother
    ...               email=contato@mothe.com
    ...               whatsapp=21988775566
    ...               business=Restaurante
    
    ${headers}        Create Dictionary
    ...               Content-Type=application/json
    ...               auth_user=qa
    ...               auth_password=ninja
    
    ${response}       POST              ${BASE_URL}    
    ...               json=${payload}    
    ...               headers=${headers}
    
    Status Should Be    201