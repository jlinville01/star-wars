Given(/^a user query for all characters$/) do
  characters
end

Then(/^response for all characters should include (.*)$/) do |character_name|
  expect(@all_characters).to include(name: character_name)
end

Given(/^a user queries for character id (.*)$/) do |character_id|
  character(character_id)
end

Then(/^a user should get (.*) character returned$/) do |character_name|
  expect(@character[:name]).to eql(character_name)
end