class Location < ActiveRecord::Base
  has_many :jobs
  has_many :companies, through: :jobs

  def self.create_table
    Adapter.api_call.each do |job_hash|
      Location.create(location: job_hash["location"])
    end
  end

end
