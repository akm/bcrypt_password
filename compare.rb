require 'devise'

if ARGV.length < 2
  puts "Usage: ruby digest.rb <hashed_password> <password>"
  exit 1
end

dummy = Object.new
def dummy.pepper
    nil
end
def dummy.stretches
    nil
end

# See https://github.com/heartcombo/devise/blob/e2242a95f3bb2e68ec0e9a064238ff7af6429545/lib/devise/models/database_authenticatable.rb#L62-L68
#     https://github.com/heartcombo/devise/blob/e2242a95f3bb2e68ec0e9a064238ff7af6429545/lib/devise/encryptor.rb
puts Devise::Encryptor.compare(dummy, ARGV[0], ARGV[1])
