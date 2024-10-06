*** Settings ***

Library    SeleniumLibrary
Library    ../libraries/FakerLibrary.py

Resource    ../resources/conta/conta.resource
Resource    ../resources/carrinho/carrinho.resource
Resource    ../resources/produto/produto.resource
Resource    ../resources/menu/nav.resource
Resource    ../resources/commons.resource

*** Variables ***

${URL}  https://www.demoblaze.com/

*** Keywords ***

Iniciar teste
    [Arguments]    ${URL}

    Open Browser  ${URL}  chrome
    Maximize Browser Window

Finalizar teste
    Close Browser