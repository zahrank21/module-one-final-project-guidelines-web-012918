class CreateJobsTable < ActiveRecord::Migration

  def change
    create_table :jobs do |j|
      j.integer :location_id
      j.integer :company_id
    end

  end

end
