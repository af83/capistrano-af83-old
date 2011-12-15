# Configure the 3 stages: dev, staging and production

set :stages, %w(dev staging production)
set :default_stage, "dev"

# TODO find how to provide default values for branch, rails_env per stage
