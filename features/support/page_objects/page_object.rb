class PageObject
  attr_accessor :url, :expected_element, :browser, :config

  def initialize(browser, config)
    @browser = browser
    @config = config
    @url = @config['url']
    @sdurl = @config['superdrug']
    @retries = 0
  end

  def visit
    browser.goto url
    expected_element.wait_until(&:present?)
  end
end