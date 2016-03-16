require 'csv'

desc "Import listings from csv file"
task :listings => [:environment] do

  file = "db/listings.csv"

  Listing.delete_all
  ActiveRecord::Base.connection.execute("TRUNCATE listings")

  CSV.foreach(file, :headers => true) do |row|
    Listing.create(
      :name => row[0],
      :address => row[1],
      :city => row[2],
      :state => row[3],
      :zip => row[4],
      :phone => row[5],
      :verified => row[6],
      :daycare_id => row[7]
    )
  end

end
