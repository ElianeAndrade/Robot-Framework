*Settings*
Documentation           Keywords referentes aos testes de verificação de telas.


*Keywords*
Rotina de verificação de Telas
    [Arguments]         ${id}
    Click               css=${id}
    
    #Modal de Aguarde... visivel

    Wait For Elements State     .header-desk-meio
    ...         visible         5      

    Print Screen


Sobre a havanna 
    Rotina de verificação de Telas          a[href="${URL_TELAS_HREF_CONFIG}/Home/AboutUs"]

Política de Segurança
    Rotina de verificação de Telas          a[href="${URL_TELAS_HREF_CONFIG}/Home/SecurityPolicy"]

Política de Privacidade
    Rotina de verificação de Telas          a[href="${URL_TELAS_HREF_CONFIG}/Home/Privacy"]

Formas de Entrega
    Rotina de verificação de Telas          a[href="${URL_TELAS_HREF_CONFIG}/Home/DeliveryWays"]

Formas de Pagamento
    Rotina de verificação de Telas          a[href="${URL_TELAS_HREF_CONFIG}/Home/PaymentMethods"]

Política de Troca
    Rotina de verificação de Telas          a[href="${URL_TELAS_HREF_CONFIG}/Home/ReturnedItems"]

FAQ
   Rotina de verificação de Telas           a[href="${URL_TELAS_HREF_CONFIG}/CustomerService/FAQ"] >> text=FAQ

Lista de Desejos
    Rotina de verificação de Telas          a[id='btn-lista-desejos']
   
Carrinho de Compras
   Rotina de verificação de Telas          a[id='btn-carrinho']

Meus Pedidos e Detalhes
    Click                                   css=i[class='fa-solid fa-user havanna-icons']
    Click                                   id=btn-meus-pedidos


    #Aguarde até que o elemento fique visível  xpath=(//*[@class='col_view text-right']/a)[1]

    Click                                     xpath=(//*[@class='col_view text-right']/a)[1]

    #Aguarde até que o elemento fique visível  text=Detalhes do seu pedido
 
    Print Screen

Meus Dados e Tela de Endereço
    Click                                   css=i[class='fa-solid fa-user havanna-icons']
    Click                                   id=btn-meus-dados

    Wait For Elements State                 id=firstNameTextBox
    ...         visible         5     

    Print Screen   

    # Tela de Endereços # 
    Click                                   css=a[href="/havanna/Account/Addresses"]
    Wait For Elements State                 id=btnAdicionarEndereco
    ...         visible         5     

    Click                                   id=btnAdicionarEndereco
    Print Screen

