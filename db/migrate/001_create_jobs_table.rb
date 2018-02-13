class CreateJobsTable < ActiveRecord::Migration[4.2]

  def change
    create_table :jobs do |j|
      j.integer :location_id
      j.integer :company_id
    end

  end

end
