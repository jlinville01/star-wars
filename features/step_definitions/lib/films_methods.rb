def films
  payload = {
    query:
      'query {
        allFilms {
          films {
            id
            title
            episodeID
            releaseDate
          }
        }
      }'
  }
  res = RestClient.post(BASE_HOST, payload, nil)
  expect(res.code).to eql(200)
  parsed_res = JSON.parse(res, symbolize_names: true)
  @films = parsed_res[:data][:allFilms][:films]
end

def film(id, film_id)
  payload = {
    query:
      "query {
        film(id: \"#{id}\", filmID: #{film_id}) {
          title
          episodeID
        }
      }"
  }
  res = RestClient.post(BASE_HOST, payload, nil)
  expect(res.code).to eql(200)
  parsed_res = JSON.parse(res, symbolize_names: true)
  @film = parsed_res[:data][:film]
end

def films_after_date(films, cutoff_date)
  @cutoff_films = []
  films.each do |film|
    @cutoff_films.push(film) if film[:releaseDate] > cutoff_date
  end
end