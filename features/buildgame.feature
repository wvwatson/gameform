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
	
  @draw
  Scenario: Make an annotation
    Given I create an annotation
	Then I should have a file named "annotation.gif"

  @draw
  Scenario: Make an label
    Given I create an label 
	Then I should have a file named "label.gif"

  @draw
  Scenario: Make a rectangle with four squares
    Given I create rectangle and place 2 intersecting lines on it
	Then I should have a file named "foursquares.gif"

  @draw
  Scenario: Make a game with annotations
    Given I create a game with annotations on it
	Then I should have a file named "annotatedgame.gif"
		
  Scenario: Add a player
    Given I have a player named "Sarah"
	And I have a player named "Larry"
    Then the number of players should be 2 
	
  Scenario: Add a tactic
    Given I have a tactic called "Go to the football game"
    And I have a tactic called "Go to the opera"
    Then the number of tactics should be 2