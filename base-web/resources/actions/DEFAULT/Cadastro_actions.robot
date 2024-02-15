*Settings*
Documentation           Keywords referentes aos testes de cadastro.

Library    Browser

*Keywords*
Realizar Cadastro 
    [Documentation]         As opções são: CPF, CNPJ e EMAIL.
    [Arguments]             ${user}          ${doc}
        
        # Montando a chave que existe no dicionário em Users.py
        ${value} =              Set Variable               ${user}[${doc}]

        Fill Text              id=registerEmail            ${value}
        Click                  id=btn-cadastrar-usuario 

    IF    '${doc}' == 'CPF'
        Wait For Elements State            id=firstNameTextBox
        ...                 visible        5

        Type Text                          id=birthDateTextBox                      ${user}[nascimento]
        Click                              text=Dados de contato
        Click                              xpath=(//input[@name="Gender"]/../span[@class="radio-checkmark"])[2]

        Fill Text                          id=firstNameTextBox                      ${user}[nome]  
        Fill Text                          id=lastNameTextBox                       ${user}[sobrenome] 
    
        Click                              id=birthDateTextBox 
        Fill Text                          id=birthDateTextBox                      ${user}[nascimento] 

        Fill Text                          id=emailTextBox                          ${user}[EMAIL] 
        Fill Text                          id=confirmEmailTextBox                   ${user}[EMAIL]  
        Fill Text                          id=phone2TextBox                         ${user}[celular]  
       
        Fill Text                          id=passwordTextBox                       ${user}[senha]  
        Fill Text                          id=confirmPasswordTextBox                ${user}[senha]

        Processo Manual

        Click                              id=btnSalvarContato
        
        Preencher informações de Endereço   ${user}

    ELSE IF  '${doc}' == 'CNPJ'

        Wait For Elements State            id=emailTextBox
        ...                 visible        5    
        Fill Text                          id=NameTextBox                           ${user}[nome] 

        Fill Text                          id=emailTextBox                          ${user}[EMAIL] 
        Fill Text                          id=confirmEmailTextBox                   ${user}[EMAIL] 

        Fill Text                          id=InscricaoEstadualTextBox               300847939611

        Click                               xpath=(//span[contains(@class,'switch-lever')])[1]
    
        Fill Text                          id=phone2TextBox                         ${user}[celular]
            
        Fill Text                          id=passwordTextBox                       ${user}[senha]  
        Fill Text                          id=confirmPasswordTextBox                ${user}[senha]
        
        Processo Manual

        Click                              id=btnSalvarContato

        Preencher informações de Endereço   ${user}

    ELSE IF    '${doc}' == 'EMAIL'

        Wait For Elements State            id=firstNameTextBox
        ...                 visible        5

        Type Text                          id=birthDateTextBox                      ${user}[nascimento]
        Click                              text=Dados de contato
        Click                              xpath=(//input[@name="Gender"]/../span[@class="radio-checkmark"])[2]

        Fill Text                          id=firstNameTextBox                      ${user}[nome]  
        Fill Text                          id=lastNameTextBox                       ${user}[sobrenome] 
    
        Click                              id=birthDateTextBox 
        Fill Text                          id=birthDateTextBox                      ${user}[nascimento] 

        Fill Text                          id=cpfTextbox                            ${user}[CPF] 
        Fill Text                          id=confirmEmailTextBox                   ${user}[EMAIL]  
        Fill Text                          id=phone2TextBox                         ${user}[celular]  
       
        Fill Text                          id=passwordTextBox                       ${user}[senha]  
        Fill Text                          id=confirmPasswordTextBox                ${user}[senha]

        Processo Manual

        Click                              id=btnSalvarContato
        
        Preencher informações de Endereço   ${user}
    END



Preencher informações de Endereço 
    [Arguments]                         ${user}  
    
    Wait For Elements State              css=input[id=postalCodeTextBox]
    ...    visible    20
   
    Type Text                            css=input[id=postalCodeTextBox]                        ${user}[cep]    
    Sleep                                5s
    
    Wait For Elements State              css=input[id=numberTextBox]        focused             ${TIMEOUT}           
    

    Fill Text                            css=input[id=numberTextBox]                                 ${user}[logradouro]  
    Fill Text                            css=input[id=complementTextBox]                             ${user}[comp]
    Fill Text                            css=input[name='Address.Description']                       ${user}[desc]

    Click                                css=button[id='btnSalvarContato']

    Take Screenshot

Aceitar Termos e Condições
    Click    xpath=(//span[contains(@class,'checkbox-checkmark')])[1]
    Click    xpath=(//span[contains(@class,'checkbox-checkmark')])[2]

    Click    id=AcceptButton
    Take Screenshot

Cadastrar usuário que já existe na base
    [arguments]                           ${user}

    Fill Text                             id=registerEmail            ${user}[ja_cadastrado]
    Click                                 id=btn-cadastrar-usuario 
    Wait For Elements State               css=div[id='registerForm_server_validation']    visible    10
    Take Screenshot

Cadastrar usuário que já existe na base - PJ
    [arguments]                           ${user}

    Fill Text                             id=registerEmail                           ${user}[ja_cadastrado_pj]
    Click                                 id=btn-cadastrar-usuario 
    Wait For Elements State               css=div[id='registerForm_server_validation']    visible    10
    Take Screenshot