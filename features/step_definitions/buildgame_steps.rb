Given /^I have a player named "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the number of players should be (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I have a tactic called "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the number of tactics should be (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Before do
  @normalform = NormalForm.new
end
Given /^I want a game form$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I create a rectangle$/ do
  @normalform.draw_game
end

Then /^I should have a file named "([^"]*)"$/ do |arg1|
  output_path = File.dirname(__FILE__) + "/../../examples/" + arg1
  File.exists?(output_path).should == true
end