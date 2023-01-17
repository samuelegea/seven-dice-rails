require 'json'
require_relative './seeds/equipment'
require_relative './seeds/spells'
require_relative './seeds/magic_items'

# Create Admin User for development
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? && AdminUser.find_by(email: 'admin@example.com').nil?

# First of all, we need to create all the vanilla classes, subclasses, races and subraces
# We will use the D&D 5e API to get all the information we need




create_equipments!
create_spells!
create_magic_items!
