# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mapdemo_session',
  :secret      => 'c926f44cc735bccdb90384a3167121183015fc370b396cabe2ccad2d44fce05a163c27c907946d564c5f1a31e74f92f308011aa22af0cb5252adbbc429f5f5a1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
