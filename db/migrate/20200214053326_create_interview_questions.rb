class CreateInterviewQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :interview_questions do |t|
      t.string :question
      t.text :answer
      t.references :interview_category, foreign_key: true

      t.timestamps
    end
  end
end
