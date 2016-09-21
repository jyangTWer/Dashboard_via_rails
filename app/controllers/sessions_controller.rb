class SessionsController < ApplicationController
	def index
		@sessions = Session.all
	end

	def show
		@session = Session.find(params[:id])
	end

	def new
		@session = Session.new
	end

	def edit
		@session = Session.find(params[:id])
	end

	def create
		@session = Session.new(session_params)
		if @session.save
			redirect_to @session
		else
			render 'new'
		end
	end
	
	private
		def session_params
			params.require(:session).permit(:title, :text)
		end
end
