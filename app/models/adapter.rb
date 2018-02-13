class Adapter
  def self.api_call
    #grab array of hash info from one page
    page = 0
    url = "https://jobs.github.com/positions.json?page=#{page}"
    # job_array = grab_from_one_page(url)
    api = RestClient.get(url)
    job_array = JSON.parse(api)
    #grab from others and then concat arrays
    extra_job_array = [1,1]
    while extra_job_array.any?
      page += 1
      url = "https://jobs.github.com/positions.json?page=#{page}"
      #extra_job_array = grab_from_one_page(url)
      api = RestClient.get(url)
      extra_job_array = JSON.parse(api)
      job_array.concat(extra_job_array)
    end
    job_array
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
