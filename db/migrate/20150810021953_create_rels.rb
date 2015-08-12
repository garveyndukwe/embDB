class CreateRels < ActiveRecord::Migration
  def change
    create_table :rels do |t|

      t.timestamps null: false
    end
  end
end
