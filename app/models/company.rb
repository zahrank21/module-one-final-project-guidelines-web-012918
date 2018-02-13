class Company < ActiveRecord::Base
  has_many :jobs
  has_many :locations, through: :jobs


  def self.create_table
    Adapter.api_call.each do |job_hash|
      if Company.find_by(name: job_hash["company"]) == nil
        Company.create(name: job_hash["company"])
      end
    end
  end

end
