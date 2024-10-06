*** Settings ***

Library  SeleniumLibrary

Resource  ../../resources/main.resource

Test Teardown    Finalizar teste

*** Test Cases ***

Comprar 3 produtos
    Given que o usuário acesse o site Demo Blaze
    When o usuário adicionar 3 produtos ao carrinho
    And o usuário finalizar a compra
    Then a compra é realizada com sucesso

Atualizar produtos do carrinho
    Given que o usuário acesse o site Demo Blaze
    When o usuário adicionar 3 produtos diversos ao carrinho
    And o usuário remover um produto do carrinho
    Then o carrinho é atualizado