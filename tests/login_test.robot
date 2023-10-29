Language: ptbr
*** Configurações ***
Documentação       Suite base de teste 

Recurso            ../hooks/HOOKS.robot
Recurso            ../steps/login_steps.robot
Recurso            ../steps/home_steps.robot


*** Casos De Teste ***
Cenario 01: Realizar login
    [Tags]    login
    [Inicialização]    Iniciação do teste
    Dado Que eu faça login com o usuário e senha    ${USUARIO_INPUT}   ${SENHA_INPUT}  
    Então Devo ser logado no sistema
    [Finalização]    Finalização do teste

Cenario 02: Criar Matricula
     [Tags]    matricula
     [Inicialização]    Iniciação do teste
     Dado Que eu clique no menu navbar    
    

   

