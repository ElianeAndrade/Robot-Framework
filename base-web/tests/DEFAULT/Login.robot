*Settings*
Documentation    Teste Segurança de Login 
Resource         ${EXECDIR}/resources/Base.robot

Suite Setup      Start Session      
Test Teardown    Take Screenshot
Library          Browser

*Test Cases*
Verificação de Login - CPF
    Realizar login     CPF
    Logoff

Verificação de Login - CNPJ
    Realizar login     CNPJ   
    Logoff

Verificação de Login - Senha Inválida 
    ${senha}    Factory User    senhainv
    ${login}    Factory User    logininv
    
    Acessar página de Login
    Rotina para realizar o Login    ${senha}
    Rotina para realizar o Login    ${login}





