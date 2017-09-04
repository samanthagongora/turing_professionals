class CreateInterviewQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :interview_questions do |t|
      t.string :description
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
