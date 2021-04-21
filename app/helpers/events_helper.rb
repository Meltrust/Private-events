module EventsHelper
  def creator(user_id)
    @creator = User.find_by(id: user_id).name
  end

  def attendees_list
    list = " "
    @event.attendees.each do |attendee|
      list = list + attendee.name + ", "
    end
    list
  end

  def enroll_button
    if logged_in? && (@event.date >= Date.today)
      return (button_to "Enroll", enrollment_path(event_id: @event.id, user_id: current_user.id), method: :post)
    end
  end

  def enroll_upcoming_events(event)
    logged_in? ? (button_to "Enroll", enrollment_path(event_id: event.id, user_id: current_user.id), method: :post) : ""
  end

  def new_event
    logged_in? ? (link_to 'New Event', new_event_path) : (link_to 'New Event', login_path)
  end

  def my_events_link
    link_to 'My Events', user_path(@current_user.id)
  end

  def logout_link
    (link_to 'Logout', logout_path) if logged_in?
  end 
  
  def new_user_link
    (link_to 'New User', new_user_path) unless logged_in?
  end

  def login_link
    (link_to 'Login', login_path) unless logged_in? 
  end

  def events_all
    link_to 'Back to Events', root_path
  end
end
