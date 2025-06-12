class EventsController < ApplicationController
  before_action :authorize_user!, except: [ :index, :show ]
  def index
    @events=Event.all
  end
  def new
    @event=current_user.created_events.build
  end
  def create
    @event=current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @event=Event.find(params[:id])
  end

  def edit
    @event=Event.find(params[:id])
  end
  def update
    @event=Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Event.destroy(params[:id])
    redirect_to events_path
  end

  def invite
    @event=Event.find(params[:id])
  end
  def invite
    @event=Event.find(params[:id])
  end
  def inviteUser
    @event=Event.find(params[:id])
    user=User.where(email: params[:email]).take
    user.attended_events.push(@event)
    redirect_to events_path
  end

  private
  def event_params
    params.expect(event: [ :location, :date ])
  end

  def authorize_user!
    @event=Event.find(params[:id])
    redirect_to root_path, alert: "Not authorized" unless @event.creator == current_user
  end
end
