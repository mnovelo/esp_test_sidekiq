class CreateKinRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :kin_relations do |t|
      t.references :parent, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
