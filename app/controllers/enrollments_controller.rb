class EnrollmentsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    if (Enrollment.where(event_id: event.id, user_id: params[:user_id]).count)?
      flash[:notice] = 'Already Enrolled For this Event!'
      redirect_to event_path(event)
    else
      enrollment = Enrollment.new(event_id: event.id, user_id: params[:user_id])
      if enrollment.save
        flash[:notice] = 'Enrolled Successfully!'
        redirect_to events_path(event_id: event.id)
      else
        flash[:notice] = 'Ooops! Something went wrong...'
        redirect_to event_path(event)
      end
    end
  end
end
