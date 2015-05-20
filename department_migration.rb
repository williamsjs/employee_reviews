require './db_setup.rb'

class DepartmentMigration < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.decimal :salary, precision: 2, scale: 7
    end
  end
end
