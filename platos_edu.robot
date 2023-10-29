*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}     Edge
${URL}         https://kroton.platosedu.io/erp/login/auth
${USERNAME}    tamires.medeiros
${PASSWORD}    123456

*** Test Cases ***
Login Test
    Open Browser      ${URL}         ${BROWSER}
    Input Text        id=usuario     ${USERNAME}
    Input Password    id=password    ${PASSWORD}
    Click Button      xpath=//button[text()='Entrar']
    Element Should Be Visible    //h1[@class='display-5']    

    # Você pode adicionar mais passos aqui para verificar se o login foi bem-sucedido

    Close Browser

