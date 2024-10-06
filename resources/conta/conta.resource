*** Settings ***

Resource    ../main.resource

*** Variables ***

${usuario}        id=sign-username
${senha}          id=sign-password
${modal}          id=signInModal

*** Keywords ***

que o usuário tenha clicado para criar uma conta
    Click Element                    ${signin}
    Wait Until Element Is Visible    ${modal}

o usuário fizer o cadastro
    ${user_name}     Generate Fake Name

    Input Text       ${usuario}        ${user_name}
    Input Text       ${senha}          1234
    Click Button     Sign up

    Set Suite Variable    ${user_name}

o usuário é cadastrado com sucesso
    ${alert_text}      Handle Alert    
    Should Be Equal    ${alert_text}    Sign up successful.

  