*Settings*
Documentation           Keywords referentes aos testes de cadastro.

Library    Browser

*Variables*
${editar_endereco}                    //div[@class="row row-top-space"]/div[@class="col-md-12"]//tbody[@class="color-black"]/tr[last()]/td[@data-title="Ações"]/a[1]
${excluir_endereco}                   //div[@class="row row-top-space"]/div[@class="col-md-12"]//tbody[@class="color-black"]/tr[2]/td[@data-title="Ações"]/a[2]

*Keywords*
CEP sem preenchimento 
    [Arguments]                          ${user}
           
    Type Text                             id=postalCodeTextBox                                 ${user}[cep]
    #Click                                 id=postalcodebutton

    Fill Text                             id=streetNameTextBox                                  ${user}[rua]
    Fill Text                             id=districtTextBox                                    ${user}[bairro]
    Fill Text                             id=numberTextBox                                      ${user}[logradouro]                       
    Fill Text                             css=input[name='Address.Description']                 ${user}[desc]

    Click                                 css=button[class='btn btn-primary']

    Take Screenshot

    
Complemento obrigatório 

    [Arguments]                          ${user}
           
    Type Text                             id=postalCodeTextBox                                 ${user}[cep]
    #Click                                 id=postalcodebutton

    Clicar Elemento por XPath usando JavaScript                                xpath=//span[contains(@class,'switch-body')]

    Fill Text                             id=streetNameTextBox                                  ${user}[rua]
    Fill Text                             id=districtTextBox                                    ${user}[bairro]                      
    Fill Text                             css=input[name='Address.Description']                 ${user}[desc]

    Click                                 css=button[class='btn btn-primary']
    
    Wait For Elements State               xpath=//label[@for='complementTextBox'][contains(.,'Este campo é obrigatório.')]    visible      ${TIMEOUT}
    Take Screenshot

Editar Endereço 
        
    Wait For Elements State                xpath=${editar_endereco}          visible          ${TIMEOUT}
    Click                                  xpath=${editar_endereco} 

    Fill Text                             css=input[name='Address.Description']               EDIÇÃO ENDEREÇO


    Clicar Elemento por XPath usando JavaScript             xpath=(//span[contains(@class,'switch-lever')])[2]

    Click                                 css=button[class='btn btn-primary']

    Take Screenshot


Excluir Endereço 

    Wait For Elements State                id=btnAdicionarEndereco        visible          ${TIMEOUT}
    Click                                  xpath=${excluir_endereco}
    Wait For Elements State                xpath=//button[@type='button'][contains(.,'Sim')]         visible          ${TIMEOUT}

    Click                                  xpath=//button[@type='button'][contains(.,'Sim')] 

    Wait For Elements State                id=btnAdicionarEndereco        visible          ${TIMEOUT}

    Take Screenshot

