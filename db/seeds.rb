require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 's1.csv'))
# # puts csv_text

# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#     t = User.new
#     t.first_name = row['first_name']
#     t.last_name = row['last_name']
#     t.city = row['city']
#     t.state = row['state']
#     t.email = row['email']
#     t.password = "password"
#     t.save
# end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'samplebands.csv'))
# puts csv_text

csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    b = Band.new
    b.name = row['name']
    b.similar = row['similar']
    b.save
end


csv_text = File.read(Rails.root.join('lib', 'seeds', 'concerts.csv'))
# puts csv_text

csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    c = Concert.new
    c.date = row['date']
    c.venue = row['venue']
    c.city = row['city']
    c.state = row['state']
    c.band_id = row['band_id']
    c.user_id = row['user_id']
    c.save
end