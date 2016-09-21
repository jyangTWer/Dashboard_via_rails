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

	def update
		@session = Session.find(params[:id])
		if @session.update(session_params)
			redirect_to @session
		else
			render 'edit'
		end
	end

	private
		def session_params
			params.require(:session).permit(:title, :text)
		end
end
