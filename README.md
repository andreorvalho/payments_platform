The project is using 2 engines:

1. Customer Data: Encapsulates all customer data and has a facade to access it.

2. Payment Gateway: Encapsulates the payment requests API

We are using rspec and factory bot to test the application.

bundle exec rails customer_data:install:migrations TO="customer_data_migrate"
bundle exec rails payment_gateway:install:migrations TO="payment_gateway_migrate"

http://localhost:3000/payment_gateway/payment_requests

curl -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2Nzg4MDk5Njl9.PNS5y17CfsPmG8O5W8huOW1D-R6SxyecKZGr-u2ETnM" http://127.0.0.1:3000/payment_gateway/payment_requests
