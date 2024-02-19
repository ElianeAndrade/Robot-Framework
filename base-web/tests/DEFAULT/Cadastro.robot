*Settings*
Documentation    Testes de Cadastro: CPF / CNPJ e EMAIL. 
Metadata         Test    Tag:Cadastro
Resource         ${EXECDIR}/resources/Base.robot
Suite Setup      Start Session    


*Test Cases*
Cadastrar usuário que já existe na base
   
    ${user_faker}    Factory User    usuario_faker

    Acessar página de Login  
    Cadastrar usuário que já existe na base    ${user_faker}

Cadastrar novo usuário - CPF
   
    ${user_faker}    Factory User    usuario_faker

    Acessar página de Login              
    Realizar Cadastro                    ${user_faker}   CPF  
    Aceitar Termos e Condições
    Logoff

Cadastrar novo usuário - CNPJ
    ${user_faker}    Factory User    usuario_faker


    Acessar página de Login              
    Realizar Cadastro                    ${user_faker}    CNPJ 
    Aceitar Termos e Condições
    Logoff

Cadastrar novo usuário - EMAIL
    ${user_faker}    Factory User    usuario_faker
   

    Acessar página de Login              
    Realizar Cadastro                    ${user_faker}   EMAIL  
    Aceitar Termos e Condições
    Logoff



