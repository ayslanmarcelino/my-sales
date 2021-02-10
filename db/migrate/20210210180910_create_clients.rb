class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :nickname
      t.string :document_number, null: false
      t.string :email
      t.string :phone_number
      t.string :telephone_number
      t.references :enterprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
