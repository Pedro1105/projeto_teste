#utf-8 
# language: pt

@secretaria 
@saudebradesco 
Funcionalidade: Secretaria

@secretaria02
    Cenário: Agendamento de consulta com paciente novo
    Dado que preencho com os dados de secretaria
    Quando clico em novo Agendamento
    E preencho com os dados do paciente
    Então devo ver a mensagem de "Consulta criada"

@secretaria03
    Cenário: Agendamento de consulta com paciente ja cadastrado
    Dado que preencho com os dados de secretaria
    Quando clico em novo Agendamento
    E preencho com os dados do paciente ja cadastrado
    Então devo ver a mensagem de "Consulta criada"

@secretaria04
    Cenário: Copiar link da consulta 
    Dado que preencho com os dados de secretaria
    Quando clico em copiar link da consulta  
    Então devo ver a mensagem de "Link copiado para a área de transferência"

@secretaria05
    Cenário: Reenviar link da consulta
    Dado que preencho com os dados de secretaria
    Quando clico em reenviar o link da consulta
    Então confirmo no modal "Deseja reenviar link da consulta?"
    E vejo a mensagem "Link enviado com sucesso!"

@secretaria06
    Cenário: Cancelamento de consulta 
    Dado que preencho com os dados de secretaria
    Quando clico em cancelar a consulta  
    Então devo ver a mensagem de "Cancelar consulta?"
    E clico em Cancelar consulta
