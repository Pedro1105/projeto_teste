# frozen_string_literal: true

# MAPEAMENTO DA PAGINA PRINCIPAL DO SITE
class AgendamentoScreen < SitePrism::Page
  include Helpers
  include BaseScreen
  include AgendamentoModule
  include ElegibilidadeModule

  element :button_novo_agendamento, '#button-new-appointment'
  element :input_name, '#new-appointment-name-input'
  element :input_appointment_date, '#new-appointment-date'
  elements :input_appointment_hour, '.content div[aria-hidden="true"]', wait: 5
  elements :input_email, 'div.content input[placeholder="paciente@email.com.br"]'
  element :input_nome_select_novo, '#react-select-3-option-0'
  element :input_nome_select_cadastrado, '#react-select-2-option-1'
  element :input_confirm_email, '#new-appointment-email-confirm'
  element :input_date, '#new-appointment-date'
  elements :input_appointment_hour, '.css-1qy1ysi-control'
  element :input_hora, '#react-select-3-option-0'
  element :list_cnpj, '.new-appointment-code.css-2b097c-container'
  element :input_cnpj, '#react-select-2-option-0'
  element :modal_confirmacao_consulta, '.span__SpanCss-sc-18v02fl-0.gEYERo.superSetCommons__Span-sc-12k97zf-5.messageModal__ModalTitle-sc-1razfrv-4.kiSQlC', text: 'Agendamento criado'
  elements :copy_link_consulta, '#button-copy-link'
  element :button_back_home, '#button-modal-back', wait: 30
  elements :modal_reenviar_link, '#button-Resend-link'
  element :button_confirm_reenviar_link, '#button-resend-send'
  element :button_cancel_appointments, '#button-cancel-appointment'
  elements :button_confirm_cancel, '#button-appointment-cancel'
  elements :open_appointments, 'div[class*="ContentWrapper"] #card-open-consultation'
  element :input_telefone, '#new-appointment-telephone'
  element :criar_agendamento, '#button-create-appointment'
  element :check_box_elegibilidade, '.styles__CheckboxContainer-sc-1mroelw-0.iHGxuH'
  element :input_number_carteirinha, '#eligibility-input-card-number'

end
