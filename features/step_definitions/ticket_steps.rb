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

When /^I try to create a ticket with a too short description$/ do
  fill_in("Title", :with => "Non-standards compliance")
  fill_in("Description", :with => "it sucks")
  click_button('Create Ticket')
end

Then /^I should see a message informing me that the Description is too short$/ do
  page.should have_content("Description is too short")
end

Given /^there are a couple existing projects$/ do
  @project1 = Factory(:project, :name => 'TextMate 2')
  @project2 = Factory(:project, :name => 'Internet Explorer')
end

Given /^each project has some tickets$/ do
  @project1.tickets.create!(:title => "Make it shiny!", :description => "Gradients! Starbursts! Oh my!")
  @project2.tickets.create!(:title => "Standards compliance", :description => "Isn't a Joke")
end

When /^I go to the page of an existing project$/ do
  visit(project_path(@project1))
end

Then /^I should see the tickets for that project$/ do
  page.should have_content(@project1.tickets[0].title)
end

Then /^I should not see tickets for other existing projects$/ do
  page.should_not have_content("Standards compliance")
end

When /^I select a ticket$/ do

  click_link(@project1.tickets[0].title)
end

Then /^I should be on the ticket's page$/ do
  current_path.should == project_ticket_path(@project1, @project1.tickets[0])
end

Then /^the ticket title should be in a second level header font$/ do
  find("#ticket").find("h2").should have_content(@project1.tickets[0].title)
end

Then /^I should see the ticket description$/ do
  page.should have_content(@project1.tickets[0].description)
end

Given /^I am on the page of an existing ticket$/ do
  visit(project_ticket_path(@project1, @project1.tickets[0]))
end

Given /^I select the link to the homepage$/ do
  click_link("Ticketee")
end

Then /^I should be returned to the homepage$/ do
  current_path.should == root_path
end

