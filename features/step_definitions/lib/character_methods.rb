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

def character(character_name)
  payload = {

  }
end