*** Settings ***
Documentation        Tests API Partner
...                  GET /partners

Resource            ../resources/base.resource

*** Test Cases ***
Should Return a Partner List
    
    ${partners}          Factory Partner List

    FOR    ${p}    IN    @{partners}
        Remove Partner By Name    ${p}[name]
        POST Partner    ${p}
    END

    ${response}          POST Partners
    Status Should Be    200

    ${size}            Get Length    ${response.json()}

    Should Be True    ${size} > 0