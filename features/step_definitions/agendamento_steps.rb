# frozen_string_literal: true

Quando('clico em novo Agendamento') do
  sleep 3
  @agendamento.button_novo_agendamento.click
end

Quando('preencho com os dados do paciente') do
    @agendamento.criar_agendamento_paciente_novo
end

Então('devo der a mensagem de agendamento criado com sucesso.') do
  sleep 3
  @agendamento.modal_confirmacao_consulta.visible?
end

Quando('preencho com os dados do paciente ja cadastrado') do
  @date = Faker::Date.forward(days: 60).strftime('%d/%m/%Y')
  set_text(@agendamento.input_name, 'Thays')
  sleep 5
  click_item_list(1)
  set_text(@agendamento.input_appointment_date, @date)
  @agendamento.input_appointment_hour[1].click
  click_item_list rand(0...list_item.size)
  @agendamento.input_appointment_hour[2].click
  click_item_list rand(0...list_item.size)
  @agendamento.criar_agendamento.click
end

Quando('clico em copiar link da consulta') do
  @agendamento.copy_link_consulta[0].click
end

Então('devo ver a mensagem de {string}') do |string|
  expect(page).to have_content(string, wait: 30)
end

Quando('crio um agendamento com paciente ja cadastrado') do
  @date = Faker::Date.forward(days: 60).strftime('%d/%m/%Y')
  set_text(@agendamento.input_name, 'Thays')
  sleep 5
  click_item_list(1)
  set_text(@agendamento.input_appointment_date, @date)
  @agendamento.input_appointment_hour[1].click
  click_item_list rand(0...list_item.size)
  @agendamento.input_appointment_hour[2].click
  click_item_list rand(0...list_item.size)
  @agendamento.check_box_elegibilidade.click
  @agendamento.input_number_carteirinha.send_keys '772736139211002'
  sleep 8
  @agendamento.criar_agendamento.click
end

Quando('clico em reenviar o link da consulta') do
  @agendamento.modal_reenviar_link[0].click
end

Então('confirmo no modal {string}') do |string|
  expect(page).to have_content(string, wait: 5)
  @agendamento.button_confirm_reenviar_link.click
end

Então('vejo a mensagem {string}') do |string|
  sleep 2
  expect(page).to have_content(string, wait: 5)
end

Quando('clico em cancelar a consulta') do
  @agendamento.cancelar_consulta
end

Então('clico em confirmar {string}') do |string|
  expect(page).to have_content(string, wait: 5)
end

E('clico em Cancelar consulta') do
  @agendamento.button_confirm_cancel[0].click
end

