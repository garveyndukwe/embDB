class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :tree_code
      t.decimal :girth
      t.decimal :height
      t.date :taken_at

      t.references :tree, index: true

      t.timestamps null: false
    end
  end
end
