# frozen_string_literal: true

module MedicoModule
  def iniciar_atendimento
    a = all('#button-start-appointment')
    a.count
    a[0].click
  end

  def clear_input(element)
    find(element).native.clear
  end

  def cadastrar_secretaria
    @cpf = Faker::IDNumber.brazilian_citizen_number
    @email = Faker::Internet.email(domain: 'gmail.com')
    puts '@cpf'
    puts '@email'
    input_name_sec.send_keys 'Teste Automação Bradesco'
    input_cpf_sec.send_keys(@cpf)
    input_email_sec.send_keys(@email)
    input_tel_sec.send_keys '11992222442'
    button_created_sec.click
  end

  def editar_secretaria
    a = all('#button-edit-secretary')
    a.count
    a[1].click
  end

  def desativar_sec
    a = all('#button-deactivate-secretary')
    a.count
    a[1].click
    click_button('Confirmar')
  end

  def reativar_sec
    button_reativar_sec.first.click
    click_button('Confirmar')
  end

  def validate_info_patient(elementos)
    raise "Informações divergentes: size: #{elementos.size}" unless elementos.size == 6

    highlight_element(elementos[0])
    highlight_element(elementos[1])
    highlight_element(elementos[2])
    highlight_element(elementos[3])
    highlight_element(elementos[4])
  end

  def fechar_janela_draovivo
    if page.has_css?('#jsPanel-1')
      all('.jsPanel-headerbar button').last.click
    end
  end

  def validar_dados_paciente
    raise 'O Nome do paciente não apareceu' unless name_pacient.visible?
    raise 'O email do paciente não apareceu' unless email_pacient.visible?
    raise 'O cpf do paciente não apareceu' unless cpf_pacient.visible?
    raise 'O idade do paciente não apareceu' unless idade_pacient.visible?
    # raise "A data da ultima consulta do paciente não apareceu" unless last_consulta.visible?
  end

  def select_dados_patient_exms
    search_patient.send_keys 'Thays'
    a = all('#button-patient-data')
    a.count
    a[0].click
  end

  def select_dados_patient_exms_espec
    search_patient.send_keys 'Thays'
    a = all('#button-patient-data')
    a.count
    a[0].click
  end

  def select_dados_patient
    search_patient.send_keys 'Thays'
    a = all('#button-patient-data')
    a.count
    a[0].click
  end

  def select_dados_patient_novo
    search_patient.send_keys 'Thays'
    a = all('#button-patient-data')
    a.count
    a[0].click
  end

  def filter_exams
    filtro_data_inicio.send_keys '01112018'
    filtro_data_final.send_keys '15112018'
    button_filtrar.click
    exames_list.click
    exames = all('#button-open-exam')
    exames.count
    exames[3].click
  end
end
