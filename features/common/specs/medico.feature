#utf-8 
# language: pt
@saudebradesco
@homemedico
Funcionalidade: Funcionalidades como médico dentro da plataforma:

- Criar secretaria
- Editar informações da secretaria
- Desativar secretaria
- Validar dados do prontuario
- Validar exames paciente


@homemedico01
Cenário: Criação de secretaria
    Dado que preencho com os dados do médico
    Quando clico em secretariado
    E cadastro uma secretaria
    Então devo visualizar a mensagem "Secretário(a) cadastrado(a)"

@homemedico02
Cenário: Editar perfil de secretaria
    Dado que preencho com os dados do médico
    Quando clico em secretariado
    E edito uma informação da secretaria
    Então devo visualizar a mensagem "Agora, Teste Automação Editar Sec receberá por email os passos para confirmar o cadastro."

@homemedico03
Cenário: Desativar secretaria
    Dado que preencho com os dados do médico
    Quando clico em secretariado
    E desativo uma secretaria
    Então devo visualizar a mensagem "Desativado com sucesso"

@homemedico03
Cenário: Reativar secretaria
    Dado que preencho com os dados do médico
    Quando clico em secretariado
    E reativo uma secretaria
    Então devo visualizar a mensagem "Reativado com sucesso"

@homemedico04
Cenário: Cancelamento de consulta 
    Dado que preencho com os dados do médico
    Quando clico em novo Agendamento
    E crio uma consulta com paciente ja cadastrado
    Quando clico em cancelar a consulta
    Então devo ver a mensagem de "Cancelar consulta?"
    E clico em Cancelar consulta

