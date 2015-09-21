class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :tree_code
      t.decimal :girth
      t.decimal :height
      t.integer :year_taken

      t.references :tree, index: true

      t.timestamps null: false
    end
  end
end
