json.tweets @tweets do |tweet|
  json.exrtract tweet, :id, :message
  json.user tweet.user.full_name
  json.user_email tweet.user.email
end