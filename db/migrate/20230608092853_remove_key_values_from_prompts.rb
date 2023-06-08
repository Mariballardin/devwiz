class RemoveKeyValuesFromPrompts < ActiveRecord::Migration[7.0]
  def change
    remove_column :prompts, :key_values
  end
end
