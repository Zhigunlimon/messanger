class AddApiNameToDialect < ActiveRecord::Migration[5.0]
  def change
    add_column :dialects, :api_name, :string
  end
end
