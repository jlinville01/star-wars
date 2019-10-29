def characters
  payload = {
    query:
      'query {
        allPeople {
          people{
            name
          }
        }
      }'
  }
  res = RestClient.post(BASE_HOST, payload, nil)
  expect(res.code).to eql(200)
  parsed_res = JSON.parse(res, symbolize_names: true)
  @all_characters = parsed_res[:data][:allPeople][:people]
end

def character(character_id)
  payload = {
    query:
      'query ($character_id: ID) {
        person(personID: $character_id) {
          name
        }
      }',
    variables: { 
      character_id: character_id.to_i
    }
  }
  res = RestClient.post(BASE_HOST, payload, nil)
  expect(res.code).to eql(200)
  parsed_res = JSON.parse(res, symbolize_names: true)
  puts parsed_res.to_yaml
  @character = parsed_res[:data]
end