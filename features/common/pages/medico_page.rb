# frozen_string_literal: true

# MAPEAMENTO DA PAGINA PRINCIPAL DO SITE
class MedicoScreen < SitePrism::Page
  include BaseScreen
  include MedicoModule

  element :header, '#header'
  element :input_cpf, '#login'
  element :input_senha, '#password'
  element :optin_medico, '.checkSpan'
  element :input_cpf_redefinir_senha, '#cpf'
  element :button_new_appointment, '#button-new-appointment'
  element :menu_medico, '#button-menu'
  element :button_secretariado, '#button-menu-secretary'
  element :button_sair, '#button-menu-exit'
  element :button_dados_paciente, '#button-patient-data'
  element :card_agendamento, '#card-open-consultation'
  element :menu_secretariado, '#button-menu-secretary'
  element :criar_secretaria, '#button-register-secretary'
  element :input_name_sec, '#new-assistant-name'
  element :input_cpf_sec, '#new-assistant-cpf'
  element :input_email_sec, '#new-assistant-email'
  element :button_created_sec, '#button-create-secretary'
  element :button_edit_sec, '#button-edit-secretary'
  elements :button_desativar_sec, '#button-deactivate-secretary'
  elements :button_reativar_sec, '#button-reactivate-secretary'
  element :modal_voltar, '#button-modal-back'
  element :button_start_appointment, '#button-start-appointment'
  element :button_ok_consulta, '#button-modal-back'
  element :mensagem_consulta_ok, '.messageModal__ModalWrapper-sc-1razfrv-3.bSZDQr'
  element :painel_dr_aovivo, '#davIframe'
  elements :divs_info_patient, 'div.left > div > div'
  elements :btns_menu, 'div.left > button span'
  elements :btns_menu_resumo, 'ul#accordion > li'
  element :search_patient, '#input-search-closed-consultation'
  element :button_voltar_home, '#button-back-home'
  element :modal_agora_nao, '#button-ad-decline'
  element :input_tel_sec, '#new-assistant-telephone'
  element :select_hour, '#react-select-3-option-0'
  element :modal_onboarding, '#icon-digital-sign-close'
  element :skip_modal_onboarding, '#button-tour-modal-skip'

  # Dados do paciente
  element :name_pacient, '#span-name'
  element :email_pacient, '#span-email'
  element :cpf_pacient, '#span-cpf'
  element :idade_pacient, '#span-age'
  element :last_consulta, '#span-last-consultation'
  element :results_exams, '#button-results'

  # Frame prontuário
  element :lbl_breadcrumbs, '.breadcrumbs'
  element :pront_name_patient, '.patient-bar > div:nth-child(2) a'
  element :btn_acessar_prontuario, '.new-appointment'
  elements :inputs_prontuario, 'li input'
  element :div_resumo_atendimento, '.overview-encounter'

  # Dr. Ao vivo
  element :panel_dr_aovivo, '.text-center.col.col-12'
  element :lbl_data_hora_consulta, '.body-2 > .subheading'

  # filtro exames
  element :filtro_data_inicio, '#filter-exams-date-start-'
  element :filtro_data_final, '#filter-exams-date-end-'
  element :button_filtrar, '#button-filter-'
  element :exames_list, '#col-exam-item-list', wait: 10
  element :button_open_exams, '#button-open-exam'
end
