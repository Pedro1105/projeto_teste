# frozen_string_literal: true

Dado('que logo com os dados do médico') do
  @medico.input_cpf.set $USER_DOCTOR
  @medico.input_senha.set $PASSWORD
  click_button 'Acessar'
  sleep 3
  @medico.modal_onboarding.visible?
  @medico.skip_modal_onboarding.click
  sleep 3
  @medico.modal_agora_nao.click
end

Dado('que preencho com os dados do doutor') do
  @medico.input_cpf.set $USER_DOCTOR_2
  @medico.input_senha.set $PASSWORD
  click_button('Acessar')
  sleep 3
  @medico.modal_onboarding.visible?
  @medico.skip_modal_onboarding.click
  sleep 3
  @medico.modal_agora_nao.click
end

E('clico no botão de iniciar consulta') do
  @prontmed.acessar_consulta.last.click
end

E('clico no primeiro botão de iniciar consulta') do
  click_button('Iniciar consulta')
end

E('clico no menu lateral prescrições emitidas') do
  click_button('Prescrições emitidas')
end

Quando(' acessar prescrição') do
  @prontmed.item_list_prescricao.click
end

Então('valido as funções da prescrição com a certificadora {string}') do |string|
  $datetime = $PRESCRIPTION_DATE if $datetime.nil? || $datetime.empty?
  prescription = @prontmed.get_prescription(@prontmed.exames_list, $datetime)
  @prontmed.validate_prescription_sign(prescription, string)
  @prontmed.validate_prescription_send_sms(prescription)
  @prontmed.validate_prescription_send_mail(prescription)
  @prontmed.validate_prescription_download(prescription)
end

E('valido a oferta de certificado digital') do
  modal = find('.content > div')
  expect(modal).to(have_content('Quer seu certificado digital gratuito?', wait: 10))
  expect(modal).to(have_content('Vamos facilitar suas prescrições e cuidar bem do seu dia a dia'))
  click_button('Quero agora')
  click_button('Quero deixar para depois')
end

Quando('informo medicamentos e exames à fazer e salvo') do
  within_frame 0 do
    sleep 3
    @prontmed.btn_acessar_prontuario.click
    sleep 3
    @prontmed.btn_section_prescription.click
    field = @prontmed.inputs_prontuario.last
    @prontmed.fill_prescriptions(@prontmed.inputs_prontuario.first, 'Tomografia')
    @prontmed.fill_prescriptions(field, 'Diazepam')
    @prontmed.fill_prescriptions(field, 'Amoxicilina')
    sleep 3
  end
  within_frame 0 do
    click_button('Finalizar atendimento')
    sleep 3
    within '.noty_buttons' do
      click_button('Sim')
    end
  end
end

Então('recebo a mensagem {string}') do |string|
  modal = find('.content > div', match: :first)
  expect(modal).to(have_content(string, wait: 30))
end

Então('valido a prescrição gerada') do
  sleep 3
  click_button('Acessar prescrições')
  @prontmed.validate_prescriptions
end

Então('valido a prescrição gerada para aquele paciente') do
  sleep 3
  @prontmed.validate_prescriptions
end

Então('valido as funções da prescrição') do
  @prontmed.validate_prescription_sign(@prontmed.exames_list.first)
  @prontmed.validate_prescription_send_sms(@prontmed.exames_list.first)
  @prontmed.validate_prescription_send_mail(@prontmed.exames_list.first)
  @prontmed.validate_prescription_download(@prontmed.exames_list.first)
end

Quando('acesso o menu de {string}') do |string|
  click_button(string)
end

Então('valido as opções de envio de prescrição') do
  @prontmed.send_sms[0].click
  @prontmed.send_email[0].click
  find('#button-modal-back').click
  @prontmed.validate_prescription_download(@prontmed.exames_list.first)
end

E('envio uma prescrição para o e-mail do paciente') do
  $datetime = $PRESCRIPTION_DATE if $datetime.nil? || $datetime.empty?
  prescription = @prontmed.get_prescription(@prontmed.exames_list, $datetime)
  @prontmed.validate_prescription_send_mail(prescription)
end

Então('valido a prescrição via e-mail') do
  acessar_email('paciente')
  expect(page).to(have_content('Seu Médico(a) te enviou uma nova prescrição médica'))
  click_on('Acessar Prescrição')
  set_text(@prescription.input_birthdate, '08/03/1999')
  @prescription.btn_prescription_next.click
  @prescription.btn_choose_prescription.click
  expect(@prescription.prescription_type.size).to(be == 3)
  expect(@prescription.prescription_type[2]).to(have_content('Pedido de exames'))
  @prescription.prescription_type[2].click
  @prescription.qr_code.visible?
  expect(page).to(have_content('Para comprar, mostre esse código QR para o farmacêutico'))
end

Quando('clico em prescrições') do
  find('#button-precriptions').click
end
