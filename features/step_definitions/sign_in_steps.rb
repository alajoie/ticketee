def create_user( address, password, confirmed)
  @user = User.create!(:email => address, :password => password)
  @user.confirm! if confirmed
end


Given /^I am a registered, unconfirmed user$/ do
  @user_address = "user@ticketee.com"
  create_user(@user_address, "password", false)
end

Given /^I am a registered and confirmed user$/ do
  @user_address = "user@ticketee.com"
  create_user(@user_address, "password", true)
end

Given /^I open the confirmation email$/ do
  open_email(@user_address, :with_subject => "Confirmation instructions")
end

Then /^the account confirmation message should be shown$/ do
  page.should have_content("Your account was successfully confirmed")
end

Then /^I should be signed in$/ do
  page.should have_content("Signed in as " + @user_address)
end

When /^I go to the sign in page$/ do
  click_link("Sign in")
end

When /^sign in via the form$/ do
  fill_in("Email", :with => @user_address)
  fill_in("Password", :with => "password")
  click_button("Sign in")
end

Then /^I should see a sign in success message$/ do
  page.should have_content("Signed in successfully.")
end

