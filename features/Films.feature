@films
Feature: Star Wars Films

  @all_films
  Scenario: A user requests all films
    Given a user queries all films
    Then 6 films should be returned

  @specific_film
  Scenario: A user requests a specific film
    Given a user queries film ID 3
    Then the film title should be Return of the Jedi

  @films_released_after
  Scenario: A user requests films released after 1984
    Given a user queries all films released after 1984-01-01
    Then 3 films after date should be returned