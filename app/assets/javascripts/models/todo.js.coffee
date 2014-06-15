# for more details see: http://emberjs.com/guides/models/defining-models/

TodoEmberRails.Todo = DS.Model.extend
  title: DS.attr 'string'
  is_completed: DS.attr 'boolean'
