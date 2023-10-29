language: ptbr

*** Settings ***
Library  SeleniumLibrary

*** Variables ***

#Variaveis de configuração
${URL}        https://kroton.stage.platosedu.io/v2/lms/login
#${BROWSER}    headlesschrome
${BROWSER}    chrome

#Variaveis do login
${LOGIN.USUARIO_INPUT}          id:username
${LOGIN.SENHA_INPUT}            id:password
${LOGIN.ENTRAR_BUTTON}          //button[@type='submit']            


#Variaveis de preencimento login
${USUARIO}             tamires.medeiros
${SENHA}               123456
     
#Variaveis do Ava

${HOME_EDITAR_PERFIL.BUTTON}                      //a[@class='btn btn-outline-secondary btn-sm']
${APELIDO.TEXT_INPUT}              id=apelido
${CLICK_BUTTON}                   //button[@type='submit']
${PROVA_ALTERAÇÃO.CLASS}         //div[contains(@class,'message message-success')]


#Variaveis da pagina Meu perfil ***OBSERVAÇÃO TEM QUE FICAR TROCANDO O APELIDO PARA APARECER A MSG DE SUCESSO!!!!
${TEXTO.TEXT_INPUT}        TAMI-46

#Variavel da prova de pagina
${PROVA.PAGINA_LOGIN}                   //h1[@class='page-title']           
   

*** Keywords ***
Dado que acesso a pagina do Cosmos 
    Open Browser     ${URL}      ${BROWSER}

E preencho senha e login  
    Input Text    ${LOGIN.USUARIO_INPUT}      ${USUARIO} 
    Input Text    ${LOGIN.SENHA_INPUT}        ${SENHA} 

Quando clico no botao entrar
    Click Element    ${LOGIN.ENTRAR_BUTTON} 
    Sleep    5

# Entao verifico se estou na pagina correta
#     Wait Until Element Is Visible     ${PROVA_INICIAL}     
#     Element Should Be Visible         ${PROVA_INICIAL}
    

*** Keywords *** 
#02 Palavras-chaves extrato
Dado que clico no botão editar perfil 
    Wait Until Element Is Visible    ${HOME_EDITAR_PERFIL.BUTTON}  
    Click Element                    ${HOME_EDITAR_PERFIL.BUTTON}   
     Sleep  5

E clico na caixa box apelido e digito o apelido
    #Click Element        ${CLICK_CHECKBOX}
    Input Text     ${APELIDO.TEXT_INPUT}     ${TEXTO.TEXT_INPUT}        
    Sleep     5 

Quando clico no botão enviar
    Click Element         ${CLICK_BUTTON} 

Então veririfico se as alterações foram sucedidas
    Wait Until Element Is Visible    ${PROVA_ALTERAÇÃO.CLASS}
    Element Should Be Visible        ${PROVA_ALTERAÇÃO.CLASS}        
    Sleep    5    
           
*** Test Cases ***
Cenario 01: Fazer login Cosmos
    [Tags]    regressivo
    Dado que acesso a pagina do Cosmos 
    E preencho senha e login 
    Quando clico no botao entrar 
    #Entao verifico se estou na pagina correta  

Cenario 02: Visualizar extrato do aluno
    [Tags]    extrato do aluno
    Dado que clico no botão editar perfil  
    E clico na caixa box apelido e digito o apelido
    Quando clico no botão enviar
    Então veririfico se as alterações foram sucedidas





