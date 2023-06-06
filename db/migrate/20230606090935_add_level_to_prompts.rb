class AddLevelToPrompts < ActiveRecord::Migration[7.0]
  def change
    add_column :prompts, :level, :integer
  end
end
