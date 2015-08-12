class CreateForests < ActiveRecord::Migration
  def change
    create_table :forests do |t|
      t.string :name
      t.text :description
      t.boolean :plantation, default: true
      t.string :specie
      t.date :established
      t.date :enumerated
      t.string :location, null: false
      t.string :gps
      t.float :area
      t.string :comment
      t.references :project, index: true

      t.timestamps null: false
    end
  end
end
