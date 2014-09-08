# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

Dummy::Application.config.secret_token = 'a85ff3866549e818069e088bed435487038449bae9d3a31ca266f7b2670751908ea358d3120c787b2b86d9de39bb833b10a108b7b3d3460c4469e75f58be0259'

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Dummy::Application.config.secret_key_base = 'b7b255ab889977b709e45a7d82c915d2d091a71bc82c47f09335dc2d16926c39d9c31d24c9d5e451b6f2c4906baa84ad3dbfcd36420e695d30622d0033f8ce94'
