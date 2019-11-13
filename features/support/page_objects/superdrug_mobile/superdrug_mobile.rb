require_relative '../page_object'
Dir[File.join(__dir__, '*.rb')].each { |file| require file }

module Superdrug_Mobile
  class HomePage < PageObject
    def initialize(browser, config)
      super
      @expected_element = hero_text
    end

    def hero_text
      browser.h1(text: 'sim-only deals')
    end
  end

  def home_page
    @home_page ||= HomePage.new(@browser, @config)
  end
end