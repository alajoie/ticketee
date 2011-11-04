When /^I go to the sign up page$/ do
	click_link("Sign up")
end

When /^I complete the sign up form$/ do
	fill_in("Email", :with => "user@ticketee.com")
	fill_in("Password", :with => "password")
	fill_in("Password confirmation", :with => "password")
	click_button("Sign up")
end

Then /^I should receive a sign up confirmation message$/ do
	page.should have_content("You have signed up successfully.")
end

