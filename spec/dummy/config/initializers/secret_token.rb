# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

Dummy::Application.config.secret_token = '6b2e621f2d394ff60baf61b1a514c5768287b1ba6bea8b39c962de3415c27b3c6c3cac409f8fbe708b2fbbbf833bf421a3691387fefcc47d6933107e4703fe8d'

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Dummy::Application.config.secret_key_base = '372c44d54d21d631922f0d4032a4d00497fe5341e4af8c646615cc25fa465fd5285cf0aaddd2ffb1009cb9fe71bfd1324b1439011d8db469eb3fefa9d17cb387'
