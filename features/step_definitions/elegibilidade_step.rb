Dado('que preencho com os dados do médico para elegibilidade') do
    @medico.input_cpf.set $USER_DOCTOR_ELEGIBILIDADE
    @medico.input_senha.set $PASSWORD
    click_button('Acessar')
    sleep 3
    @medico.modal_onboarding.visible?
    @medico.skip_modal_onboarding.click
end  

Dado("que preencho com os dados do secretaria para elegibilidade") do 
    @medico.input_cpf.set $USER_SEC_ELEGIBILIDADE
    @medico.input_senha.set $PASSWORD
    click_button('Acessar')
    sleep 3
end     

Quando("preencho com os dados do paciente para elegibilidade") do 
    @agendamento.criar_agendamento_paciente_elegibilidade
end   

Quando("preencho com os dados do paciente inelegivel") do 
    @agendamento.criar_agendamento_paciente_inelegivel
end     
  
Então("verifico se o paciente é elegivel a consulta") do 
    raise  "Mensagem de elegivel não apareceu" unless @elegibilidade.mensagem_sucesso.visible?
end     

Então("verifico se o paciente é inelegivel a consulta") do 
    raise  "Mensagem de elegivel não apareceu" unless @elegibilidade.mensagem_erro.visible?
end     
