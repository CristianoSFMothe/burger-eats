*** Settings ***
Documentation        Tests API Partner
...                  GET /partners

Resource            ../resources/base.resource

Suite Setup        Create Partner List

*** Test Cases ***
Should Return a Partner List 
    [Documentation]    Retornar a lista dos parceiros cadastrados
    [Tags]             get_list   

    ${response}         GET Partners
    Status Should Be    200

    ${size}            Get Length    ${response.json()}

    Should Be True    ${size} > 0


Should Search Partner By Name
    [Documentation]      Retornar um parceiro especifico pelo nome
    [Tags]               get_by_name

    ${response}          Search Partner    São Francisco
    Status Should Be     200 

    ${size}            Get Length    ${response.json()}

    Should Be True    ${size} == 1   
    
    Should Be Equal    ${response.json()}[0][name]    Mercadinho São Francisco


#  Gancho para os testes acima
*** Keywords ***
Create Partner List
    ${partners}          Factory Partner List

    FOR    ${p}    IN    @{partners}
        Remove Partner By Name    ${p}[name]
        POST Partner    ${p}
    END
