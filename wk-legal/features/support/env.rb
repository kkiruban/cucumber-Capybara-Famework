require "rubygems"
require "rspec"
require 'Capybara'
require "capybara/cucumber"
require 'yaml'
require 'writeexcel'

Capybara.register_driver :chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome,:switches => %w[ --disable-extensions ])
end

Capybara.default_driver = :chrome
Capybara.default_wait_time =30


ENV['TEST_ENV'] ||= 'staging'
project_root = File.expand_path('../..', __FILE__)
$BASE_URL = YAML.load_file(project_root + "/support/test_data/cucumber.yml")[ENV['TEST_ENV']][:url]


Before do
  page.driver.browser.manage.window.maximize
end

at_exit do
  page.quit
end