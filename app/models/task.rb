class Task < ActiveRecord::Base
  belongs_to :system_example
  has_many :task_progresses, dependent: :destroy

  validates_presence_of :system_example_id
  validates_presence_of :name
end
