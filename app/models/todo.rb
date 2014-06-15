class Todo < ActiveRecord::Base
  alias_attribute :is_completed, :isCompleted
end
