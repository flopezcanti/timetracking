class ProjectsController < ApplicationController
	
	def index	
		@projects = Project.order(created_at: :desc).limit(10)
  end

  def show
    @project = Project.find_by(id: params[:id])
    render_404(params)
  end

end