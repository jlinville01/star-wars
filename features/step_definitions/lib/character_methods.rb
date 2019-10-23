def characters
  payload = {
    query:
      "query {
        allPeople {
          people{
            name
          }
        }
      }"
  }
  parsed_res = parse_and_report('POST', BASE_HOST, payload, nil)
  @all_characters = parsed_res[:data][:allPeople][:people]
end

def character(character_id)
  payload = {
    query:
      "query($character_id: ID) {
        person(personID: $character_id) {
          name
        }
      }",
    variables: {
      character_id: character_id
    }
  }
  parsed_res = parse_and_report('POST', BASE_HOST, payload, nil)
  puts parsed_res.to_yaml
end