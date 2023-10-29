Language: ptbr
*** Configurações ***
Biblioteca     SeleniumLibrary
Biblioteca     Process

Recurso    ../commom/constants.robot
Recurso    ../pages/home_page.robot

*** Palavras-Chave ***
Devo ser logado no sistema
    Wait Until Keyword Succeeds    ${CONST.MAX_TIMEOUT}    ${CONST.RETRY_TIME}    
    ...    Element Should Be Visible    ${HOME.TEXT_CARD}