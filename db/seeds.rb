require 'csv'

CSV.read('seed_csvs/movies.csv').each do |line|
  movie_hash = { name: line[0], director: line[1], description: line[2], ranking: line[3].to_i}
  Movie.create(movie_hash)
end

# CSV.read('seed_csvs/vendors.csv').each do |line|
#   vendor_hash = { ref_id: line[0].to_i, name: line[1], num_employees: line[2].to_i, market_id: line[3].to_i}
#   Vendor.create(vendor_hash)
# end
#
# CSV.read('seed_csvs/products.csv').each do |line|
#   product_hash = { ref_id: line[0].to_i, name: line[1], vendor_id: line[2].to_i}
#   Product.create(product_hash)
# end
#
# CSV.read('seed_csvs/sales.csv').each do |line|
#   sale_hash = { ref_id: line[0].to_i, amount: line[1].to_i, purchase_time: DateTime.parse(line[2]), vendor_id: line[3].to_i, product_id: line[4].to_i}
#   Sale.create(sale_hash)
# end
