@characters
Feature: Star Wars Characters

  @specific_character
  Scenario: A user searches for Luke Skywalker
    Given I query for character Luke Skywalker
    Then I should get Luke Skywalker characte returned