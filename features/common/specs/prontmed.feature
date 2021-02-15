#utf-8 
#language: pt
@saudebradesco
@prontmed
Funcionalidade: Funcionalidades como médico dentro da plataforma:  
  
  @prontmed01
    Cenário: Validar informações do prontuario
    Dado que preencho com os dados do médico
    Quando clico em novo Agendamento
    E crio uma consulta com paciente ja cadastrado
    E inicio a consulta
    Então devo ser redirecionado para a tela de telemedicina
    E devo visualizar as informações do prontuário do paciente

  @prontmed02
  Cenário: Geração de prescrições médicas 
    Dado que preencho com os dados do médico
    E clico em detalhes de um paciente com exames
    Quando informo medicamentos e exames à fazer e salvo
    Então recebo a mensagem 'Obrigado pela consulta. Quer acessar suas prescrições agora?'
    Então valido a prescrição gerada

  @prontmed03
  Cenário: Assinatura de prescrições com Valid e Soluti
    Dado que preencho com os dados do médico
    E clico em detalhes de um paciente especifico
    Quando clico em prescrições
    E valido a prescrição gerada para aquele paciente
    Então valido as funções da prescrição

  @prontmed04
    Cenário: Validar filtro por data no resultado de exames 
    Dado que preencho com os dados do médico
    Quando clico em detalhes de um paciente com exames
    Então seleciono resultado de exames
    E filtro por data para visualizar um exame