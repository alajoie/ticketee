Given /^I am on the homepage$/ do
  visit('/') 
end

When /^I navigate to the new project creation page$/ do 
  click_link('New Project')
end

When /^I create a new project$/ do 
  fill_in('Name', :with => 'TextMate 2')
  click_button('Create Project')  
end

Then /^I should be shown the project created verification$/ do
  page.should have_content("Project has been created.")
end

Then /^I should be on the project page for the new project$/ do
  current_path.should == project_path(Project.find_by_name!('TextMate 2'))
  page.should have_content("TextMate 2 - Projects - Ticketee")  
end

When /^I try to create a project without a name$/ do
  click_button('Create Project') 
end

Then /^I should be informed that the project has not been created$/ do
  page.should have_content("Project has not been created.")
end

Then /^I should be told that the name is required\.$/ do
  page.should have_content("Name can't be blank")
end
