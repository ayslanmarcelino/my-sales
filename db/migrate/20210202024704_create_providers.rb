class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :fantasy_name
      t.string :company_name
      t.string :document_number
      t.string :email
      t.string :phone_number
      t.string :responsible
      t.string :telephone_number
      t.string :observation
      t.references :enterprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
