*** Settings ***
Documentation       Keywords referentes aos testes de pedidos.

Resource            ${EXECDIR}/resources/Base.robot

Library    Browser

*** Keywords ***
#Buscar página do produto
#    Sleep    3
#    Aguarde até que o elemento fique visível    id=home-content#

#    IF    '${DB_ENVIRONMENT_CONFIG}[DB_AMB]' == 'UAT'
#        Go To     ${URL_CONFIG}${CAMPANHA_CONFIG}[PRODUTO_UAT]
#    ELSE IF   '${DB_ENVIRONMENT_CONFIG}[DB_AMB]' == 'RC'#

#        Go To     ${URL_CONFIG}${CAMPANHA_CONFIG}[PRODUTO_RC]
#    ELSE IF   '${DB_ENVIRONMENT_CONFIG}[DB_AMB]' == 'PROD'
#        Go To     $${URL_CONFIG}${CAMPANHA_CONFIG}[PRODUTO_PROD]
#    ELSE
#        Go To     ${URL_CONFIG}${CAMPANHA_CONFIG}[PRODUTO_DEV]
#    END

Adicionar produto ao carrinho
    Wait For Elements State    id=buyButton
    ...    visible    50

    Click    id=buyButton

    Wait For Elements State    text=Carrinho de compras
    ...    visible    50

Revisar produtos no carrinho
    Wait For Elements State    text=Fechar pedido
    ...    visible    50

    Click    id=checkoutButtom

Etapa de verificação do Pedido
    Aguarde até que o elemento fique visível    xpath=//*[@class='box-header']/h3[contains(text(), 'Verificação')]

    Wait For Elements State    id=goToShippingLink
    ...    visible    50
    
    Click     xpath=(//span[contains(.,'Entrega')])[1]
    
  #  Click    id=goToShippingLink
    

Etapa de verificação da entrega
    [Documentation]    As opções são: Entrega, Entrega em Novo Endereço, Retirada.
    [Arguments]    ${tipo}

    Aguarde até que o elemento fique visível    css=.box-header >> text=Quero que me entregue
    Sleep         1s

    IF    '${tipo}' == 'Entrega'
        Click    id=entregarPedido
        Click    id=goToPaymentLink
        
    ELSE IF    '${tipo}' == 'Entrega em Novo Endereço'
        ${user}    Factory User    usuario2

        Click    id=entregarPedido
        Inserir novo endereço    ${user}
        Aguarde até que o elemento fique visível    css=.toast-message >> text=Endereço de entrega alterado!
        Clicar na tab Pagamento
    ELSE
        Click    id=retirarPedido
        Click    id=UFRetireNaLoja_chosen
        Click    css=.chosen-results >> text=AC
        Click    id=CidadeRetireNaLoja_chosen
        Click    css=.chosen-results >> text=Porto Acre
        Click    id=retiraNaLojaButton
        Aguarde até que o elemento fique visível
        ...    css=#texto-lojas-sem-retirada >> text=Nenhuma loja disponível para retirada
        Click    css=#goToPaymentLink >> text=Pagamento
    END

Validar toast message da Retirada
    Aguarde até que o elemento fique visível    css=.toast-message >> text=Selecione e confirme uma loja para continuar
    Print Screen

Inserir novo endereço
    [Arguments]    ${user}

    Click    text=Alterar endereço
    Click    text=Adicionar
    Preencher informações de Endereço    ${user}

Clicar na tab Pagamento
    Aguarde até que o elemento fique visível    css=i[class='fa fa-money fa-2x']
    Click    css=i[class='fa fa-money fa-2x']

Escolha do método de pagamento por Boleto
    Aguarde até que o elemento fique visível    id=panel-boleto

    Click    id=panel-boleto

    Processo Manual

    Click    id=btn-pagar-boleto

Escolha do método de pagamento por PIX
    Wait For Elements State    xpath=//h2[@class='panel-title'][contains(.,'PIX')]  
    ...    visible             ${TIMEOUT}

    Click    xpath=//h2[@class='panel-title'][contains(.,'PIX')]

    Wait For Elements State    id=btn-pagar-pix
    ...    visible             ${TIMEOUT}
    
    Click                      id=btn-pagar-pix
 
 Validar Pop-Up PIX
    Wait For Elements State    css=button[class="btn btn-default btn-block-xs"]
    ...    visible                 50
    
    Take Screenshot
    Click                      css=button[class="btn btn-default btn-block-xs"]

    
Escolha do método de pagamento por Cartão
    [Arguments]    ${bandeira}

    Wait For Elements State    id=panel-boleto    visible    ${TIMEOUT}

    Click    id=panel-credit

    Sleep     3s

    Wait For Elements State    xpath=(//span[contains(.,'-- Selecione --')])[1]
    ...    visible             10

    # Click no dropdown para escolher a bandeira do cartão 
     Click     xpath=(//a[@class='chosen-single'][contains(.,'-- Selecione --')])[1]
    
    # Click que ocorre para escolher o elemento do dropdown
    Wait For Elements State    css=.chosen-results >> text=${bandeira}
    ...    visible             10
    Click    css=.chosen-results >> text=${bandeira}

   # Click no dropdown para as parcelas
   # Screenshot para verificar se está correto o valor das parcelas

    Click    id=cardQuotasDropDown_chosen
    Take Screenshot 
   
   # Click que ocorre para escolher as parcelas desejadas - chumbado. 
    Click    xpath=//*[@class='chosen-results']/li[contains(text(), '1x')]

    Fill Text    id=CardNumber        000000001
    Fill Text    id=CardHolderName    Automação

    Fill Text    id=CardExpirationMonth     12
    Fill Text    id=CardExpirationYear      2024
    Fill Text    id=CardSecurityCode        258
    Click        id=btn-pagar-credito

Pedido Finalizado
    Aguarde até que o elemento fique visível    xpath=//*[@class='text-primary'][contains(text(), 'PEDIDO')]
    Print Screen

Aumentar as quantidades dos produtos
    Set Suite Variable    ${qntd1}    xpath=//*[@id="cartForm"]/div[2]/div/table/tbody/tr[2]/td[3]/input
    # Set Suite Variable    ${qntd2}    xpath=//*[@id="cartForm"]/div[2]/div/table/tbody/tr[5]/td[3]/input

    Click    ${qntd1}
    Fill Text    ${qntd1}    1
    Press Keys    ${qntd1}    Enter

    # Click    ${qntd2}
    # Fill Text    ${qntd2}    10
    # Press Keys    ${qntd2}    Enter

Pesquisar produto disponível
    [Arguments]    ${pasta}    ${arquivo_sql}

    ${query} =    Retornar o conteudo de um arquivo de consulta sql    ${pasta}    ${arquivo_sql}
    ${result}=    Realizar consulta no banco de dados    ${query}

    ${clean_result}=    Evaluate    "${result[0][0]}".replace('[', '').replace(']', '').replace('(', '').replace(')', '')

    Fill Text    xpath=//input[@id='q-header-desktop']    ${clean_result}
    Click        xpath=//button[@id="SearchButtonDesktop"]

Resgatar produto

    Wait For Elements State            css=button[class='block-ui produto-comprar-btn']
     ...                 visible        5
    Click                              css=button[class='block-ui produto-comprar-btn']

    Adicionar produto ao carrinho
    Revisar produtos no carrinho
    Realizar login         CPF
    Carrinho de Compras
    Revisar produtos no carrinho
   
    
