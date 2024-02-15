*** Settings ***
Documentation       Keywords comuns no projeto.

Library    Browser

*** Keywords ***
Acessar o menu '${nome_menu}'
    Aguarde até que o elemento fique visível    css=.megamenu_container
    Click    css=.megamenu_container >> text=${nome_menu}

    Print Screen

Acessar o submenu '${nome_menu}' > '${nome_submenu}'
    Aguarde até que o elemento fique visível    css=.megamenu_container
    Click    css=.megamenu_container >> text=${nome_menu}

    Mouse Move Relative To    css=.megamenu_container >> text=${nome_menu}
    Click    css=.megamenu_container >> text=${nome_submenu}

    Print Screen
Aguarde até que o elemento fique visível
    [Arguments]    ${elemento}

    Wait For Elements State    ${elemento}    visible    ${TIMEOUT}

Processo Manual
    Execute Manual Step        Please complete the CAPTCHA portion of the form.

Print Screen
    Take Screenshot    fullPage=True

Modal de Aguarde... visivel
    ${statusModal}    Get Element States
    ...    css=.modal-content >> text=Aguarde...
    ...    then
    ...    value & (visible | detached)

    IF    ${statusModal} == ['visible']
        Wait For Elements State       css=.modal-content >> text=Aguarde...    detached    10
    END

Preencher os campos de Endereco corretamente
    [Arguments]    ${user}

    Aguarde até que o elemento fique visível    id=postalCodeTextBox

    Fill Text    id=postalCodeTextBox    ${user}[cep]

    Wait For Elements State               id=numberTextBox    focused     10

    Fill Text    id=numberTextBox                         ${user}[num]
    Fill Text    id=complementTextBox                     ${user}[complemento]
    Fill Text    css=input[name='Address.Description']    ${user}[referencia]
   
    Print Screen

    Click    css=button >> text=Salvar

Validar mensagem de alerta    
    [Arguments]    ${msg_esperada}

    Aguarde até que o elemento fique visível    css=.alert-danger >> text=${msg_esperada}

Validar mensagem de erro 
    [Arguments]    ${msg_esperada}

    Aguarde até que o elemento fique visível    css=.error >> text=${msg_esperada}

Fechar pop-up se visível
    ${statusPopUp}    Run Keyword And Return Status    Wait For Elements State    css=.fancybox-wrap    10
    Run Keyword If    ${statusPopUp} == True
    ...    Click    xpath=//a[@title="Close"]

Fechar pesquisa de satisfação se visivel
    ${statusPesquisa}    Run Keyword And Return Status    Wait For Elements State    css=.article    10
    Run Keyword If    ${statusPesquisa} == True
    ...    Click    id=closeSurveyModal




    

   