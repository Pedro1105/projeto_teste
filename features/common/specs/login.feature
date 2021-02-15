#utf-8 
# language: pt
@login 
@saudebradesco
Funcionalidade: Login do médico/secretaria bradesco

@login01
    Cenário: Validação de login como médico
    Dado que preencho com os dados do médico
    Então devo ser direcionado para a home logada

@login02
    Cenário: Redefinir senha
    Dado que clico em esqueceu a senha
    Quando preencho com o cpf do médico
    Então devo ver a mensagem que o email de redefinição foi enviado

@login03
    Cenário: Validação da home logada
    Dado que preencho com os dados do médico
    Então devo visualizar os cards de agendamento e menu do médico

@login04
    Cenário: Validação de login como secretaria
    Dado que preencho com os dados de secretaria
    Então devo ser direcionado para a home logada
