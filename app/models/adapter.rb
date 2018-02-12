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




end
