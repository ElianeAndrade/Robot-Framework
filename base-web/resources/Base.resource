*** Settings ***
Documentation       Arquivo base do projeto de testes

Library             Browser        timeout=50s
Library             Collections
Library             BuiltIn
Library             String
Library             Dialogs
Library             OperatingSystem
Library             factories/Users.py
Variables           factories/ConfigVariaveis.py
Variables           factories/VariaveisCampanha.py

Variables           locators/variaveis.yaml

Resource            actions/DEFAULT/Login_actions.robot
Resource            actions/DEFAULT/Cadastro_actions.robot
Resource            Database.resource
Resource            Helpers.resource


*** Variables ***
${BROWSER}    chromium
${TIMEOUT}    40

*** Keywords ***
Iniciar Sessão
    Retornar os dados do ambiente de testes

    New Browser    chromium    headless=False    slowMo=00:00:00.3
    New Page    ${URL_CONFIG}
    Set Viewport Size    1290    600

Finalizar Sessão
    Take Screenshot    

Retornar os dados do ambiente de testes

    ${ambiente_teste}=    Set Variable If
    ...                   '${AMBIENTE}' == 'LOCAL'  ${AMBIENTE_LOCAL}
    ...                   '${AMBIENTE}' == 'DEV'    ${AMBIENTE_DEV}
    ...                   '${AMBIENTE}' == 'UAT'    ${AMBIENTE_UAT}
    ...                   '${AMBIENTE}' == 'RC'     ${AMBIENTE_RC}
    ...                   '${AMBIENTE}' == 'PROD'   ${AMBIENTE_PROD}


    ${campanha_teste}=    Set Variable If
    ...                   '${CAMPANHAID}' == 'LACPF'   ${LACPF}
    ...                   '${CAMPANHAID}' == 'LACPJ'   ${LACPJ}

           
    ${url_teste}=    Set Variable If
    ...                   '${AMBIENTE}' == 'LOCAL'   http://localhost:63998/${campanha_teste}[URL_LOCAL]
    ...                   '${AMBIENTE}' == 'DEV'     https://dev.satelital.com.br/${campanha_teste}[URL_DEV_UAT]
    ...                   '${AMBIENTE}' == 'UAT'     https://uat.satelital.com.br/${campanha_teste}[URL_DEV_UAT]
    ...                   '${AMBIENTE}' == 'RC'      https://rc.satelital.com.br/${campanha_teste}[URL_RC]
    ...                   '${AMBIENTE}' == 'PROD'    ${campanha_teste}[URL_PROD]


    ${user_credentials}=    Set Variable If
    ...                   '${AMBIENTE}' == 'LOCAL'   ${campanha_teste}[USER_CREDENTIALS][0]
    ...                   '${AMBIENTE}' == 'DEV'     ${campanha_teste}[USER_CREDENTIALS][0]
    ...                   '${AMBIENTE}' == 'UAT'     ${campanha_teste}[USER_CREDENTIALS][1]
    ...                   '${AMBIENTE}' == 'RC'      ${campanha_teste}[USER_CREDENTIALS][2]
    ...                   '${AMBIENTE}' == 'PROD'    ${campanha_teste}[USER_CREDENTIALS][3]

    
    Set Global Variable    ${DB_ENVIRONMENT_CONFIG}          ${ambiente_teste}
    Set Global Variable    ${CAMPANHA_CONFIG}                ${campanha_teste}
    Set Global Variable    ${URL_CONFIG}                     ${url_teste}
    Set Global Variable    ${USER_CREDENTIALS_CAMPAIGN}      ${user_credentials}

