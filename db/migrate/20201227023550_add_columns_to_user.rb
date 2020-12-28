class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :nickname, :string
    add_column :users, :document_number, :string, null: false
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :is_super_admin, :boolean, default: false
    add_column :users, :is_active, :boolean, default: false
    add_reference :users, :enterprise, null: false, foreign_key: true
    add_index :users, :document_number, unique: true
  end
end
