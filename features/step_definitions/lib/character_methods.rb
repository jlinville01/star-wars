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

def character(id, character_id)
  payload = {
    query:
      "query {
        person(id: \"#{id}\", personID: #{character_id}) {
          name
        }
      }"
  }
  res = RestClient.post(BASE_HOST, payload, nil)
  expect(res.code).to eql(200)
  @character = JSON.parse(res, symbolize_names: true)
end