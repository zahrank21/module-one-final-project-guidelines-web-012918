class Location < ActiveRecord::Base
  has_many :jobs
  has_many :companies, through: :jobs

  def self.insert_table
    Adapter.api_call.each do |job_hash|
      if Location.find_by(name: job_hash["location"]) == nil
        Location.create(name: job_hash["location"])
      end
    end
  end

  def self.get_location_id(location)
    me = all.find do |loca|
      loca.name == location
    end.id
  end

end
