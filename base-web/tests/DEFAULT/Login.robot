*** Settings ***
Documentation       Login

Resource            ../../resources/Base.resource

Suite Setup         Iniciar Sessão
Test Teardown       Finalizar Sessão


*** Test Cases ***
01 - Cenários de Login - CPF

     IF   '${CAMPANHA_CONFIG}[URL_Sigla]' == 'LACPF'
          Realizar login         CPF
          Logoff

     ELSE IF   '${CAMPANHA_CONFIG}[URL_Sigla]' == 'LACPJ'
          Realizar login         CNPJ
          Logoff
     END

02 - Cenários de Login - EMAIL  
     Realizar login         EMAIL
     Logoff

03 - Cenários de Login - Senha Inválida 
    ${senha}    Factory User    senhainv
        
    Acessar página de Login
    Rotina para realizar o Login    ${senha}
        
04 - Cenários de Login - Usuário Inválido 
    ${login}    Factory User    logininv
        
    Acessar página de Login
    Rotina para realizar o Login    ${login}
    
    