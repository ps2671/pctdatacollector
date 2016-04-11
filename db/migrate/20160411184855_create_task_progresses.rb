class CreateTaskProgresses < ActiveRecord::Migration
  def change
    create_table :task_progresses do |t|
      t.references :task, index: true
      t.references :user, index: true
      t.boolean :done, :default => false

      t.timestamps
    end
  end
end
