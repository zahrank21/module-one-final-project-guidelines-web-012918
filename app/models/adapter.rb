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



end
