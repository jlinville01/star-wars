Given(/^a user requests all films$/) do
	films
end

Then(/^(.*) films should be returned$/) do |quantity|
	expect(@films.size).to eql(quantity.to_i)
end

Given(/^a user requests film ID (.*)$/) do |id|
	film(id)
end

Then(/^the film title should be Return of the Jedi$/) do |title|
	expect(@film[:title]).to eql(title)
end
