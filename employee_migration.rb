require './db_setup.rb'

class EmployeeMigration < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.decimal :salary, precision: 2, scale: 7
      t.text :review_text
      t.boolean :review
      t.boolean :review_based_on_text
      t.references :department
    end
  end
end
