json.extract! tweet, :id, :Title, :Content, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
