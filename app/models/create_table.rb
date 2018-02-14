# class CreateTable < ActiveRecord::Migration[4.2]
#   def self.up
#     create_table :jobs do |j|
#       j.string :name
#       j.integer :location_id
#       j.integer :company_id
#       j.string :description
#     end
#
#     create_table :locations do |l|
#       l.string :name
#     end
#
#     create_table :companies do |c|
#       c.string :name
#     end
#   end
#
#   def self.down
#     drop_table :companies do |t|
#       t.string :name
#     end
#
#     drop_table :locations do |t|
#       t.string :name
#     end
#
#     drop_table :jobs do |t|
#       t.integer :location_id
#       t.integer :company_id
#       t.string :name
#       t.string :description
#     end
#   end
# end
