class InsertDescriptionColumnIntoJobs < ActiveRecord::Migration[4.2]

  def change
    add_column :jobs, :description, :string
  end
end
