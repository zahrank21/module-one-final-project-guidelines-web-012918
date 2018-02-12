class Adapter

  def self.api_call
    api = RestClient.get('https://jobs.github.com/positions.json')
    job_array = JSON.parse(api)
    binding.pry
  end



  # def self.get_title(param)
  #   arr = []
  #   param.each do |job_hash|
  #     job_hash.each do |category, description|
  #       if category == 'title'
  #
  #       end
  #     end
  #
  # end
  # def get_character_movies_from_api(character)
  #   url = 'http://www.swapi.co/api/people/'
  #   correct_results = nil
  #
  #   until correct_results
  #     all_characters = RestClient.get(url)
  #     character_hash = JSON.parse(all_characters)
  #     page_results_arr = character_hash["results"]
  #     page_results_arr.each do |result|
  #       if result["name"].downcase == character
  #         return result["films"]
  #       end
  #     end
  #     url = character_hash["next"]
  #   end
  # end



end
