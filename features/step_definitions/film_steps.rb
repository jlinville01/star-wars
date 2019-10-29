Given(/^a user queries all films$/) do
  films
end

Then(/^(.*) films should be returned$/) do |quantity|
  expect(@films.size).to eql(quantity.to_i)
end

Given(/^a user queries film by ID (.*) and film ID (.*)$/) do |id, film_id|
  film(id, film_id)
end

Then(/^the film title should be (.*)$/) do |title|
  expect(@film[:data][:film][:title]).to eql(title)
end

Given(/^a user queries all films released after (.*)$/) do |cutoff_date|
  films_after_date(films, cutoff_date)
end

Then(/^(.*) films after date should be returned$/) do |film_count|
  expect(@cutoff_films.size).to eql(film_count.to_i)
end