# frozen_string_literal: true

Dado('que preencho com os dados do médico') do
  @medico.input_cpf.set $USER_DOCTOR
  @medico.input_senha.set $PASSWORD
  click_button('Acessar')
  sleep 3
  @medico.modal_onboarding.visible?
  @medico.skip_modal_onboarding.click
  sleep 3
  @medico.modal_agora_nao.click
end

Dado('que preencho com os dados do médico 2') do
  @medico.input_cpf.set $USER_DOCTOR_2
  @medico.input_senha.set $PASSWORD
  click_button('Acessar')
  @medico.modal_onboarding.visible?
  @medico.skip_modal_onboarding.click
  sleep 3
  @medico.modal_agora_nao.click
end

Dado('que preencho com os dados do médico 3') do
  @medico.input_cpf.set $USER_DOCTOR_3
  @medico.input_senha.set $PASSWORD
  click_button('Acessar')
  sleep 3
  @medico.modal_onboarding.visible?
  @medico.skip_modal_onboarding.click
  sleep 3
  @medico.modal_agora_nao.click
end

Então('devo ser direcionado para a home logada') do
  @medico.button_new_appointment.visible?
end

Dado('que clico em esqueceu a senha') do
  click_button('Esqueceu a senha?')
end

Quando('preencho com o cpf do médico') do
  @medico.input_cpf_redefinir_senha.set $USER_DOCTOR
  click_button('Enviar')
end

Então('devo ver a mensagem que o email de redefinição foi enviado') do
  expect(page).to have_content('Ok, entendi', wait: 5)
end

Então('devo visualizar os cards de agendamento e menu do médico') do
  @medico.button_new_appointment.visible?
  @medico.menu_medico.visible?
  expect(page).to have_content('Dados do paciente', wait: 5)
end

Quando('clico em secretariado') do
  @medico.menu_medico.click
  @medico.menu_secretariado.click
end

Quando('cadastro uma secretaria') do
  @medico.criar_secretaria.click
  @medico.cadastrar_secretaria
end

Então('devo visualizar a mensagem {string}') do |string|
  expect(page).to have_content(string, wait: 30)
end

Quando('edito uma informação da secretaria') do
  @medico.editar_secretaria
  @agendamento.clear_input('#new-assistant-name')
  @medico.input_name_sec.send_keys 'Teste Automação Editar Sec'
  @medico.input_tel_sec.send_keys '11992222442'
  @medico.button_created_sec.click
end

E('desativo uma secretaria') do
  @medico.desativar_sec
end

E('reativo uma secretaria') do
  @medico.reativar_sec
end

Quando('crio uma consulta com paciente ja cadastrado') do
  # @date = Faker::Date.forward(days: 60).strftime('%d/%m/%Y')
  set_text(@agendamento.input_name, 'Thays')
  sleep 5
  click_item_list(1)
  @date = @agendamento.input_appointment_date.value
  @agendamento.input_appointment_hour[1].click
  click_item_list rand(0...list_item.size)
  @agendamento.input_appointment_hour[2].click
  click_item_list rand(0...list_item.size)
  @agendamento.criar_agendamento.click
  sleep 3
  click_button('Ok, entendi')
end

Quando('inicio a consulta') do
  @medico.iniciar_atendimento
end

Então('devo ser redirecionado para a tela de telemedicina') do
  # @medico.panel_dr_aovivo.visible?
  # within_frame 1 do
  # @medico.lbl_data_hora_consulta.visible?
  # highlight_element(@medico.lbl_data_hora_consulta)
  # end
  # raise "Janela do Dr ao vivo de telemedicina não abriu" unless @medico.painel_dr_aovivo.visible?
end

E('devo visualizar as informações do prontuário do paciente') do
  @medico.fechar_janela_draovivo
  @medico.validar_dados_paciente
  within_frame 0 do
    raise 'O Prontuario não carregou/não abriu' unless @medico.pront_name_patient.visible?

    @medico.btn_acessar_prontuario.click
    set_text(@medico.inputs_prontuario.first, 'Teste QA Automação')
    @medico.inputs_prontuario.first.send_keys(:enter)
    sleep 3
    click_button('Finalizar atendimento')
    sleep 3
    within '.noty_buttons' do
      click_button('Sim')
    end
    highlight_element(@medico.div_resumo_atendimento)
    expect(@medico.div_resumo_atendimento).to have_content('Teste QA Automação')
  end
end

Quando('clico em detalhes de um paciente com exames') do
  @medico.select_dados_patient_exms
end

Quando('clico em detalhes de um paciente especifico') do
  @medico.select_dados_patient_exms_espec
end

Quando('clico em detalhes de um paciente') do
  @medico.select_dados_patient
end

Quando('clico em detalhes de um paciente novo') do
  @medico.select_dados_patient_novo
end

Então('seleciono resultado de exames') do
  sleep 3
  @medico.results_exams.click
end

Então('filtro por data para visualizar um exame') do
  @medico.filter_exams
end
