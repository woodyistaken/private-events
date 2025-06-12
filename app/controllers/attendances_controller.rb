class AttendancesController < ApplicationController
  def create
    @attended_event=Event.find(params[:id])
    current_user.attended_events.push(@attended_event)
    if current_user.save
      redirect_to @attended_event
    else
      render @attended_event, status: :unprocessable_entity
    end
  end
  def destroy
    @attended_event=Event.find(params[:delete_id])
    current_user.attended_events.delete(@attended_event)
    redirect_to @attended_event
  end
end
