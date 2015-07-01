require 'faraday'
require 'json'

class Client

	def initialize(user, password)
		@user = user
		@password = password
	end

	def authenticate
		connection = Faraday.new "https://rubygems.org/api/v1/api_key.json"
		connection.basic_auth(@user, @password)
		response = connection.get
	end
end