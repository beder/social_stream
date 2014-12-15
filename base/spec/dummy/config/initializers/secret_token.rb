# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

Dummy::Application.config.secret_token = '7344d2c92853c851ba291b7bea5305d19934d80467c9789b99b53eb951d79f23c0a2e12c21cde5907da8ec4b7f8a756956eaead363d2d45bfdaadf21f0c6bb2f'

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Dummy::Application.config.secret_key_base = '0f536af69faeb4fe7edbc9d82bf29057c2f16d1b33ceab5005c3c94523d202ef7e5a227a169e7337b48219820d3f6abaa23c5d3cee885f07165869e9eefe1eb7'
