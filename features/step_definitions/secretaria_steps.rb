# frozen_string_literal: true

Dado('que preencho com os dados de secretaria') do
  @medico.input_cpf.set $USER_SECRETARY
  @medico.input_senha.set $PASSWORD
  click_button('Acessar')
end
