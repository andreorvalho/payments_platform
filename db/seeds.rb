User.create(user_name: 'orvalho', email: 'orvalho@gmail.com', password_digest: BCrypt::Password.create("12344324fs")  )
c = CustomerData::Customer.create(name: 'Andre', place_of_birth: "Portugal", date_of_birth:  Time.now - 36.years)
PaymentGateway::PaymentRequest.create(customer_id: c.id, amount: 200, timestamp: Time.now - 2.days)
