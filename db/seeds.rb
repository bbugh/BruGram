# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Photo.delete_all

photos = Photo.create!([
  { image: File.new("#{Rails.root}/app/assets/images/edu.png"), caption: "true life #ix #educational #thebest"},
  { image: File.new("#{Rails.root}/app/assets/images/signalhill.png"), caption: "we cute #ix #signalhill #sunset" },
  { image: File.new("#{Rails.root}/app/assets/images/fitness.png"), caption: "mylife #pizza #missyoukev"},
  { image: File.new("#{Rails.root}/app/assets/images/surfs.png"), caption: "#tbt #legendary #ix #ta"},
])