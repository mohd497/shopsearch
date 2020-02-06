json.extract! review, :id, :title, :description, :rating, :sfthouse_id, :created_at, :updated_at
json.url review_url(review, format: :json)
