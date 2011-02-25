Feature: Build a game
  In order to model human behavior
  As a wishful thinker
  I want to create a two-person game

  @draw
  Scenario: Make a box
    Given I create a rectangle
	Then I should have a file named "rectangle.gif"
	
  @draw
  Scenario: Make a line
    Given I create a line
	Then I should have a file named "line.gif"
	
  Scenario: Add a player
    Given I have a player named "Sarah"
	And I have a player named "Larry"
    Then the number of players should be 2 
	
  Scenario: Add a tactic
    Given I have a tactic called "Go to the football game"
    And I have a tactic called "Go to the opera"
    Then the number of tactics should be 2