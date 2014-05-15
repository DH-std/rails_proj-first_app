# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

require 'securerandom'

def secure_token
	token_life = Rails.root.join('.secret')
	if File.exist?(token_life)
		# Use the existing token.
    	File.read(token_file).chomp
 	else
    	# Generate a new token and store it in token_file.
    	token = SecureRandom.hex(64)
    	File.write(token_file, token)
    	token
  	end
end

FirstSpp::Application.config.secret_key_base = secure_token

#FirstSpp::Application.config.secret_key_base = '7212f56ab2b160d99f46e3bd89a70c2a00464f0f829d2c87d34da01f56cc0ba0332b4f81bd6ff7d2f4f42ce61eca328e31f1f7987322c42c7d0a77890908279c'
