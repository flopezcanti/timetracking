class EntriesController < ApplicationController
	def index
		@project = Project.find_by(id: params[:project_id])
		date = Date.current
		@entries = @project.entries.where(date: date.beginning_of_month..date.end_of_month)
		@hours = @project.total_hours_in_month(date.month, date.year)	
	end

	def new
		@project = Project.find(params[:project_id])
		@entry = @project.entries.new
	end

	def create
		#find the project using params[:project_id]
		@project = Project.find(params[:project_id])

		#create the entry project using params[:entry]
		@entry = @project.entries.new entry_params
		#entry.save

		if @entry.save
			redirect_to action: 'index', controller:
			'entries', project_id: @project.id
		else
			render 'new'
		end
	end

	private

		def entry_params
			params.require(:entry).permit(:hours, :minutes, :date)
		end
end
