class InsertApplyColumnIntoJobs < ActiveRecord::Migration[4.2]

  def change
    add_column :jobs, :how_to_apply, :string
  end
end
