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
