# frozen_string_literal: true

# utf-8
require 'report_builder'
require 'date'
require 'httparty'

Before do |_scenario|
  # class's instancies
  # Class Login
  @medico = MedicoScreen.new
  @agendamento = AgendamentoScreen.new
  @secretaria = SecretariaScreen.new
  @prontmed = ProntmedScreen.new
  @elegibilidade = ElegibilidadeScreen.new

  visit $BASE_URL
end

def add_screenshot(scenario)
  sufix = ('error' if scenario.failed?) || 'success'
  name = scenario.name.tr(' ', '_').downcase
  foto = save_screenshot("images/#{sufix}-#{name}.png")
  base64_img = Base64.encode64(File.open(foto, 'rb:UTF-8', &:read))
  attach(base64_img, 'image/png;base64')
end

def exception_message(scenario)
  scene = scenario.failed?
  return unless scene == true

  log("\n\n----------------------------------------------")
  log('Reason:')
  log(scenario.exception.message.to_s)
  log("----------------------------------------------\n\n")
end

After do |scenario|
  add_screenshot(scenario)
  exception_message(scenario)
end

#metodo para enviar email e sms de alerta
#passed = 0
#failed = 0
#AfterConfiguration do |config|
#  config.on_event(:test_case_finished) do |event|
#    puts "\n\nResults:"
#    puts '----------------------------------------------'
#    puts "Scenario: #{event.test_case.name}"
#    puts "The results is: #{event.result}"
#    puts "----------------------------------------------\n\n"
#    if event.result.ok?(:passed)
#      passed += 1
#    else
#      failed += 1
#    end
#  end
#  config.on_event(:test_run_finished) do
#    if passed < failed
#      send_email
#      send_sms
#    end
#  end
#end
#def send_email
#  HTTParty.post('https://api.mailslurp.com/sendEmail',
#                headers: { 'Content-Type' => 'application/json', 'x-api-key' => '10bc69a5faf2fd759de0df001a4adde8dc3ff1931a1fdd1765a4961e793b3777' },
#                body: { 'body' => 'Temos problemas em prod!', 'subject' => 'Automação Bradesco Saúde', 'to' => 'thaysmanes1105@gmail.com' }.to_json)
#end     

#def send_sms
#  account_sid = 'AC2207f8b402fecd9da89613413da039d7'
#  auth_token = '787438af250e8ccf595a0deee1a22592'
#  client = Twilio::REST::Client.new(account_sid, auth_token)
#  client.messages.create(
#    from: '+13158403566', # Your Twilio number
#    to: '+5511992222442', # Your mobile phone number
#    body: 'Automação Bradesco Saúde: temos problemas!'
#  )
#end

at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'logs/report.json'
    config.report_path = 'logs/report'
    config.report_types = [:html]
    config.report_title = 'Bradesco Saude'
    config.color = 'indigo'
    config.additional_info = { browser: 'chrome', environment: ENV['TEST_ENV'] }
  end
  ReportBuilder.build_report
end
