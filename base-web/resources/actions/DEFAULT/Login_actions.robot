*Settings*
Documentation           Keywords referentes aos testes de Login.

Library    Browser

*Keywords*
Acessar página de Login
    Wait For Elements State    css=a[title="Login ou Cadastro"]
    ...    visible    50
    Click                               css=a[title="Login ou Cadastro"]

Login
    [Documentation]            As opções são: CPF, CNPJ e EMAIL
    # Ele pega a massa de testes do arquivo VariaveisCampanha.py
    [Arguments]            ${type}

    Fill Text    id=loginEmail                       ${USER_CREDENTIALS_CAMPAIGN}[${type}]
    Fill Text    xpath=//input[@name='password']     ${USER_CREDENTIALS_CAMPAIGN}[PASSWORD]

    Run Keyword If  '${DB_ENVIRONMENT_CONFIG}[DB_AMB]' == 'PROD'      Processo Manual

    Click        id=btnLogin

    Sleep       2s
    
Realizar login 
    [Arguments]        ${type}

    Acessar página de Login                      
    Login              ${type}                   
    Sleep   1


Rotina para realizar o Login
#Utilizada para cenários em que a massa de testes é dinâmica
    [Arguments]         ${user}
    
    Fill Text              id=loginEmail                               ${user}[doc]
    Fill Text              xpath=//input[@name='password']             ${user}[senha]
    Click                  id=btnLogin
    #Execute JavaScript     location.reload(true)


Logoff
    Click                                       css=i[class='fa-solid fa-arrow-right-from-bracket havanna-icons']
    Aguarde até que o elemento fique visível    text=Acesse ou Cadastre-se                         
  

