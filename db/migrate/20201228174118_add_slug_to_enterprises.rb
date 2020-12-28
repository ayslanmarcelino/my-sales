class AddSlugToEnterprises < ActiveRecord::Migration[6.0]
  def change
    add_column :enterprises, :slug, :string
    add_index :enterprises, :slug, unique: true
  end
end
