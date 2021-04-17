class AddEventIdToEnrollment < ActiveRecord::Migration[6.1]
  def change
    add_column :enrollments, :event_id, :integer
  end
end
