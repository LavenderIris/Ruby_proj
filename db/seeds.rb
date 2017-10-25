require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 's1.csv'))
# puts csv_text

csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    t = User.new
    t.first_name = row['first_name']
    t.last_name = row['last_name']
    t.city = row['city']
    t.state = row['state']
    t.email = row['email']
    t.password = "password"
    t.save
end

puts "There are now #{User.count} rows in the users table"