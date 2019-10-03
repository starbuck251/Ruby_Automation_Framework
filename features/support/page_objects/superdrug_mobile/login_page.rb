module Superdrug_Mobile
  class LoginPage < PageObject
    def initialize(browser, config)
      super
      @url += 'login'
      @expected_element = login_button
    end

    def email_field
      browser.text_field(id: 'email')
    end

    def password_field
      browser.text_field(id: 'password')
    end

    def login_button
      browser.button(text: 'Sign in')
    end

    def failed_login_validation_text
      browser.p(text: 'Uh-oh... Looks like your email or password is incorrect')
    end

    def other_error_text
      browser.p(text: 'Uh-oh... An error occurred! Please try again')
    end

    def submit_login_credentials(username, password)
      login_button.wait_until(&:present?)
      email_field.set username
      password_field.send_keys password
      login_button.click
    end
  end

  def login_page
    @login_page ||= LoginPage.new(@browser, @config)
  end
end