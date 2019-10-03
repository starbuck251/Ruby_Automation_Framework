module Superdrug_Mobile
  class DashboardPage < PageObject
    def initialize(browser, config)
      super
      @url += '/dashboard'
      @expected_element = dashboard_header
    end

    def dashboard_header
      browser.h1(visible_text: /DASHBOARD/)
    end

  end

  def dashboard_page
    @dashboard_page ||= DashboardPage.new(@browser, @config)
  end
end