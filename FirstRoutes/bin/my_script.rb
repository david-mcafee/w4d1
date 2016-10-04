require 'addressable/uri'
require 'rest-client'
require 'byebug'

# def index_users
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: 3000,
#     path: '/users',
#     # query_values: {
#     #   'some_category[a_key]' => 'another value',
#     #   'some_category[a_second_key]' => 'yet another value',
#     #   'some_category[inner_inner_hash][key]' => 'value',
#     #   'something_else' => 'aaahhhhh'
#     # }
#   ).to_s
#
#     puts RestClient.get(url)
# end
#
# index_users

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  begin

    puts RestClient.post(
      url,
      { user: { name: name, email: email} }
      # Notice how we've namespaced all the parameters of the user to create
      # under :user. This leverages mass-assignment to set all the uploaded
      # attributes. This is an extremely common Rails pattern: pretty much
      # every time we upload parameters we will nest them under in an inner
      # hash to use for mass assignment.
    )
  rescue
    raise "Invalid number of arguments to create a user!"
  end

end

def show_user(id)
  # debugger
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/#{id}.json'
  ).to_s

  begin

    puts RestClient.get(
      url,
      # Notice how we've namespaced all the parameters of the user to create
      # under :user. This leverages mass-assignment to set all the uploaded
      # attributes. This is an extremely common Rails pattern: pretty much
      # every time we upload parameters we will nest them under in an inner
      # hash to use for mass assignment.
      { user: { id: id} }
    )
  rescue
    raise "Invalid number of arguments to show a user!"
  end
end

def update_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/#{id}.json'
  ).to_s
end

def destroy_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/#{id}.json'
  ).to_s
end

show_user(3)
