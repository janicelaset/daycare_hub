require 'csv'

desc "Import certifications to database"
task :certs => [:environment] do

  file = "db/certs/certs.csv"

  CSV.foreach(file, :headers => true) do |row|
    Certification.create(
    :name => row[0],
    :link => row[1],
    :description => row[2],
    :verified => row[3],
    :state => row[4]
    # :image => row[5]
    )
  end

end
