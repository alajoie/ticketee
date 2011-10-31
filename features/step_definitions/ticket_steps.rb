When /^I go to the ticket creation page$/ do
	click_link('New Ticket')
end

When /^I create a ticket$/ do
	fill_in("Title", :with => "Non-standards compliance")
	fill_in("Description", :with => "My pages are ugly!")
	click_button('Create Ticket')
end

Then /^I should see a ticket created confirmation message$/ do
	page.should have_content("Ticket has been created.")
end

When /^I try to create a ticket without valid attributes$/ do
	click_button('Create Ticket')
end

Then /^I should see a message informing me the ticket has not been created$/ do
	page.should have_content("Ticket has not been created.")
end

Then /^I should see messages informing me of the invalidly entered attributes$/ do
	page.should have_content("Title can't be blank")
	page.should have_content("Description can't be blank")
end

