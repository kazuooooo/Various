class EventsController < ApplicationController
	before_action :authenticate

	def show
		@event = Event.find(params[:id])
	end
	
	def new
		@event = current_user.created_events.build
	end

	def create
		@event = current_user.created_events.build(event_params)
		Rails.logger.debug @event_params.inspect
		logger.debug @event.errors.full_messages
		if @event.save
			redirect_to @event,notice: '作成しました'
		else
			render :new
		end
	end

	private 

	def event_params
		params.require(:event).permit(:name,:place,:start_time,:end_time,:content)
	end
end
