class ProjectsController < ApplicationController
	def index 
		@projects = Project.first_updated_project(5)
	end
end
