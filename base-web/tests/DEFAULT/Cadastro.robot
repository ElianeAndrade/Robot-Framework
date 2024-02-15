*Settings*
Documentation    Testes de Cadastro: CPF / CNPJ e EMAIL. 
Metadata         Test    Tag:Cadastro
Resource            ../../resources/Base.resource

Suite Setup         Iniciar Sessão
Test Teardown       Finalizar Sessão


*Test Cases*

01-Cadastrar novo usuário - CPF | CNPJ
   
    IF   '${CAMPANHA_CONFIG}[URL_Sigla]' == 'LACPF'
        ${user_faker}       Factory User        usuario_faker

        Acessar página de Login              
        Realizar Cadastro                        ${user_faker}   CPF
        Aceitar Termos e Condições  
        Logoff

    ELSE IF   '${CAMPANHA_CONFIG}[URL_Sigla]' == 'LACPJ'
        ${user_faker}    Factory User    usuario_faker

         Acessar página de Login              
         Realizar Cadastro                    ${user_faker}    CNPJ
         Aceitar Termos e Condições 
         Logoff

    END
    

03-Cadastrar novo usuário - EMAIL
    ${user_faker}    Factory User    usuario_faker
   

    Acessar página de Login              
    Realizar Cadastro                    ${user_faker}   EMAIL
    Aceitar Termos e Condições  
    Logoff

04-Usuário existente na base
    IF   '${CAMPANHA_CONFIG}[URL_Sigla]' == 'LACPF'
    ${user_faker}    Factory User    usuario_faker

    Acessar página de Login
    Cadastrar usuário que já existe na base     ${user_faker}    

    ELSE IF   '${CAMPANHA_CONFIG}[URL_Sigla]' == 'LACPJ'
    ${user_faker}    Factory User    usuario_faker

    Acessar página de Login
    Cadastrar usuário que já existe na base - PJ     ${user_faker}  

    END

