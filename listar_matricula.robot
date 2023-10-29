language: ptbr

*** Settings ***
Library          SeleniumLibrary
 

*** Variables ***

#Variaveis de configuração
${URL}         https://kroton.stage.platosedu.io/erp/login/auth 
#${BROWSER}    headlesschrome
${BROWSER}     chrome

#Variaveis do login
${LOGIN.USER_INPUT}             //input[@type='text']
${LOGIN.SENHA_INPUT}            //input[@type='password']
${LOGIN.ENTRAR_BUTTON}          //button[@type='submit']            

#Variaveis de preencimento login
${USUARIO_INPUT}             tamires.medeiros
${SENHA_INPUT}               123456

     
#Variaveis do NavBar
${NAV.CLICK_BUTTON}                id:nav-icon
${COMERCIAL.CLICK_BUTTON}          //a[contains(@class,'main-nav-link main-nav-section section-comercial')] 
${OFERTA.CLICK_BUTTON}             //a[@href='/erp/oferta/index'][contains(.,'Oferta')]
${CRIAR_OFERTA.CLICK_BUTTON}       //a[contains(@title,'Criar')]
${LISTAR_OFERTA.TEXT_INPUT}        //input[contains(@class,'filter-search js-filter-input')]
${LISTAR_OFERTA.CLICK_CAMPO}       //div[@class='name'][contains(.,'Código da oferta')]
           
                    

*** Keywords ***
Dado que acesso a pagina do Cosmos 
    Open Browser     ${URL}      ${BROWSER}

Quando preencho senha e login   
    Input Text    ${LOGIN.USER_INPUT}        ${USUARIO_INPUT} 
    Input Text    ${LOGIN.SENHA_INPUT}       ${SENHA_INPUT} 

Então clico no botao entrar
    Click Element    ${LOGIN.ENTRAR_BUTTON} 
    Sleep    5


*** Keywords *** 
#02 Palavras-chaves NAV-BAR
Dado que clico no botão nav-bar
    Wait Until Element Is Visible    ${NAV.CLICK_BUTTON}     
    Click Element                    ${NAV.CLICK_BUTTON} 
     
E clico no link comercial
    Wait Until Element Is Visible    ${COMERCIAL.CLICK_BUTTON}    
    Click Element                    ${COMERCIAL.CLICK_BUTTON} 

E clico no link oferta
    Wait Until Element Is Visible    ${OFERTA.CLICK_BUTTON} 
    Click Element                    ${OFERTA.CLICK_BUTTON} 

Quando clico no campo nome do curso
    Wait Until Element Is Visible      ${LISTAR_OFERTA.TEXT_INPUT}        
    Click Element                      ${LISTAR_OFERTA.TEXT_INPUT}
    Wait Until Element Is Visible      ${LISTAR_OFERTA.CLICK_CAMPO} 
    Click Element                      ${LISTAR_OFERTA.CLICK_CAMPO}                          

#03 Preencher formulario
# Dado que preencho o campo matriz
#     Wait Until Element Is Visible    ${FORM_MATRIZ.CURSO_INPUT}
#     Click Element                    ${FORM_MATRIZ.CURSO_INPUT}
#     Click Element                    ${FORM_MATRIZ.CLICK_INPUT}
          

#E preencho o campo tipo oferta
           
           
*** Test Cases ***
Cenario 01: Fazer login Cosmos
    [Tags]    regressivo
    Dado que acesso a pagina do Cosmos 
    Quando preencho senha e login 
    Então clico no botao entrar 
     

Cenario 02: Criar Oferta
    [Tags]    oferta
    Dado que clico no botão nav-bar
    E clico no link comercial
    E clico no link oferta
    Quando clico no campo nome do curso
    #E clico no codigo da oferta
    

# Cenario 03: Preencher campos do formulário
#     [Tags]    formulario
#     Dado que preencho o campo matriz
#     #E preencho o campo tipo oferta
#     # E preencho o campo marca
#     # E preencho o campo marca certificação
#     # E preencho o campo tipo de conceito
#     # E preencho o campo inicio
#     # E preencho o campo fim
#     # E preencho o campo degustação
#     # E preencho o campo portal pós
#     # E preencho o campo produto%
#     # E preencho o campo serviço%
#     # E preencho o campo data inicial
#     # Quando clico em salvar
#     # Então verifico se foi salvo minhas informações
        




