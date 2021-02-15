# frozen_string_literal: true

require 'pry'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'site_prism'
require 'rspec'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'webdrivers'
require_relative File.expand_path('../support/helpers.rb', __dir__)
require_relative File.expand_path('../common/base_screen.rb', __dir__)
require_relative File.expand_path('../common/modules/medico_module.rb', __dir__)
require 'faker'
require 'httparty'

World Capybara::DSL
World(Helpers)
World BaseScreen

Capybara.register_driver(:selenium_chrome_headless) do |app|
  chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--no-sandbox')
    options.add_argument('--window-size=1366x768')
    options.add_argument('--disable-site-isolation-trials')
    options.add_argument('--disable-dev-shm-usage')
    options.add_preference('profile.content_settings.exceptions.clipboard', { '*': { 'setting': 1 } })
  end
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: chrome_options
  )
end
Capybara.register_driver(:selenium_chrome) do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, args: ['--incognito'])
end

Capybara.configure do |config|
  case
    ENV['BROWSER']
  when 'chrome'
    driver = :selenium_chrome
  when 'chrome-headless'
    driver = :selenium_chrome_headless
  when 'firefox'
    driver = :selenium
  when 'firefox-headless'
    driver = :selenium_headless
  else
    raise 'Opção de profile para browser não informada ou incorreta. Profiles aceitos: chrome, chrome-headless, firefox, firefox-headless'
  end

  Capybara.default_driver = driver
  config.default_max_wait_time = 50
  Capybara.page.driver.browser.manage.window.maximize

  ENV['TEST_ENV'] ||= 'HML'
  project_root = File.expand_path('../..', __dir__)
  file = YAML.load_file(project_root + '/config/cucumber.yml')[ENV['TEST_ENV']]

  $BASE_URL = file[:url]
  $USER_DOCTOR = file[:medico_01]
  $USER_DOCTOR_ELEGIBILIDADE = file[:medico_elegibilidade]
  $USER_DOCTOR_2 = file[:medico_02]
  $USER_DOCTOR_3 = file[:medico_03]
  $USER_SECRETARY = file[:sec_01]
  $USER_SEC_ELEGIBILIDADE = file[:sec_02]
  $PASSWORD = file[:password]
  $NUMBER_CARTEIRINHA_VALIDA = file[:carteirinha_valida]
  $NUMBER_CARTEIRINHA_INVALIDA = file[:carteirinha_invalida]
end
