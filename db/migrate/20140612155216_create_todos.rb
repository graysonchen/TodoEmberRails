class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :isCompleted

      t.timestamps
    end
    arr = [
          {title: "Learn Ember.js",isCompleted: true},
          {title: "...",isCompleted: false},
          {title: "Profit!",isCompleted: false }
         ]
    arr.each do |data|
      Todo.create(data)
    end
    
  end
end
