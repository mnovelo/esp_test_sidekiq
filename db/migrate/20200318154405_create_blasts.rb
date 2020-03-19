class CreateBlasts < ActiveRecord::Migration[6.0]
  def change
    create_table :blasts do |t|
      t.references :message, null: false, foreign_key: true
      t.jsonb :recipients
      t.timestamp :send_at
      t.integer :delivery_attempts, null: false, default: 0

      t.timestamps
    end
  end
end
