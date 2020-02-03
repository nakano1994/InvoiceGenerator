class CreateSheets < ActiveRecord::Migration[6.0]
  def change
    create_table :sheets do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
