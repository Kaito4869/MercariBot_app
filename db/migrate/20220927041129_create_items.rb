class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :university_name
      t.string :faculty
      t.string :department
      t.string :grade
      t.integer :condition
      t.string :name
      t.text :explain
      t.integer :price
      t.timestamps
    end
  end
end
