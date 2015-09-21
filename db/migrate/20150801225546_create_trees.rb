class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :code
      t.integer :number
      t.integer :specie
      t.integer :status
      t.string :comment
      t.references :forest, index: true

      t.timestamps null: false
    end
  end
end
