#utf-8 
# language: pt
@saudebradesco
@elegibilidade
   Funcionalidade: Consultar elegibilidade do convênio na hora de realizar o agendamento da consulta

 @elegibilidade01 
   Cenário: Paciente elegivel para consulta
   Dado que preencho com os dados do médico para elegibilidade
   Quando clico em novo Agendamento
   E preencho com os dados do paciente para elegibilidade
   Então verifico se o paciente é elegivel a consulta

@elegibilidade02
   Cenário: Paciente inelegivel para consulta
   Dado que preencho com os dados do médico para elegibilidade
   Quando clico em novo Agendamento
   E preencho com os dados do paciente inelegivel
   Então verifico se o paciente é inelegivel a consulta

   @elegibilidade03
   Cenário: agendamento com secretaria
   Dado que preencho com os dados do secretaria para elegibilidade
   Quando clico em novo Agendamento
   E preencho com os dados do paciente inelegivel
   Então verifico se o paciente é inelegivel a consulta

    @elegibilidade04
   Cenário: agendamento com secretaria
   Dado que preencho com os dados do secretaria para elegibilidade
   Quando clico em novo Agendamento
   E preencho com os dados do paciente para elegibilidade
   Então verifico se o paciente é elegivel a consulta
