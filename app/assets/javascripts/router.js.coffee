# For more information see: http://emberjs.com/guides/routing/

TodoEmberRails.Router.map ()->
  @resource('todos', { path: '/' },->
    @route('active');
    @route('completed');
  )
  # @resource('posts')

TodoEmberRails.TodosRoute = Ember.Route.extend
  model: -> 
    @store.find('todo')

TodoEmberRails.TodosIndexRoute  = Ember.Route.extend
  model: ->
    @modelFor('todos');

TodoEmberRails.TodosActiveRoute = Ember.Route.extend
  model: -> 
    # @store.find('todo');
    @store.filter(('todo'), (todo)->
      !todo.get('is_completed')
    )
  renderTemplate: (controller)->
    @render("todos/index",
      controller: controller
      )
TodoEmberRails.TodosCompletedRoute = Ember.Route.extend
  model: ->
    @store.filter(('todo'),(todo)->
        todo.get('is_completed')
      )
  renderTemplate: (controller)->
    @render("todos/index",controller:controller)






















