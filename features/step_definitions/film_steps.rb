Given(/^a user queries all films$/) do
  films
end

Then(/^(.*) films should be returned$/) do |quantity|
  expect(@films.size).to eql(quantity.to_i)
end

Given(/^a user queries film ID (.*)$/) do |id|
  film(id)
end

Then(/^the film title should be Return of the Jedi$/) do |title|
  expect(@film[:title]).to eql(title)
end

Given(/^a user queries all films released after (.*)$/) do |cutoff_date|

end