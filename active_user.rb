# Run with: rails runner active_user.rb

puts 'User Model: Change active of nil to true'
af = User.where(active: nil).update_all(active: true)
puts "#{af} rows affected"
