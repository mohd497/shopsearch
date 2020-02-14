json.extract! interview_question, :id, :question, :answer, :interview_category_id, :created_at, :updated_at
json.url interview_question_url(interview_question, format: :json)
