class CreateTasksLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks_labels do |t|
      t.references :label, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

    end
  end
end
