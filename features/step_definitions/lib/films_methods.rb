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
  parsed_res = parse_and_report('POST', BASE_HOST, payload, nil)
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
  @film = parse_and_report('POST', BASE_HOST, payload, nil)
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