json.todos  do 
  json.array!(@todos) do |todo|
    json.extract! todo, :id, :title
    json.is_completed todo.isCompleted
  end
end