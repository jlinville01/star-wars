Given(/^a user query for all characters$/) do
  characters
end

Then(/^response for all characters should include (.*)$/) do |character_name|
  expect(@all_characters).to include(name: character_name)
end

Given(/^a user queries for ID (.*) and Character ID(.*)$/) do |id, character_id|
  character(id, character_id)
end

Then(/^a user should get (.*) character returned$/) do |character_name|
  expect(@character[:data][:person][:name]).to eql(character_name)
end