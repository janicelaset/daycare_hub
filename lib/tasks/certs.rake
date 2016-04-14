require 'csv'

desc "Import certifications to database"
task :certs => [:environment] do

  file = "db/certs/certs.csv"
  image_path = "db/certs/images"

  CSV.foreach(file, :headers => true) do |row|
    Certification.find_or_create_by(
    :name => row[0],
    :link => row[1],
    :description => row[2],
    :verified => row[3],
    :state => row[4],
    )
    cert = Certification.last
    cert.image = File.open("#{Rails.root}/#{image_path}/#{row[5]}")
    cert.save
  end

end
