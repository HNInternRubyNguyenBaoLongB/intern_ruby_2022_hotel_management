User.create!(name: "Admin",
  email: "admin@gmail.com",
  phone: "0974626374",
  password: "123456",
  password_confirmation: "123456",
  role: 1)

20.times do |n|
  name = "Example room #{n+1}"
  description = "A beauty full roommmmm"
  price = 60.5
  status = n % 2
  rate_avg = n % 5
  image = File.open("app/assets/images/bg-masthead.jpg")
  room = Room.create(name: name,
                description: description,
                price: price,
                rate_avg: rate_avg,
                status: status
)
  room.images.attach(io: image, filename: "tour-4.jpg")
  room.save
end
