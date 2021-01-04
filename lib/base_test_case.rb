# frozen-string-literal: true

# Uncomment this to grab ALL webdrivers instead of just chromedriver
# require 'webdrivers'
require 'webdrivers/chromedriver'
require 'selenium/webdriver'
require 'capybara/dsl'

# This is the base class for test cases.  Derive from it and write
# your tests in the #run method.  Put your test classes in the
# test/ directory off the project root.  Now shush, rubocop.
class BaseTestCase
  include Capybara::DSL

  attr_reader :description

  DRIVER = :selenium_chrome_headless
  # DRIVER = :selenium_chrome

  def initialize
    @description = 'Default test description'
    Capybara.current_driver = DRIVER
    Capybara.javascript_driver = DRIVER
    Capybara.app_host = 'https://reddit.com'
  end

  def run
    raise 'Called BaseTestCase#run, this is not useful.  You ' \
          'should add a #run to your derived class.'
  end
end
