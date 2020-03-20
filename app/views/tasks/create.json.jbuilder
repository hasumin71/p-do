json.user_name @task.user.name
json.created_at @task.created_at.strftime("%Y/%m/%d/%H:%M")
json.content @task.content
json.id @task.id