puts "Cleaning database..."
Family.destroy_all
User.destroy_all

puts "Creating users..."

first_user = User.create!({ first_name: "Greg",
                            last_name: "Ramos",
                            email: "first@gmail.com",
                            password: "azerty" })

puts "Created #{first_user.email}!"

puts "Creating families..."

family_one = Family.create!({  owner: first_user,
                               name: "#{first_user.last_name} Family" })

puts "Created #{family_one.name}!"

UserFamily.create!(role: 'parent', family: family_one, user: first_user)
