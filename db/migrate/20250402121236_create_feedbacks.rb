class CreateFeedbacks < ActiveRecord::Migration[8.0]
  def change
    create_table :feedbacks do |t|
      t.references :user, foreign_key: true, null: true
      t.string :name
      t.text :content, null: false
      t.date :feedback_date, null: false

      t.timestamps
    end
  end
end
