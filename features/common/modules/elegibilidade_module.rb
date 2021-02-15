
module ElegibilidadeModule

  def criar_agendamento_paciente_elegibilidade
    @name = Faker::Name.name
    @email = Faker::Internet.email(domain: 'paciente.qa')
    set_text(input_name, @name)
    sleep 5
    click_item_list(@name)
    set_text(input_email[0], @email)
    # set_text(@agendamento.input_email[1], @email)
    set_text(input_telefone, '11992222442')
    @date = input_appointment_date.value
    input_appointment_hour[1].click
    click_item_list rand(0...list_item.size)
    input_appointment_hour[2].click
    click_item_list rand(0...list_item.size)
    check_box_elegibilidade.click
    input_number_carteirinha.send_keys $NUMBER_CARTEIRINHA_VALIDA
  end   

  def criar_agendamento_paciente_inelegivel
    @name = Faker::Name.name
    @email = Faker::Internet.email(domain: 'paciente.qa')
    set_text(input_name, @name)
    sleep 5
    click_item_list(@name)
    set_text(input_email[0], @email)
    # set_text(@agendamento.input_email[1], @email)
    set_text(input_telefone, '11992222442')
    @date = input_appointment_date.value
    input_appointment_hour[1].click
    click_item_list rand(0...list_item.size)
    input_appointment_hour[2].click
    click_item_list rand(0...list_item.size)
    check_box_elegibilidade.click
    input_number_carteirinha.send_keys $NUMBER_CARTEIRINHA_INVALIDA
  end   

end   
