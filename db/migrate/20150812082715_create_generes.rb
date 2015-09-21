class CreateGeneres < ActiveRecord::Migration
  def change
    create_table :generes do |t|
      t.string :code, default: "Natural"
      t.string :botanical_name, default: "Multiple Species"
      t.string :common_name, default: "Natural Forest"

      t.timestamps null: false
    end
  end
end
