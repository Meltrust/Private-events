class AddUserIdToEnrollment < ActiveRecord::Migration[6.1]
  def change
    add_column :enrollments, :user_id, :integer
  end
end
