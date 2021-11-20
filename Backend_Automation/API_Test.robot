*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com/users
${id}   1
${expected_name}   Leanne Graham

*** Test Cases ***
Get_reuqest_test
    create session  newsession   ${base_url}
    ${response}=    get request    newsession  /${id}

    #Validations
    ${status_code}=  convert to string  ${response.status_code}
    should be equal     ${status_code}     200
    ${response_json}=   Evaluate     json.loads("""${response.content}""")    json
    ${name}=   get from dictionary  ${response_json}    name
    should contain  ${name}     ${expected_name}
    ${contentTypeValue}=    get from dictionary     ${response.headers}     Content-Type
    should contain  ${contentTypeValue}     application/json

POST_reuqest_test
    create session  newsession   ${base_url}
    ${body}=    create dictionary   id=1    name=Apeksha Hemanth    username=Ah     email=Sincere@april.biz
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=    post request    newsession  ${base_url}  data=${body}    headers=${header}

    #Validations
    ${response_body}=   convert to string   ${response.content}
    ${status_code}=   convert to string   ${response.status_code}
    should be equal     ${status_code}  201
    should contain     ${response_body}    Apeksha Hemanth

PUT_reuqest_test
    create session  newsession   ${base_url}
    ${body}=    create dictionary   name=Apeksha Hemanth    username=Ah     email=Sincere@april.biz
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=    put request    newsession  /${id}  data=${body}    headers=${header}

    #Validations
    ${response_body}=   convert to string   ${response.content}
    ${status_code}=   convert to string   ${response.status_code}
    should be equal     ${status_code}  200
    should contain     ${response_body}    Apeksha Hemanth

DELETE_reuqest_test
    create session  newsession   ${base_url}
    ${response}=    delete request    newsession  /${id}

    #Validations
    ${status_code}=   convert to string   ${response.status_code}
    should be equal     ${status_code}  200


