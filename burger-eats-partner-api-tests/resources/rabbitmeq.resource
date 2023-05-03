*** Settings ***
Documentation        RebbitMQ Helpers API

Library              RequestsLibrary

*** Variables ***
${RABBIT_URL}        https://jackal.rmq.cloudamqp.com/api/queues/kgfljmqr/email
&{RABBIT_HEADERS}    Content-Type=application/json    
...                  Authorization=Basic a2dmbGptcXI6NGhTYkZoQlhVM2pQUGRqNTdJQVhQLWZVWWt0WHRmV0I=


*** Keywords ***
Purge All Messages

    ${payload}       Create Dictionary
    ...              vhost=kgfljmqr
    ...              name=email
    ...              mode=purge    
    
    ${response}      DELETE             ${RABBIT_URL}/contents    
    ...              json=${payload}    headers=${RABBIT_HEADERS} 

    Status Should Be    204   
       
    
    [Return]        ${response}


Get Message

    ${payload}     Create Dictionary
    ...            vhost=kgfljmqr
    ...            name=email
    ...            truncate=50000
    ...            ackmode=ack_requeue_true
    ...            encoding=auto
    ...            count=1
    
    ${response}      POST               ${RABBIT_URL}/get    
    ...              json=${payload}    headers=${RABBIT_HEADERS}
    
    [Return]         ${response.json()}[0]
    
    

    