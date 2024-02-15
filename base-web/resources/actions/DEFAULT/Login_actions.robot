*Settings*
Documentation           Keywords referentes aos testes de Login.

Library    Browser

*Keywords*
Acessar página de Login
    Wait For Elements State                 id=entrar-registrar
    ...    visible    50
    Click                                   id=entrar-registrar

Login
    [Documentation]                         As opções são: CPF, CNPJ e EMAIL
    # Ele pega a massa de testes do arquivo VariaveisCampanha.py
    [Arguments]                 ${type}

    Fill Text    id=loginEmail                          ${USER_CREDENTIALS_CAMPAIGN}[${type}]
    Fill Text    xpath=//input[@name='password']        ${USER_CREDENTIALS_CAMPAIGN}[PASSWORD]

    Click        id=btnLogin


Realizar login 
    [Arguments]        ${type}

    Acessar página de Login                      
    Login              ${type}                   
    Sleep   1

Rotina para realizar o Login
#Utilizada para cenários em que a massa de testes é dinâmica
    [Arguments]            ${user}
    
    Fill Text              id=loginEmail                               ${user}[doc]
    Fill Text              xpath=//input[@name='password']             ${user}[senha]
    Click                  id=btnLogin
    #Execute JavaScript    location.reload(true)

Logoff
    Print Screen
    Wait For Elements State                    css=div[class='header-usuario']
    ...                visible                 5
    Click                                      css=div[class='header-usuario']
    Click                                      css=a[id='linkSair'] 

                        
  

