
language: ptbr
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
#Variaveis de configuração
${URL}        https://kroton.platosedu.io/erp/login/auth 
#${BROWSER}    headlesschrome
${BROWSER}    chrome

#Variaveis do login
${LOGIN.NOME_INPUT}          id=usuario
${LOGIN.SENHA_INPUT}         id=password
${LOGIN.ENTRAR_BUTTON}             //button[@type='submit']             

#Variaveis de preencimento login
${NOME_INPUT}                 tamires.medeiros
${SENHA_INPUT}                123456

#Variaveis do extrato
${EXTRATO.ICON_BUTTON}                              //div[@id='nav-icon'] 
${EXTRATO.FINANCEIRO_ENTRAR_LINK}                  //a[contains(@class,'main-nav-link main-nav-section section-financeiro')]
${EXTRATO.MATRICULA_ENTRAR_LINK}                  //a[@href='#'][contains(.,'Matrícula')] 
#${EXTRATO.EXTRATO_ENTRAR_LINK}                  //a[contains(.,'Extrato do Aluno')] 
#${EXTRATO.ENTRAR_BUTTON}                       //a[@class='btn btn-primary col-md-12']

#Variavel da prova de pagina
#${PROVA}                   //h1[@class='page-title']              

*** Palavras-Chave ***
Iniciação do teste
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Go To    ${URL}
    
E preencho dados do login
    Input Text       ${LOGIN.NOME_INPUT}        ${NOME_INPUT} 
    Input Text       ${LOGIN.SENHA_INPUT}       ${SENHA_INPUT}            
    Click Element    ${LOGIN.ENTRAR_BUTTON}   

E que clico nos botões até chegar no extrato do aluno 
    Wait Until Element Is Visible   ${EXTRATO.ICON_BUTTON}     
    Click Element         ${EXTRATO.ICON_BUTTON}  
    Click Element         ${EXTRATO.FINANCEIRO_ENTRAR_LINK}  
    Click Element         ${EXTRATO.MATRICULA_ENTRAR_LINK} 
    #Click Element         ${EXTRATO.EXTRATO_ENTRAR_LINK} 

#Então veririfico a pagina
#    Element Should Be Visible        ${PROVA} 

Finalização do Teste
    Close Browser           

*** Casos De Teste ***
   
Cenario 01: Fazer login Cosmos e acessar extrato do aluno
    [Tags]    regressivo
    [Inicialização]        Iniciação do Teste
    E preencho dados do login
    E que clico nos botões até chegar no extrato do aluno
    #Então veririfico a pagina
    [Finalização]           Finalização do Teste
    






