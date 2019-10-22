@films
Feature: Star Wars Films

  @all_films
  Scenario: A user requests all films
    Given a user requests all films
    Then 6 films should be returned

  @specific_film
  Scenario: A user requests a specific film
    Given a user requests film ID 3
    Then the film title should be Return of the Jedi