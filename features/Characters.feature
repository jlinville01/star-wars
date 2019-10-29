@characters
Feature: Star Wars Characters

  @all_characters
  Scenario: A user searches for all characters
    Given a user query for all characters
    Then response for all characters should include Luke Skywalker

  @specific_character
  Scenario: A user searches for Luke Skywalker
    Given a user queries for ID cGVvcGxlOjE= and Character ID 1
    Then a user should get Luke Skywalker character returned