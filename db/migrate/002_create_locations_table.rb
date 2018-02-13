class CreateLocationsTable < ActiveRecord::Migration[4.2]

  def change
    create_table :locations do |l|
      l.string :name
    end
  end

end
