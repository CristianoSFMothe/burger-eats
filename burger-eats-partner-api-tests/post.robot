*** Settings ***
Documentation        Tests API Partner
...                  Post /partners

Library              RequestsLibrary
Library              RobotMongoDBLibrary.Find
Library              RobotMongoDBLibrary.Delete


*** Variables ***
${BASE_URL}            http://localhost:3333/partners
&{MONGO_URI}           connection=mongodb+srv://burgereats:dzOqrJwHFDH1dArr@cluster0.gasypkv.mongodb.net/PartnerDB?retryWrites=true&w=majority
...                    database=PartnerDB     collection=partner


*** Test Cases ***
Should Create a New Partner
    ${payload}        Create Dictionary
    ...               name=Pizzas Mothe
    ...               email=contato@mothe.com
    ...               whatsapp=21988775566
    ...               business=Restaurante
    
    ${headers}        Create Dictionary
    ...               Content-Type=application/json
    ...               auth_user=qa
    ...               auth_password=ninja
    
    ${filter}         Create Dictionary
    ...               name=Pizzas Mothe

    Delete One        ${MONGO_URI}   ${filter} 
    
    ${response}       POST              ${BASE_URL}    
    ...               json=${payload}    
    ...               headers=${headers}
    
    Status Should Be    201

    ${results}    Find    ${MONGO_URI}    ${filter}

    Should Be Equal    ${response.json()}[partner_id]    ${results}[0][_id]