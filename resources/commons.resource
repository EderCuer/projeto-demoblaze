*** Settings ***

Resource    ./main.resource

*** Keywords ***

Colocar produto no carrinho
    [Arguments]    ${PRODUCT}

    Wait Until Page Contains         ${PRODUCT}
    Click Link                       ${PRODUCT}
    Wait Until Element Is Visible    ${add_to_cart}
    Click Element                    ${add_to_cart}

    Handle Alert    action=ACCEPT

    Click Link                       Home
    Wait Until Element Is Visible    ${link_products}

Remove produto do carrinho
    [Arguments]    ${PRODUCT}

    Click Element  xpath=//tr[td[text()='${PRODUCT}']]//a[text()='Delete']
    Wait Until Page Does Not Contain    ${PRODUCT}