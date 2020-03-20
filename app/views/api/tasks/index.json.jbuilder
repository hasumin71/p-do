json.array! @tasks do |task|
  json.content task.content
  json.created_at task.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.user_name task.user.name
  json.id task.id
end