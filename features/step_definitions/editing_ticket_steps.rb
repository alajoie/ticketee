def init_values
  @project_name = "TextMate 2"
  @orig_ticket_title = "Make it shiny!"
  @updated_ticket_title = "Make it really shiny!"
  @update_confirmation = "Ticket has been updated."
  @update_failed_message = "Ticket has not been updated."
end

Given /^an existing project with a ticket$/ do
  init_values
  @project_with_ticket = Factory(:project, :name =>  @project_name)
  @project_with_ticket.tickets.create!(:title => @orig_ticket_title, :description => "Gradients! Starbursts! Oh my!")
end

When /^I go to the ticket page$/ do
  visit(project_ticket_path(@project_with_ticket, @project_with_ticket.tickets[0])) 
end

When /^I go to the ticket's edit page$/ do
  click_link("Edit Ticket")
end

When /^I update the ticket's title$/ do
  fill_in("Title", :with => @updated_ticket_title)
  click_button("Update Ticket")
end

Then /^I should receive a confirmation of the ticket update$/ do
  page.should have_content(@update_confirmation)
end

Then /^I should see the new title within a second level header$/ do
  find("#ticket").find("h2").should have_content(@updated_ticket_title)
end

Then /^I should not see the old title$/ do
  page.should_not have_content(@orig_ticket_title)
end

When /^I update the ticket's title with invlaid data$/ do
  fill_in("Title", :with => "")
  click_button("Update Ticket")
end

Then /^I should see a notification that the ticket has not been updated$/ do
  page.should have_content(@update_failed_message)
end

