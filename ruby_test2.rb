require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

class RubyTest2 < Test::Unit::TestCase
  def setup
    @driver=Selenium::WebDriver.for :firefox
    @driver.get('http://localhost:8080')
    @driver.manage.window.maximize
    @driver.manage.timeouts.implicit_wait =5
    @driver.find_element(:id,"login-form-username").send_keys "baurzhan-zh"
    @driver.find_element(:id,"login-form-password").send_keys "smarot100"
    @driver.find_element(:xpath, "//*[@id='login']").click
  end

  def test_project
    @driver.find_element(:xpath,"//*[@id='browse_link']").click
    @driver.find_element(:id,"admin_main_proj_link_lnk").click
    sleep 5
  end
  def test_issue_search
    @driver.find_element(:id,"find_link").click
    @driver.find_element(:id,"issues_new_search_link_lnk").click
    sleep 5
  end
  def teardown
    @driver.find_element(:id,"header-details-user-fullname").click
    @driver.find_element(:id,"log_out").click
    sleep 1
    @driver.quit
  end
end