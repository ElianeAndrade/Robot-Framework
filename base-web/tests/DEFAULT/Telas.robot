*Settings*
Documentation    Verificação das Telas do Site
Resource         ${EXECDIR}/resources/Base.robot

Suite Setup      Start Session    
Test Teardown    After Test

*Test Cases*
Verificação das Telas

    Realizar Login         CPF                    
    Sobre a havanna
    Política de Segurança
    Política de Privacidade
    Formas de Entrega
    Formas de Pagamento
    Política de Troca
    FAQ
    Lista de Desejos
    Carrinho de Compras
    Meus Pedidos e Detalhes
    Meus Dados e Tela de Endereço
