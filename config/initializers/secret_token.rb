# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

if ENV['SECRET_TOKEN'].blank?
  if Rails.env.production?
    # Crash
    raise "You must set ENV['SECRET_TOKEN']"
  elsif Rails.env.test?
    # Generate the key and test away
    ENV['SECRET_TOKEN'] = Recruit::Application.config.secret_token = SecureRandom.hex(30)
  else
    file = File.expand_path(File.join(Rails.root, '/config/secret_token.yml'))
    if File.exists?(file)
      # Just load the key
      config = YAML.load_file(file)
    else
      # Generate the key, set it for the current environment, and update the YAML file
      config = Hash[Rails.env, {'SECRET_TOKEN' => SecureRandom.hex(30)}]
      File.open(file, 'w') { |f| f.write(config.stringify_keys.to_yaml) }
    end
    ENV['SECRET_TOKEN'] = config[Rails.env]['SECRET_TOKEN']
  end
end

Recruit::Application.config.secret_token = ENV['SECRET_TOKEN']
