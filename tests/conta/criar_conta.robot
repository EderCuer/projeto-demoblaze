*** Settings ***

Library  SeleniumLibrary

Resource  ../../resources/main.resource

Test Setup       Iniciar teste    ${URL}
Test Teardown    Finalizar teste

*** Test Cases ***

Criar conta
    Given que o usuário tenha clicado para criar uma conta
    When o usuário fizer o cadastro
    Then o usuário é cadastrado com sucesso