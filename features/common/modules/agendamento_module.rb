# frozen_string_literal: true

module AgendamentoModule
  # metodo para pegar a data do dia
  def data_do_dia
    data = Date.today.strftime('%d-%m-%Y')
    input_date.send_keys data
  end

  def data_futura
    input_date.send_keys '20082021'
    sleep 3
  end

  # metodo que copia do link da consulta, verificando caso esteja pendente de confirmação
  # recebe a div do card da consulta e retorna o link
  def copy_link_to_transfer(card_div)
    link_text = 'Copiar link da consulta'
    if card_div.find('div > div[size="12"]:nth-child(1) > div:nth-child(4)').text == link_text
      card_div.find('div > div[size="12"]:nth-child(1) > div:nth-child(4)').click
    elsif card_div.find('div > div[size="12"]:nth-child(1) > div:nth-child(5)').text == link_text
      card_div.find('div > div[size="12"]:nth-child(1) > div:nth-child(5)').click
    else
      raise 'Link da consulta não encontrado'
    end
    validate_popup('Link copiado para a área de transferência')
    Clipboard.paste
  end

  # metodo que busca um card de consulta agendada em tal data
  # recebe a div com todos os cards, a data, e se está confirmada ou pendente cadastro
  def get_appointment(card_div, date, is_confirmed)
    text = is_confirmed ? 'Reenviar link da consulta' : 'Pendente de confirmação'
    card_div.each do |card|
      highlight_element(card)

      # data do agendamento
      div_date = card.find('div:nth-child(3) > span:nth-child(2)')
      highlight_element(div_date)
      next unless div_date.text.include?(date)

      # elemento que pode ser: reenvio de link ou pendente confirmação
      div_confirm = card.find('div:nth-child(3) > span:nth-child(3)')
      return card if div_confirm.text.include?(text)
    end
  end

  def cancelar_consulta
    a = all('#button-cancel-appointment')
    a.count
    a[1].click
  end

  # metodo de validação se os campos de cadastro de medico estão na tela, a partir do nome do campo
  def validate_input_register_doctor_screen(text)
    if text.is_a? Array
      count = 0
      while count < text.count
        values = all('.sc-41qwxj-0').map { |input| input['placeholder'] }
        raise "Campo divergente. Expected: #{text[count]}, Actual: #{values[count]}" unless values[count] == text[count]

        count += 1
      end
    else
      raise 'Informar um array.'
    end
  end

  # metodo de validação da mensagem de obrigatoriedade do campo de cadastro de medico
  def validate_register_required_label(input, msg)
    erro = input.find(:xpath, 'parent::*/div')
    highlight_element(erro)
    raise "Erro divergente. Expected: #{msg}, Actual: #{erro}" unless erro.text == msg
  end

  # metodo de validação dos resultados da busca por palavra-chave
  def validate_question_search_result(results, _keyword)
    results.each do |el|
      highlight_element(el)
      el.find('button').click
      highlight_element(el.find('.flrPAf'))
    end
  end

  def clear_input(element)
    find(element).native.clear
  end

  # metodo para clicar num elemento da lista
  # recebe o index do item ou o valor a ser buscado na lista
  def click_item_list(text)
    sleep 3
    if text.is_a?(Numeric)
      list_item[text].click
    elsif text.is_a?(String)
      list_item.each do |item|
        if item.text.include?(text)
          item.click
          return
        end
      end
      raise "Opção não encontrada na lista: #{text}"
    end
  end

  # retorna a lista de itens ao abrir os optins genéricos do site
  def list_item
    all('div[class$="-menu"] > div > div')
  end

  def selecionar_hora
    a = all('.css-2b097c-container')
    a.count
    a[1].click
  end

  def criar_agendamento_paciente_novo
    @name = Faker::Name.name
    @email = Faker::Internet.email(domain: 'paciente.qa')
    set_text(input_name, @name)
    sleep 3
    click_item_list(@name)
    set_text(input_email[0], @email)
    # set_text(@agendamento.input_email[1], @email)
    set_text(input_telefone, '11992222442')
    @date = input_appointment_date.value
    input_appointment_hour[1].click
    click_item_list rand(0...list_item.size)
    input_appointment_hour[2].click
    click_item_list rand(0...list_item.size)
    criar_agendamento.click  
  end   

  def criar_agendamento_paciente_elegibilidade
    @name = Faker::Name.name
    @email = Faker::Internet.email(domain: 'paciente.qa')
    set_text(input_name, @name)
    sleep 3
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
    input_number_carteirinha.send_keys '772736139211002'
    sleep 3
    mensagem_sucesso.visible?
    sleep 3
    criar_agendamento.click  
  end   



end
