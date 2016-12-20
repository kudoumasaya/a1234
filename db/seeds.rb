# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

require 'csv'

def csv_import(csv_name)
	path = Rails.root.join("db/seeds", Rails.env,csv_name + ".csv")
	if File.exist?(path)
		puts "Creating #{csv_name}..."

		#require path

		#WindowsのMicrosoft Excelの出力したCSVファイルを想定
		CSV.foreach(path, { encoding: "cp932:utf-8", row_sep: "\r", headers: true }) do |row|
      (csv_name.classify.constantize).new(row.to_hash).save
		end
	end
end
csv_import('data')
