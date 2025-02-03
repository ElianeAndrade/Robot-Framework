*Settings*
Documentation    Base Test

# Deixar o timeout=30s antes de fazer o commit 
Library      Browser                         timeout=40s
Library      SeleniumLibrary 
Library      Collections
Library      RequestsLibrary
Library      BuiltIn 
Library      String
Library      Dialogs
Library      factories/Users.py
Variables    factories/ConfigVariaveis.py
Variables    factories/VariaveisCampanha.py

Resource    DataBase.robot
Resource    Helpers.robot
Resource    actions/${PASTA}/Pedidos_Actions.robot
Resource    actions/${PASTA}/Cadastro_Actions.robot
Resource    actions/${PASTA}/Telas_Actions.robot
Resource    actions/${PASTA}/Login_Actions.robot
Resource    actions/${PASTA}/EsqueciSenha_Actions.robot
Resource    actions/BRHAV/Dados_Actions.robot


*Variables*
${BROWSER}    chromium
${TIMEOUT}    40

*Keywords*
Start Session
    Retornar os dados do ambiente de testes
    New Browser          ${BROWSER}    headless=false    slowMo=00:00:01
    New Page             ${URL_CONFIG}
    Set Viewport Size    1280             768

After Test
    #Rodar Keyword que falhou
    Take Screenshot
    Logoff
    
Retornar os dados do ambiente de testes

    ${ambiente_teste}=    Set Variable If
    ...                   '${AMBIENTE}' == 'LOCAL'  ${AMBIENTE_LOCAL}
    ...                   '${AMBIENTE}' == 'DEV'    ${AMBIENTE_DEV}
    ...                   '${AMBIENTE}' == 'UAT'    ${AMBIENTE_UAT}
    ...                   '${AMBIENTE}' == 'RC'     ${AMBIENTE_RC}
    ...                   '${AMBIENTE}' == 'PROD'   ${AMBIENTE_PROD}


    ${campanha_teste}=    Set Variable If
    ...                   '${CAMPANHAID}' == 'SiteA'   ${SiteA}

           


    ${url_teste}=    Set Variable If
    ...                   '${AMBIENTE}' == 'LOCAL'   http://localhost:63998/${campanha_teste}[URL_LOCAL]
    ...                   '${AMBIENTE}' == 'DEV'     https://dev.satelital.com.br/${campanha_teste}[URL_DEV_UAT]
    ...                   '${AMBIENTE}' == 'UAT'     https://uat.satelital.com.br/${campanha_teste}[URL_DEV_UAT]
    ...                   '${AMBIENTE}' == 'RC'      https://rc.satelital.com.br/${campanha_teste}[URL_RC]
    ...                   '${AMBIENTE}' == 'PROD'    ${campanha_teste}[URL_PROD]


    ${url_telas_href}=    Set Variable If
    ...                   '${AMBIENTE}' == 'LOCAL'   ${campanha_teste}[URL_LOCAL]
    ...                   '${AMBIENTE}' == 'DEV'     ${campanha_teste}[URL_DEV_UAT]
    ...                   '${AMBIENTE}' == 'UAT'     ${campanha_teste}[URL_DEV_UAT]
    ...                   '${AMBIENTE}' == 'RC'      ${campanha_teste}[URL_RC]
    ...                   '${AMBIENTE}' == 'PROD'    ${campanha_teste}[URL_Dominio]


    ${user_credentials}=    Set Variable If
    ...                   '${AMBIENTE}' == 'LOCAL'   ${campanha_teste}[USER_CREDENTIALS][0]
    ...                   '${AMBIENTE}' == 'DEV'     ${campanha_teste}[USER_CREDENTIALS][0]
    ...                   '${AMBIENTE}' == 'UAT'     ${campanha_teste}[USER_CREDENTIALS][1]
    ...                   '${AMBIENTE}' == 'RC'      ${campanha_teste}[USER_CREDENTIALS][2]
    ...                   '${AMBIENTE}' == 'PROD'    ${campanha_teste}[USER_CREDENTIALS][3]

    Set Global Variable    ${CUPOM_STRING}                   ${CUPOM}
    Set Global Variable    ${DB_ENVIRONMENT_CONFIG}          ${ambiente_teste}
    Set Global Variable    ${CAMPANHA_CONFIG}                ${campanha_teste}
    Set Global Variable    ${URL_CONFIG}                     ${url_teste}
    Set Global Variable    ${URL_TELAS_HREF_CONFIG}          ${url_telas_href}
    Set Global Variable    ${USER_CREDENTIALS_CAMPAIGN}      ${user_credentials}



  
