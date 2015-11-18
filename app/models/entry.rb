class Entry < ActiveRecord::Base
	
	validates :date, :hours, :minutes, presence: true
	validates :minutes, :hours, numericality: true
	validates :project_id, presence: true

	belongs_to :project

end
