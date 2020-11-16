class CreateTaskKadais < ActiveRecord::Migration[5.2]
  def change
    create_table :task_kadais do |t|
      t.string :content
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
