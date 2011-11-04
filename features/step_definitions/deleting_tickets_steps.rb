When /^I delete the ticket$/ do
  click_link("Delete Ticket")
end

Then /^I should see a confirmation that the ticket has been deleted$/ do
  page.should have_content("Ticket has been deleted.")
end

Then /^I should be on the project's page$/ do
  verify_project_page(@project_name)
end

Then /^I should not see the ticket listed$/ do
  page.should_not have_content(@orig_ticket_title)
end

