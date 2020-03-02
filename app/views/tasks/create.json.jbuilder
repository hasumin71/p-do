json.user_name @task.user.name
json.created_at @task.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.content @task.content
json.id @task.id