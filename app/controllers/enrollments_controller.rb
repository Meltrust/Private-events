class EnrollmentsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    if Enrollment.where(event_id: event.id, user_id: params[:user_id]).count.positive?
      flash[:notice] = 'Already Enrolled For this Event!'
      redirect_to event_path(event)
    else
      enrollment = Enrollment.new(event_id: event.id, user_id: params[:user_id])
      if enrollment.save
        flash[:notice] = 'Enrolled Successfully!'
        redirect_to event_path(event)

      end
    end
  end
end
