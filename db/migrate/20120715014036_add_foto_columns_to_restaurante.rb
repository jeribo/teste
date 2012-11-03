class AddFotoColumnsToRestaurante < ActiveRecord::Migration
  def change
      add_column :restaurantes, :foto_file_name, :string
      add_column :restaurantes, :foto_content_type, :string
      add_column :restaurantes, :foto_file_size, :integer
      add_column :restaurantes, :foto_update_at, :datetime
  end
end
