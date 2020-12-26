class CreateEnterprises < ActiveRecord::Migration[6.0]
  def change
    create_table :enterprises do |t|
      t.string :description
      t.string :primary_color
      t.string :secondary_color
      t.string :document_number
      t.string :company_name
      t.string :fantasy_name
      t.string :email
      t.date :opening_date

      t.timestamps
    end
    add_index :enterprises, :document_number, unique: true
  end
end
