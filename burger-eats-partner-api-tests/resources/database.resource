*** Settings ***
Documentation        Database helpers connections

Library              RobotMongoDBLibrary.Find
Library              RobotMongoDBLibrary.Delete

*** Variables ***
&{MONGO_URI}           connection=mongodb+srv://burgereats:dzOqrJwHFDH1dArr@cluster0.gasypkv.mongodb.net/PartnerDB?retryWrites=true&w=majority
...                    database=PartnerDB     collection=partner


*** Keywords ***
Remove Partner By Name
    [Arguments]        ${partner_name}

    ${filter}         Create Dictionary
    ...               name=${partner_name}
    
    Delete One        ${MONGO_URI}   ${filter}

Find Partmer By Name
    [Arguments]        ${partner_name}

    ${filter}         Create Dictionary
    ...               name=${partner_name}

    ${results}    Find    ${MONGO_URI}    ${filter}

    [Return]      ${results}[0]