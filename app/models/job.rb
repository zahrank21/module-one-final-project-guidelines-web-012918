class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :location

  def self.insert_table
    Adapter.api_call.each do |job_hash|
      Job.create(name: job_hash["title"], company_id: Company.get_company_id(job_hash["company"]), location_id: Location.get_location_id(job_hash["location"]), description: job_hash["description"], how_to_apply: job_hash["how_to_apply"])
    end
  end

  # def self.get_company_id(company)
  #   me = Company.all.find do |company|
  #     company.name == company
  #   end
  #   binding.pry
  # end
  #
  # def self.get_location_id(location)
  #   me = Location.all.find do |location|
  #     location.name == location
  #   end
  #   binding.pry
  # end

end
