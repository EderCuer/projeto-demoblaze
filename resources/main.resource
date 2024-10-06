*** Settings ***

Library    SeleniumLibrary
Library    ../libraries/FakerLibrary.py
Library    ../libraries/BrowserLibrary.py

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

    ${driver}    Open Chrome Browser
    Go To        ${URL}
    Maximize Browser Window

Finalizar teste
    Close Browser