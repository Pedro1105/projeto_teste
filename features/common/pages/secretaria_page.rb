# frozen_string_literal: true

class SecretariaScreen < SitePrism::Page
  include BaseScreen
  include SecretariaModule

  element :button_new_appointment, '#button-new-appointment'
  element :imput_hora_list, '#react-select-5-option-0'
  element :input_hora_sec, '#react-select-3-option-0'
  element :input_cnpj_sec, '#react-select-4-option-0'
  element :mensagem_sucesso, '.span__SpanCss-sc-18v02fl-0.jjZKxI.superSetCommons__Span-sc-12k97zf-5.messageModal__ModalSubtitle-sc-1razfrv-4.fsuyRa'
  element :input_nome_select_novo_sec, '#react-select-3-option-0'
  element :imput_cnpj_sec, '#react-select-5-option-0'
end
