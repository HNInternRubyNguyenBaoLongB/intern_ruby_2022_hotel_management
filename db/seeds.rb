User.create!(name: "User",
  email: "user@gmail.com",
  phone: "0974626374",
  password: "123456",
  password_confirmation: "123456",
  role: 0)

User.create!(name: "User1",
  email: "user1@gmail.com",
  phone: "0974626374",
  password: "123456",
  password_confirmation: "123456",
  role: 0)

User.create!(name: "User2",
  email: "user2@gmail.com",
  phone: "0974626374",
  password: "123456",
  password_confirmation: "123456",
  role: 0)

User.create!(name: "Admin",
  email: "admin@gmail.com",
  phone: "0974626374",
  password: "123456",
  password_confirmation: "123456",
  role: 1)

Bill.create!(
  total_price: 3000000,
  user_id: 2,
  status: 0
)

Booking.create!(
  total_price: 1000000,
  start_date: "2022-08-20",
  end_date: "2022-08-21",
  status: 0,
  user_id: 2,
  room_id: 1,
  bill_id: 1
)

Booking.create!(
  total_price: 2000000,
  start_date: "2022-08-24",
  end_date: "2022-08-26",
  status: 0,
  user_id: 2,
  room_id: 1,
  bill_id: 1
)
