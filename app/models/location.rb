class Location < ActiveRecord::Base
<<<<<<< HEAD
  def test
    'hi'
  end
=======
  has_many :jobs
  has_many :companies, through: :jobs
>>>>>>> master
end
