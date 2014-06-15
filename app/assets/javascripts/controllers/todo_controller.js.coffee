TodoEmberRails.TodoController = Ember.ObjectController.extend
  isEditing: false,
  is_completed: ((key, value)-> 
    # alert('ddd');
    model = @get("model")
    if value is `undefined`
      model.get "is_completed"
    else
      model.set "is_completed", value
      model.save()
      value
  ).property("model.is_completed")

  actions:
    removeTodo: ->
      todo = @get('model')
      todo.deleteRecord()
      todo.save()
    editTodo: ->
      @set('isEditing', true)
      # alert('ddd');
    acceptChanges: ->
        @set('isEditing', false);
        # alert(@get('model.title'))
        if (Ember.isEmpty(@get('model.title'))) 
          @send('removeTodo');
        else
          @get('model').save();
