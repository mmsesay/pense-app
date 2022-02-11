class CreateEntites < ActiveRecord::Migration[7.0]
  def change
    create_table :entites do |t|
      t.string :name
      t.decimal :amount
      t.references :group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
