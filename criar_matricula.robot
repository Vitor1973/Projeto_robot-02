language: ptbr

*** Settings ***
Library          SeleniumLibrary
 

*** Variables ***

#Variaveis de configuração
${URL}         https://kroton.platosedu.io/erp/login/auth 
#${BROWSER}    headlesschrome
${BROWSER}     chrome


#Variaveis do login
${LOGIN.USUARIO_INPUT}             //input[@type='text']
${LOGIN.SENHA_INPUT}               //input[@type='password']
${LOGIN.ENTRAR_BUTTON}             //button[@type='submit']            

#Variaveis de preencimento login
${USUARIO_INPUT}                   tamires.medeiros
${SENHA_INPUT}                     123456

     
#Variaveis do NavBar
${MENU.CLICK_BUTTON}                      id:nav-icon
${MENU_COMERCIAL.CLICK_BUTTON}           //a[contains(@class,'main-nav-link main-nav-section section-comercial')] 
${MENU_OFERTA.CLICK_BUTTON}             //a[@href='/erp/oferta/index'][contains(.,'Oferta')]
${CRIAR_OFERTA.CLICK_BUTTON}           //a[contains(@title,'Criar')]

#Variaveis de preenchimento
${FORMULARIO_MATRIZ.CURSO_SELECTED}             id:matriz.id-selectized
${FORMULARIO.TIPO_OFERTA_SELECTED}              id:tipoOferta-selectized

                  

*** Keywords ***
Dado que acesso a pagina do Cosmos 
    Open Browser     ${URL}      ${BROWSER}
    Maximize Browser Window

E preencho senha e login  
    Input Text    ${LOGIN.USUARIO_INPUT}         ${USUARIO_INPUT} 
    Input Text    ${LOGIN.SENHA_INPUT}           ${SENHA_INPUT} 

Quando clico no botao entrar
    Click Element    ${LOGIN.ENTRAR_BUTTON} 
    
*** Keywords *** 
#02 Palavras-chaves NAV-BAR
Dado que clico no botão nav-bar
    Wait Until Element Is Visible    ${MENU.CLICK_BUTTON}    
    Click Element                    ${MENU.CLICK_BUTTON}
     
E clico no link comercial
    Wait Until Element Is Visible    ${MENU_COMERCIAL.CLICK_BUTTON}     
    Click Element                    ${MENU_COMERCIAL.CLICK_BUTTON}  

E clico no link oferta
    Wait Until Element Is Visible    ${MENU_OFERTA.CLICK_BUTTON}  
    Click Element                    ${MENU_OFERTA.CLICK_BUTTON}  

Quando clico no botão criar oferta
    Wait Until Element Is Visible    ${CRIAR_OFERTA.CLICK_BUTTON}    
    Click Element                    ${CRIAR_OFERTA.CLICK_BUTTON}        

#03 Preencher formulario
Dado que preencho o campo matriz
    Wait Until Element Is Visible    ${FORMULARIO_MATRIZ.CURSO_SELECTED} 
    Click Element                    ${FORMULARIO_MATRIZ.CURSO_SELECTED} 
    Input Text                       ${FORMULARIO_MATRIZ.CURSO_SELECTED}     text=Curso Teste Automatizado
             
E preencho o campo tipo oferta
    Wait Until Element Is Visible    ${FORMULARIO.TIPO_OFERTA_SELECTED}
    Scroll Element Into View         ${FORMULARIO.TIPO_OFERTA_SELECTED}
    Input Text                       locator=//*[@id="marca-selectized"]    text=100% Online
    Click Element                    locator=//*[@id="marca-selectized"]
    
E preencho o campo marca
    Wait Until Element Is Visible    locator=//*[@id="marca-selectized"]
    Input Text                       locator=//*[@id="marca-selectized"]    text=AC Camargo
    Click Element                    locator=//*[@id="marca-selectized"]

E preencho o campo marca certificação
    Wait Until Element Is Visible    locator=marcaCertificacao-selectized
    Click Element                    locator=marcaCertificacao-selectized
    Input Text                       locator=marcaCertificacao-selectized    text=Anhanguera           

E preencho o campo tipo de conceito
    Wait Until Element Is Visible    locator=tipoConceito-selectized
    Click Element                    locator=tipoConceito-selectized
    Input Text                       locator=tipoConceito-selectized   text=De 0 à 100    
      
E preencho o campo inicio
    Wait Until Element Is Visible    locator=confInicio
    Click Element                    locator=confInicio
    Input Text                       locator=confInicio   text=000

E preencho o campo fim
    Wait Until Element Is Visible    locator=//input[contains(@name,'confFim')]
    Click Element                    locator=//input[contains(@name,'confFim')]
    Input Text                       locator=//input[contains(@name,'confFim')]   text=000

E preencho o campo degustação
    Wait Until Element Is Visible    locator=//input[contains(@placeholder,'Possui Degustação')]
    Click Element                    locator=//input[contains(@placeholder,'Possui Degustação')]
    Input Text                       locator=//input[contains(@placeholder,'Possui Degustação')]   text=Sim 

E preencho o campo portal pós
    Wait Until Element Is Visible    locator=//input[contains(@placeholder,'Portal Pós')]
    Input Text                       locator=//input[contains(@placeholder,'Portal Pós')]   text=Sim
    Click Element                    locator=//input[contains(@placeholder,'Portal Pós')]     
    

E preencho o campo produto%
    Wait Until Element Is Visible    locator=alavancaProduto
    Click Element                    locator=alavancaProduto
    Input Text                       locator=alavancaProduto  text=000

E preencho o campo serviço%
    Wait Until Element Is Visible    locator=//input[contains(@name,'alavancaServico')]
    Click Element                    locator=//input[contains(@name,'alavancaServico')]
    Input Text                       locator=//input[contains(@name,'alavancaServico')]  text=bbb 

E preencho o campo data inicial
    Wait Until Element Is Visible    locator=alavancaDataInicio
    Click Element                    locator=alavancaDataInicio
    Input Text                       locator=alavancaDataInicio  text=29102023

Quando clico em salvar
    Click Element                    locator=//button[contains(.,'Salvar')]

Então verifico se foi salvo minhas informações corretamente
    Title Should Be    title=Cosmos · Criar Oferta
        
    

*** Test Cases ***
Cenario 01: Fazer login Cosmos
    [Tags]    regressivo
    Dado que acesso a pagina do Cosmos 
    E preencho senha e login 
    Quando clico no botao entrar 
     

Cenario 02: Criar Oferta
    [Tags]    oferta
    Dado que clico no botão nav-bar
    E clico no link comercial
    E clico no link oferta
    Quando clico no botão criar oferta
    

Cenario 03: Preencher campos do formulário
    [Tags]    formulario
    Dado que preencho o campo matriz
    E preencho o campo tipo oferta
    E preencho o campo marca
    E preencho o campo marca certificação
    E preencho o campo tipo de conceito
    E preencho o campo inicio
    E preencho o campo fim
    E preencho o campo degustação
    E preencho o campo portal pós
    E preencho o campo produto%
    E preencho o campo serviço%
    E preencho o campo data inicial
    Quando clico em salvar
    Então verifico se foi salvo minhas informações corretamente
        




