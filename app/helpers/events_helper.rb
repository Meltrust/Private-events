module EventsHelper
  def creator(user_id)
    @creator = User.find_by(id: user_id).name
  end
end
