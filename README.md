# Ruby_Automation_Framework
This is to demonstrate an automation framework using Watir/Ruby, Cucumber 


## How to run the tests

After cloning the repository to your computer. Inside a terminal window or within the IDE, run `bundle install`.

Once everything is installed, run the command `bundle exec cucumber`.

To run a specific test, for example the login test, run `bundle exec cucumber feature/login.feature

## Environment Configuration

The tests have been written so as to be able to run against different test environments. By default the tests run against production.

To run against a different environment, you will need to unencrypt the /features/support/config.yml file with git-crypt. You will need to have git-crypt installed on your machine and to have retrieved the git-crypt-key.

Then run `git-crypt unlock path/to/git_crypt_key` from a directory inside the repository. The config.yml file should then be unencrypted in your local repository.

Once this is done, simply pass the env argument with the cucumber command to select the environment you wish to run the tests against, for example `bundle exec cucumber env=uat`

You can see what environments configuration exists for in the features/support/config.yml file.

The additional parameters that will work following `bundle exec cucumber` are
`env=prod`, `headless=true`, `-t @<tagname>`

## Troubleshooting
 
 Upon running the tests, should this message appear ` session not created: This version of ChromeDriver only supports Chrome version xx (Selenium::WebDriver::Error::SessionNotCreatedError)
`
Chromedriver either needs installing or updating. 
Easy to do via homebrew: 
` brew cask upgrade chromedriver`
