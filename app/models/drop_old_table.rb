class DropOldTables
  def self.change
    drop_table :companies do |t|
      t.string :name
    end

    drop_table :locations do |t|
      t.string :name
    end

    drop_table :jobs do |t|
      t.integer :location_id
      t.integer :company_id
      t.string :name
      t.string :description
    end
  end
end
