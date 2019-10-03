Given('the user is on the login page') do
login_page.visit
end

When('the user submits valid login credentials') do
login_page.submit_login_credentials(@config['user_email'], @config['user_password'])
end

When('the user submits invalid login credentials') do
login_page.submit_login_credentials('fake@ggggggggggg.com', 'fakepassword')
end

Then('the account holder is taken to their dashboard page') do
  dashboard_page.dashboard_header.wait_until(&:present?)
end

Then('the user is taken back to login page with a validation error') do
  login_page.failed_login_validation_text.wait_until(&:present?)
end
