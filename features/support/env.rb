require 'watir'
require_relative 'page_objects/superdrug_mobile/Superdrug_Mobile'
require 'pry'
require 'date'

World(Superdrug_Mobile)

Before do
  env = ENV['env'] ||= 'prod'
  @today_time = Time.now.strftime('%F_%H.%M.%S').to_s
  @config = YAML.load_file(File.expand_path(__dir__) + '/config.yml')[env]

  # Open the browser and run in headless mode if desired
  @headless = ENV['headless']
  if @headless == 'true'
    args = ['--window-size=1766,1768', '--disable-gpu']
    @browser ||= Watir::Browser.new :chrome, headless: true, options: { args: args }
  else
    @browser ||= Watir::Browser.new
  end

  # Clear the test environment authentication if required to do so
  @browser.goto home_page.url
  password_field = @browser.text_field(css: '#password')
  login_button = @browser.button(name: 'commit', value: 'Login')
  if password_field.exists? && login_button.exists?
    password_field.set @config['test_environment_password']
    login_button.click
  end

  home_page.visit
end

After do
  @browser.close
end