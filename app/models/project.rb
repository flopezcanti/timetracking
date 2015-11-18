class Project < ActiveRecord::Base

	validates :name, uniqueness: true
	validates :name, presence: true
	validates :name, length: {maximum: 30}
	validates :name, format: {with: /[a-zA-Z0-9]/}

	has_many :entries

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

	def total_hours_in_month(month, year)

		#Calculate which project entries have date >= 1st month and date <= last day of month
		date_start = Date.new(year,month, 1)
		date_end = Date.new(year,month, -1)
		month_entries = entries.where(date: date_start..date_end)

		total_minutes = month_entries.reduce(0) do |sum, entry|
			sum + entry.minutes + entry.hours * 60
		end

		total_hours = total_minutes / 60
		#total_hours = month_entries.sum(&:hours)
	end
end
