class Company

  attr_accessor :name, :location

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def find_jobs_with_company
    Job.all.select do |job|
      job.company == self
    end
  end
end
