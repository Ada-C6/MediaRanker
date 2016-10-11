# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

  CSV.foreach ('seed_csvs/albums.csv') do |csv_obj|
    Album.create(title: csv_obj[1], artist: csv_obj[2], rank: csv_obj[3], synopsis: csv_obj[4])
  end

  # CSV.foreach ('seed_csvs/vendors.csv') do |csv_obj|
  #   Vendor.create(name: csv_obj[1], no_employees: csv_obj[2].to_i, market_id: csv_obj[3].to_i)
  # end
  #
  # CSV.foreach ('seed_csvs/products.csv') do |csv_obj|
  #   Product.create(name: csv_obj[1], vendor_id: csv_obj[2].to_i)
  # end
