class CreatePrompts < ActiveRecord::Migration[7.0]
  def change
    create_table :prompts do |t|
      t.text :received_challenge
      t.string :programming_language
      t.string :job_title
      t.string :job_field
      t.text :key_values
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
