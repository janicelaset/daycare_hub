require 'csv'

desc "Import listings from csv file"
task :listings => [:environment] do

  file_path = "db/listings/"
  files = [
            "oregon.csv",
            "washington.csv"
          ]

  Listing.delete_all
  ActiveRecord::Base.connection.reset_pk_sequence!('listings')

  files.each do |file|
    CSV.foreach(file_path + file, :headers => true) do |row|
      Listing.create(
      :name => row[0],
      :street => row[1],
      :city => row[2],
      :state => row[3],
      :zip => row[4],
      :phone => row[5],
      :verified => row[6],
      :daycare_id => row[7]
      )
      sleep(1.0/5.0)
    end
  end

end
