*Settings*
Documentation    Fluxo de fechamento de pedidos
Resource         ${EXECDIR}/resources/Base.robot
Resource    ../../resources/Base.robot

Suite Setup      Start Session       
Test Teardown    After Test


*** Test Cases ***
Fechamento de Pedido - Boleto

   Pesquisar produto disponível                BRHAV     tbProdXCamp.sql       
   Resgatar produto
   Etapa de verificação do Pedido
   Etapa de verificação da entrega              Entrega
   Escolha do método de pagamento por Boleto
   Pedido Finalizado
Fechamento de Pedido em novo endereço - Boleto

    Pesquisar produto disponível                BRHAV     tbProdXCamp.sql       
    Resgatar produto
    Etapa de verificação do Pedido
    Etapa de verificação da entrega              Entrega em Novo Endereço
    Escolha do método de pagamento por Boleto
    Pedido Finalizado

Fechamento de Pedido - PIX

    Pesquisar produto disponível                BRHAV     tbProdXCamp.sql          
    Resgatar produto
    Etapa de verificação do Pedido
    Etapa de verificação da entrega           Entrega
    Escolha do método de pagamento por PIX
    Validar Pop-Up PIX
    Pedido Finalizado

Fechamento de Pedido - Cartão Mastercard

    Pesquisar produto disponível                BRHAV     tbProdXCamp.sql          
    Resgatar produto
    Etapa de verificação do Pedido
    Etapa de verificação da entrega              Entrega
    Escolha do método de pagamento por Cartão    Mastercard
    Pedido Finalizado

Fechamento de Pedido - Cartão Visa

    Pesquisar produto disponível                BRHAV     tbProdXCamp.sql          
    Resgatar produto
    Etapa de verificação do Pedido
    Etapa de verificação da entrega              Entrega
    Escolha do método de pagamento por Cartão    Visa
    Pedido Finalizado

Fechamento de Pedido - Cartão Amex

    Pesquisar produto disponível                BRHAV     tbProdXCamp.sql          
    Resgatar produto
    Etapa de verificação do Pedido
    Etapa de verificação da entrega              Entrega
    Escolha do método de pagamento por Cartão    Amex
    Pedido Finalizado

Fechamento de Pedido - Cartão Elo

    Pesquisar produto disponível                BRHAV     tbProdXCamp.sql          
    Resgatar produto
    Etapa de verificação do Pedido
    Etapa de verificação da entrega              Entrega
    Escolha do método de pagamento por Cartão    Elo
    Pedido Finalizado

Fechamento de Pedido - Cartão Diners

    Pesquisar produto disponível                BRHAV     tbProdXCamp.sql          
    Resgatar produto
    Etapa de verificação do Pedido
    Etapa de verificação da entrega              Entrega
    Escolha do método de pagamento por Cartão    Diners
    Pedido Finalizado


