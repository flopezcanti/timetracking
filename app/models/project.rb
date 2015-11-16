class Project < ActiveRecord::Base
	def self.iron_find(params)
		where(params).first
	end

	def self.clean_older
		where('created_at < ?' , 1.week.ago).destroy_all
	end

	def self.last_created_projects(number)
		order('created_at DESC').limit(number)
	end

	def self.first_updated_project(number)
		order('updated_at DESC').limit(number)
	end
end
