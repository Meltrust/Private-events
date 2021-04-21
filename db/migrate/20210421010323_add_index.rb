class AddIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :users, [:id, :created_at]
    add_index :enrollments, [:event_id, :user_id]
    add_index :events, [:user_id, :created_at]
  end
end
