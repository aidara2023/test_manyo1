class AddDeadLinePriorityStatusToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :deadline, :date
    add_column :tasks, :priority, :string
    add_column :tasks, :status, :string
  end
end
