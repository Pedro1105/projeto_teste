# frozen_string_literal: true

class ProntmedScreen < SitePrism::Page
  include Helpers
  include ProntmedModule

  elements :divs_info_patient, 'div[class*="SidebarContainer"] > div > div'
  elements :btns_menu, 'div[class*="SidebarContainer"] > button span'
  elements :btns_menu_resumo, 'ul#accordion > li'
  elements :exames_list, '#col-exam-item-list', wait: 10
  element :button_acessar_prescreicao, '#button-start-accept'
  element :item_list_prescricao, '#button-precriptions'
  element :modal_prescricao, '.messageModal__ModalWrapper-sc-1razfrv-3.bSZDQr'
  element :modal_validei_app, '.messageModal__ModalWrapper-sc-1razfrv-3.bSZDQr'

  # Frame prontuário
  element :lbl_breadcrumbs, '#span-type-view'
  element :pront_name_patient, '.patient-bar > div:nth-child(2) a'
  element :btn_acessar_prontuario, '.new-appointment', wait: 60
  elements :inputs_prontuario, 'section.active input'
  element :btn_section_prescription, '.nav-list li:nth-child(6)', wait: 60
  element :div_resumo_atendimento, '.overview-encounter'

  # Dr. Ao vivo
  element :panel_dr_aovivo, '#jsPanel-1'
  element :lbl_data_hora_consulta, '.body-2 > .subheading'
  element :acessar_consulta, '#button-start-appointment'

  # envio de prescrição
  elements :send_sms, '#button-send-sms'
  elements :send_email, '#button-send-email'
  elements :baixar_pdf, '#button-download'
  elements :selecionar_presc, '.styles__InputCheck-mrituq-21.bHBPZi'
  element :button_continuar, '#button-docs-accept'
  element :campo_inserir_cpf, 'input[placeholder="CPF teste assinatura"]'
  element :certificado_valid, '#button-certifier-valid'
  element :certificado_soluti, '#button-certifier-soluti'
  element :icon_closed_modal_certificacao, '#icon-digital-sign-close'
end
