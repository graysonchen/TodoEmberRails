TodoEmberRails.TodosController = Ember.ArrayController.extend
  actions:
    createTodo: ->
      title = @get("newTitle")
      todo = @store.createRecord("todo",
        title: title
        isCompleted: false)
      todo.save()
      @set("newTitle","")
    clearCompleted: ->
      completed = @filterBy("is_completed",true)
      completed.invoke("deleteRecord")
      completed.invoke("save")
  allAreDone: ((key,value)->
    if value is `undefined`
      @get('length') && @everyProperty("is_completed",true)
    else
      @setEach('is_completed',value)
      @invoke('save')
      @value
  ).property("@each.is_completed")

  remaining: (->
    @filterBy("is_completed", false).get("length")
  ).property("@each.is_completed")
  inflection: (->
    remaining = @get('remaining')
    if remaining is 1 then 'item' else 'items'
    ).property("remaining")
  completed: (->
    @filterBy('is_completed',true).get('length')
    ).property("@each.is_completed")
  hasCompleted: (->
    @get('completed') > 0
    ).property('completed')