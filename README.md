The project is using 2 engines:

1. Customer Data: Encapsulates all customer data and has a facade to access it.

2. Payment Gateway: Encapsulates the payment requests API

We are using rspec and factory bot to test the application.

bundle exec rails customer_data:install:migrations TO="customer_data_migrate"
bundle exec rails payment_gateway:install:migrations TO="payment_gateway_migrate"

http://localhost:3000/payment_gateway/payment_requests
