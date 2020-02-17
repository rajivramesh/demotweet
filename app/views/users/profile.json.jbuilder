json.followers @followers do |follower|
  json.exrtract follower, :id, :first_name, :last_name, :gender, :phone_number, :email
end

json.following @following do |following|
  json.exrtract follower, :id, :first_name, :last_name, :gender, :phone_number, :email
end