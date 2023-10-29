Language: ptbr
*** Configurações ***
Biblioteca     SeleniumLibrary
Biblioteca     Process

Recurso    ../pages/login_page.robot


*** Palavras-Chave ***
Que eu faça login com o usuário e senha
    [Argumentos]    ${USUARIO}       ${SENHA}
    Escrever no campo Usuario    ${USUARIO}
    Escrever no campo senha      ${SENHA}
    Clicar no botão entrar
   

Que eu clique no menu navbar 
    Clicar no menu navbar 
    Clicar no botão comercial
    


   
    
