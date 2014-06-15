json.todo do
  json.extract! @todo, :id, :title, :created_at, :updated_at
  json.is_completed @todo.is_completed
end 