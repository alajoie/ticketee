Given /^a registered user$/ do
  @user_address = "user@ticketee.com"
  @user = User.create!(:email => @user_address, :password => "password")
end

Given /^the registered user opens the confirmation email$/ do
  open_email(@user_address, :with_subject => "Confirmation instructions")
end

Then /^a the account confirmation message should be shown$/ do
  page.should have_content("Your account was successfully confirmed")
end

Then /^the registered user should be signed in$/ do
  page.should have_content("Signed in as " + @user_address)
end

