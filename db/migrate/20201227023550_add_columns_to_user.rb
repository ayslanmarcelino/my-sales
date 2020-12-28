class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :document_number, :string
    add_column :users, :is_employee, :boolean
    add_column :users, :is_admin, :boolean
    add_column :users, :is_super_admin, :boolean
    add_column :users, :is_active, :boolean
    add_reference :users, :enterprise, foreign_key: true
  end
end
