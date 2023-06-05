class CreateCodeReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :code_reviews do |t|
      t.text :user_answer
      t.text :received_feedback
      t.references :prompt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
