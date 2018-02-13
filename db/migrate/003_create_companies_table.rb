class CreateCompaniesTable < ActiveRecord::Migration[4.2]

  def change
    create_table :companies do |c|
      c.string :name
    end
  end

end
