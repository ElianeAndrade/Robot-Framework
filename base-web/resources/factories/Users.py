from faker import Faker
fake = Faker("pt_BR")

# Arquivo para configuração de informações genéricas do usuário (ex: cadastros).
def factory_user(target):

    data = {
        "usuario_faker": {
            "CPF": fake.cpf(),
            "CNPJ": fake.cnpj(),
            "nome": fake.first_name(),
            "sobrenome": fake.last_name(),
            "senha": "Test123!",
            "EMAIL": fake.free_email(),
            "celular": fake.cellphone_number(),
            "nascimento": "05071999",
            "cep": "13327373",
            "logradouro": "142",
            "num": "142",
            "comp": "Andar 12",
            "complemento": "Andar 12",
            "referencia": "Endereço cadastrado pelo Robot Framework",
            "desc": "Endereço cadastrado pelo Robot Framework",
            'ja_cadastrado':'88135036019',
            'ja_cadastrado_pj':'36960967000162',
        },
        "usuario2": {
            "cep": "13327373",
            "logradouro": fake.building_number(),
            "comp": fake.street_name(),
            "ref": fake.neighborhood(),
            "desc": fake.company(),
        },
        
        'cep_sem_preenchimento': {
            'cep':'99680-000',
            'rua':'Rua Teste',
            'bairro':'Bairro Teste',
            'logradouro':'1234',
            'desc':'CEP sem preenchimento '
         },
        
        'logininv': {
            'doc':'54198380014',
            'senha': 'Test123!'
        },
             
         'senhainv': {
            'doc':'54198380015',
            'email': 'eandrade@yopmail.com',
            'senha': 'Tes!'
            },

        'emailinv': {
            'doc':'eandrade2@yopmail.com.br',
            'email': 'eandrade2@yopmail.com.br',
            'senha': 'Test123!'
            },

        'esquecisenha': {
            'email': 'teste-teste@satelital.com.br',
            }

   }
    
        
    return data[target]
