def verify_project_page(project_name)
  current_path.should == project_path(Project.find_by_name!(project_name))
  page.should have_content(project_name + " - Projects - Ticketee")
end



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
  verify_project_page('TextMate 2')
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

Given /^there is an existing project$/ do
  Factory(:project, :name => 'TextMate 2')
end

Then /^I should see the existing project listed$/ do
  page.should have_content("TextMate 2")
end

When /^I select the existing project$/ do
  click_link('TextMate 2')
end

Then /^I should go to the existing project's page$/ do
  verify_project_page('TextMate 2')
end

Given /^I am on the existing project's page$/ do
  visit(project_path(Project.find_by_name!('TextMate 2')))
end

When /^I go to the project's edit page$/ do
  click_link('Edit Project')
end

When /^I update the project information$/ do
  fill_in('Name', :with => 'TextMate 2 beta')
  click_button('Update Project')
end

Then /^I should get an update verification message$/ do
  page.should have_content("Project has been updated.") 
end

Then /^I should be on the updated project's page$/ do
  verify_project_page('TextMate 2 beta') 
end

When /^I update the project with invalid information$/ do
  fill_in('Name', :with => '')
  click_button('Update Project')
end

Then /^I should be told that the project has not been updated$/ do
  page.should have_content("Project has not been updated.")
end

When /^I delete the project$/ do
  click_link('Delete Project')
end

Then /^I should see the project deletion message$/ do
  page.should have_content("Project has been deleted.")
end

Then /^the project should no longer be in the project listing$/ do
  current_path.should == projects_path
  page.should_not have_content("TextMate 2") 
end

