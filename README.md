The project is using 2 engines:

1. Customer Data: Encapsulates all customer data and has a facade to access it.

2. Payment Gateway: Encapsulates the payment requests API

We are using rspec and factory bot to test the application.

I used a custom rake task(lib/tasks/railties.rake) to be able to import my migrations from the engines to make sure we had separate databases for the information:

bundle exec rails customer_data:install:migrations TO="customer_data_migrate"
bundle exec rails payment_gateway:install:migrations TO="payment_gateway_migrate"

I also added authentication(in the simplest way possible) and authorization with JWT.

To use the application run:

Make sure you have the ruby version specified in .ruby-version or use rbenv for managment, then run on your terminal:

1. bundle
2. bundle exec rails db:create db:migrate
3. bundle exec rails db:seed
4. you can then use the user in seeds to get a JWT token:

```
curl -X POST http://127.0.0.1:3000/logins -H 'Content-Type: application/json' -d '{"email":"orvalho@gmail.com","password":"12344324fs"}'
```

5. Use that token to request the payment requests

```
curl -H "Authorization: Bearer <token>" http://localhost:3000/payment_gateway/payment_requests
```
