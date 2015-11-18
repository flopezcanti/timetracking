class ProjectsController < ApplicationController
	
	def index	
		@projects = Project.order(created_at: :desc).limit(10)

		if @projects.empty?
			render template: 'no_projects_found' #podría ser 'admin/no_projects_found'
		end
		#@total_hours = @projects.total_hours_in_month(Date.current.month, Date.current.year)
  end

  def show
    @project = Project.find_by(id: params[:id]) || render_404(params)
  end
end