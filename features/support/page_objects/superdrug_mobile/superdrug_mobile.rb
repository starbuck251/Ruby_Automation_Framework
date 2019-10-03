require_relative '../page_object'
Dir[File.join(__dir__, '*.rb')].each { |file| require file }

module Superdrug_Mobile
  class HomePage < PageObject
    def initialize(browser, config)
      super
      @expected_element = hero_image
    end

    def hero_image
      @browser.div(class: 'hero-home')
    end
  end

  def home_page
    @home_page ||= HomePage.new(@browser, @config)
  end
end