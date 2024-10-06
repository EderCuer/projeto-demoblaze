*** Settings ***

Resource    ../main.resource

*** Variables ***

${link_products}      xpath=//h4[@class='card-title']
${carrinho}           css=tr.success
${btn_place_order}    css=.btn-success
${order_modal}        id=orderModal
${input_name}         id=name
${input_country}      id=country
${input_city}         id=city
${input_card}         id=card
${input_month}        id=month
${input_year}         id=year
${confirmacao}        css=.sweet-alert

*** Keywords ***

que o usuário acesse o site Demo Blaze
    Iniciar teste    ${URL}    

o usuário adicionar 3 produtos ao carrinho

    FOR  ${index}  IN RANGE    3
        Wait Until Element Is Visible    xpath=(//h4[@class='card-title']/a)[${index+1}]
        Click Element                    xpath=(//h4[@class='card-title']/a)[${index+1}]
        Wait Until Element Is Visible    ${add_to_cart}
        Click Element                    ${add_to_cart}

        Handle Alert    action=ACCEPT

        Click Link                       Home
        Wait Until Element Is Visible    ${link_products}
    END
    

o usuário finalizar a compra
    Click Link      Cart
    Click Button    Place Order

    Wait Until Element Is Visible    ${order_modal}

    ${name}       Generate Fake Name
    ${country}    Generate Fake Country
    ${city}       Generate Fake City

    Input Text      ${input_name}       ${name}
    Input Text      ${input_country}    ${country}
    Input Text      ${input_city}       ${city}
    Input Text      ${input_card}       1234567
    Input Text      ${input_month}      Outubro
    Input Text      ${input_year}       2024
    Click Button    Purchase

a compra é realizada com sucesso
    Wait Until Element Is Visible    ${confirmacao}
    Page Should Contain              Thank you for your purchase!

o usuário adicionar 3 produtos diversos ao carrinho
    Click Link                    Phones
    Colocar produto no carrinho    Samsung galaxy s6
    
    Click Link                     Laptops
    Colocar produto no carrinho    Sony vaio i5

    Click Link                    Monitors
    Colocar produto no carrinho    ASUS Full HD


o usuário remover um produto do carrinho
    Click Link    Cart

    Wait Until Element Is Visible    ${carrinho}

    ${products_cart}      Get WebElements    ${carrinho}
    ${quantidade}         Get Length         ${products_cart}
    Set Suite Variable    ${quantidade}

   Remove produto do carrinho    ASUS Full HD
    

o carrinho é atualizado
    Wait Until Element Is Visible    ${carrinho}

    ${products_cart}      Get WebElements    ${carrinho}
    ${nova_quantidade}    Get Length         ${products_cart}

    Should Be True             ${nova_quantidade} < ${quantidade}
    Page Should Not Contain    ASUS Full HD
    