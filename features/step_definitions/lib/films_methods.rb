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

def film(id)
  payload = {
    query: 'query ($film_id: ID) {
      film(filmID: $film_id) {
        title
      }
    }',
    variables: {
      film_id: id.to_i
    }
  }
  res = RestClient.post(BASE_HOST, payload, nil)
  expect(res.code).to eql(200)
  @film = JSON.parse(res, symbolize_names: true)
  puts @film
end

def films_after_date(films, cutoff_date)
  @cutoff_films = []
  films.each do |film|
    if film[:releaseDate] > cutoff_date
      @cutoff_films.push(film)
    end
  end
end