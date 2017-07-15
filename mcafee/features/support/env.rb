require "rubygems"
require "watir-webdriver"
require "rspec"
require "rspec/expectations"
require "selenium-webdriver"
require "watir-webdriver/wait"
require 'Capybara'
require "capybara/cucumber"
require 'win32ole'
require 'yaml'


begin
  if ENV['Browser'] == 'firefox'
    Capybara.register_driver :selenium_firefox do |app|
      Capybara::Selenium::Driver.new(app, :browser => :firefox)
    end
    Capybara.default_driver         = :selenium_firefox
    Capybara.javascript_driver      = :selenium_firefox
    Capybara.run_server             = false
    Capybara.default_selector       = :css
    Capybara.default_max_wait_time = 30
  elsif ENV['Browser'] == 'ie'
    Capybara.register_driver :ie do |app|
      Capybara::Selenium::Driver.new(app, :browser => :ie)
    end
    Capybara.default_driver = :ie
    Capybara.default_max_wait_time = 90
  else
    Capybara.register_driver :chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome, :switches => %w[ --disable-extensions ])
    end
    Capybara.default_driver = :chrome
    Capybara.default_max_wait_time = 45
  end
end


def get_url
  if ENV['UserRole'].include? 'Sit'
    Capybara.default_max_wait_time = 90
    Capybara.app_host = "https://test.salesforce.com/"

  elsif ENV['UserRole'].include? 'Prod'
    Capybara.default_max_wait_time = 90
    Capybara.app_host = "https://login.salesforce.com/"

  else
    raise "Failed to match the #{ENV['UserRole']} name"
  end
end


#before hook to maximize a window
Before do
  page.driver.browser.manage.window.maximize
end
