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
  @normalform.draw_rectangle
end

Then /^I should have a file named "([^"]*)"$/ do |arg1|
  output_path = File.dirname(__FILE__) + "/../../examples/" + arg1
  File.exists?(output_path).should == true
end

Given /^I create a line$/ do
  @normalform.draw_line
end

Given /^I create an annotation$/ do
  @normalform.draw_annotation
end

Given /^I create an label$/ do
  @normalform.draw_label
end


Given /^I create rectangle and place (\d+) intersecting lines on it$/ do |arg1|
  @normalform.draw_foursquare
end

Given /^I create a game with annotations on it$/ do
  # @normalform.some_method "26", first_x: 20, first_y: 10, second_x: 80, second_y: 50
  @normalform.draw_annotated_game
end
