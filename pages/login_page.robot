Language: ptbr

*** Configurações ***
Biblioteca     SeleniumLibrary
#Biblioteca     Process

Recurso    ../commom/constants.robot

*** Variáveis ***
${LOGIN.USER_INPUT}        //input[contains(@type,'text')]
${LOGIN.SENHA_INPUT}       //input[contains(@type,'password')]
${LOGIN.ENTRAR_BUTTON}     //button[contains(@type,'submit')]
${EXTRATO.ENTRAR_ICON}     //div[@id='nav-icon']
${USUARIO_INPUT}           tamires.medeiros
${SENHA_INPUT}             123456
${MENU_NAVBAR.CLICK_BUTTON}        //*[@id="nav-icon"]
${MENU_COMERCIAL.CLICK_BUTTON}    //a[contains(@class,'main-nav-link main-nav-section section-comercial')]  

*** Palavras-Chave ***
Escrever no campo Usuario
    [Argumentos]    ${USUARIO}
    Wait Until Keyword Succeeds    ${CONST.MAX_TIMEOUT}    ${CONST.RETRY_TIME}
    ...    Element Should Be Visible    ${LOGIN.USER_INPUT}
    Input Text     ${LOGIN.USER_INPUT}   ${USUARIO}

Escrever no campo senha
    [Argumentos]    ${SENHA}
    Wait Until Keyword Succeeds    ${CONST.MAX_TIMEOUT}    ${CONST.RETRY_TIME}    
    ...    Element Should Be Visible    ${LOGIN.SENHA_INPUT}
    Input Password    ${LOGIN.SENHA_INPUT}    ${SENHA}

Clicar no botão entrar
    Wait Until Keyword Succeeds    ${CONST.MAX_TIMEOUT}    ${CONST.RETRY_TIME}    
    ...    Element Should Be Visible    ${LOGIN.ENTRAR_BUTTON}
    Click Element    ${LOGIN.ENTRAR_BUTTON}

#Cenario 02:
Clicar no menu navbar 
    Wait Until Element Is Visible    ${MENU_NAVBAR.CLICK_BUTTON}
    Click Element                    ${MENU_NAVBAR.CLICK_BUTTON}
    

Clicar no botão comercial
    Wait Until Element Is Visible    ${MENU_COMERCIAL.CLICK_BUTTON} 
    Click Element                    ${MENU_COMERCIAL.CLICK_BUTTON} 



 

