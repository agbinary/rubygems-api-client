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
		response_parse = JSON.parse(response.body)
		api_key = response_parse["rubygems_api_key"]
	end

	def gems(token)
		connection = Faraday.new 
		response = connection.get 'https://rubygems.org/api/v1/gems.json', {}, {'Authorization' => token}
		response_parse = JSON.parse(response.body)
	end
end

#c7bbbf77186860fcdc3199eb6071ea2d