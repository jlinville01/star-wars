def films
	payload = {
  	"query": 
  		"query {
  			allFilms {
  				films {
  					id
  					title
  					episodeID 
  				} 
  			} 
			}"
	}
	all_films = parse_and_report('POST', "https://swapi.apis.guru/graphiql", payload, nil)
	@films = all_films[:data][:allFilms][:films]
end

def film(id)
	title = "Attack of the Clones"
	payload = {
  	"query": 
  		"query ($title: String = \"Attack of the Clones\") {
  			allFilms {
  				films(title: $title) {
  					id
  					title
  					episodeID 
  				} 
  			}"
	}
	films = parse_and_report('POST', "https://swapi.apis.guru/graphiql", payload, nil)
	puts films
end
