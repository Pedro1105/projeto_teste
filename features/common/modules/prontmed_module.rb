# frozen_string_literal: true

module ProntmedModule
  # método de validação das informações do paciente
  # e depois verifica se o texto que foi enviado esta na lista q ele criou
  def validate_info_patient(elementos)
    raise "Informações divergentes: size: #{elementos.size}" unless elementos.size == 5

    highlight_element(elementos[0])
    highlight_element(elementos[1])
    highlight_element(elementos[2])
    highlight_element(elementos[3])
    highlight_element(elementos[4])
  end

  # método de validação dos menus. Ele pega uma lista, coloca na vaiavel
  # e depois verifica se o texto que foi enviado esta na lista q ele criou
  def validate_menu_toolbar(menus, elementos)
    toolbar = elementos.map(&:text)
    raise "Menu #{menus} is not present in toolbar #{toolbar}" unless toolbar == menus

    elementos.each do |el|
      highlight_element(el)
    end
  end

  # método de clicar no menu lateral
  # recebe o menu e o item a ser clicado
  def click_menu_item(menu, item)
    menu.each do |el|
      next unless el.text == item

      highlight_element(el)
      el.click
      break
    end
  end

  # método de validação da listagem de exames
  # recebe a lista de exames por data
  def validate_exams(exams)
    exams.each do |el|
      highlight_element(el)
      el.find('svg').click
      sleep 2
      exams_items = el.find(:xpath, '..').all('button')
      raise 'Exames não visíveis' if exams_items.empty?

      exams_items.each do |btn|
        highlight_element(btn)
      end
    end
  end

  # método de validação dos detalhes do exame
  # recebe uma div de exames em determinada data
  def validate_exam_details(exams)
    i = rand(0...exams.size)
    exams[i].click
    exams_items = exams[i].find(:xpath, '..').all('button')

    j = rand(0...exams_items.size)
    exams_items[j].click
    raise 'Detalhes do exame não visível' unless page.has_css?('.tab-content pre', wait: 5)
  end

  # método de preencher um campo de seleção no prontuário
  # recebe o campo e o valor que será buscado
  def fill_prescriptions(field, text)
    all('.active .btn-warning').each(&:click)
    set_text(field, text)
    option = all('ul.dropdown-menu li')
    option[0].click
  end

  # método de validação da listagem de prescrições
  # recebe a lista de prescrições por data
  def validate_prescriptions
    size = all('#col-exam-item-list').size
    raise 'Lista não visível' unless size > 0
  end

  # método de validação da função de assinatura
  # recebe uma prescrição
  def validate_prescription_sign(prescription)
    # Valida CPF sem certificado
    within prescription do
      find('#button-sign-now').click
    end
    # binding.pry
    modal_prescricao.visible?
    click_button('Agora não')
    # Valida CPF com certificado
    set_text(find('input[placeholder="CPF teste assinatura"]'), '08108122660')
    within prescription do
      find('#button-sign-now').click
    end
    certificado_soluti.visible?
    find('#button-cert-decline').click
    sleep 3
    set_text(find('input[placeholder="CPF teste assinatura"]'), '01948994208')
    within prescription do
      find('#button-sign-now').click
    end
    certificado_valid.visible?
    find('#button-cert-decline').click
    sleep 2
  end

  # método de validação da função de envio por sms
  # recebe uma prescrição
  def validate_prescription_send_sms(prescription)
    within prescription do
      find('#button-send-sms').click
    end
    validate_btn_color(prescription, 'Enviado!', 'button-send-sms')
  end

  # método de validação da função de envio por email
  # recebe uma prescrição
  def validate_prescription_send_mail(prescription)
    within prescription do
      find('#button-send-email').click
    end
    click_button('Enviar')
    validate_btn_color(prescription, 'Enviado!', 'button-send-email')
  end

  # método de validação da função de download PDF
  # recebe uma prescrição
  def validate_prescription_download(prescription)
    within prescription do
      find('#button-download').click
    end
    validate_btn_color(prescription, 'Baixado!', 'button-download')
  end

  def validate_btn_color(prescription, text, id_btn)
    sleep(5)
    within prescription do
      color = find("##{id_btn} > span").native.css_value('color')
      value = find("##{id_btn} > span").text
      raise "Cor do botão incorreta ao clicar: #{color}" unless color == 'rgba(41, 182, 123, 1)'
      raise "Texto do botão incorreto ao clicar: #{value}" unless value == text
    end
  end
end
