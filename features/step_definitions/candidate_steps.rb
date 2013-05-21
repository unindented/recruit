# Given

Given /^I am on the home page$/ do
  visit '/'
end

Given /^I have already signed up$/ do
  @candidate = FactoryGirl.create(:candidate)
end

# When

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |element, text|
  fill_in element, with: text
end

When /^I fill in "([^"]*)" with the same value as before$/ do |element|
  fill_in element, with: @candidate.send(element.underscore)
end

When /^I click "([^"]*)"$/ do |element|
  click_on element
end

# Then

Then /^I should see an? ([^ ]+) message$/ do |message|
  page.should have_selector "#messages .alert-#{message}"
end

Then /^I should see an? "([^"]*)" notice under "([^"]*)"$/ do |notice, element|
  page.should have_selector "form .candidate_#{element.underscore} .help-inline", text: notice
end

Then /^I should have (\d+) candidates?/ do |count|
  Candidate.count.should == count.to_i
end
