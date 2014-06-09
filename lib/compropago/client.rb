require 'net/https'
require 'uri'

module Compropago
  class Client

  	BASE_URI = 'https://api.compropago.com/v1'

  	def initialize(api_key='', options={})
  	  @api_key = api_key

  	  #defaults
  	  options[:base_uri] ||= BASE_URI
  	  @base_uri = options[:base_uri]	
  	end

  	def create_charge product_price, product_name, customer_name, customer_email, payment_type, product_id=nil, image_url=nil 
  	  uri = URI.parse(BASE_URI+'/charges')
  	  http = Net::HTTP.new(uri.host, uri.port)
  	  http.use_ssl = true
  	  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  	  request = Net::HTTP::Post.new(uri.request_uri)
  	  request.basic_auth @api_key, ''
  	  params = { "product_price" => product_price,
  	  			 "product_name" => product_name,
  	  			 "customer_name" => customer_name,
  	  			 "customer_email" => customer_email,
  	  			 "payment_type" => payment_type,
  	  			 "product_id" => product_id,
  	  			 "image_url" => image_url,
  	  			 "product_id" => product_id,
  	    		 "image_url" => image_url
  	  		  }
  	  request.set_form_data(params)
  	  response = http.request(request)
  	end

  	def verify_charge payment_id
  	  uri = URI.parse(BASE_URI+'/charges/'+payment_id)
  	  http = Net::HTTP.new(uri.host, uri.port)
  	  http.use_ssl = true
  	  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  	  request = Net::HTTP::Get.new(uri.request_uri)
  	  request.basic_auth @api_key, ''
  	  response = http.request(request)
  	end

  	def send_payment_instructions payment_id, customer_phone, customer_company_phone
  	  uri = URI.parse(BASE_URI+'/charges/'+payment_id.to_s+'/sms')
  	  http = Net::HTTP.new(uri.host, uri.port)
  	  http.use_ssl = true
  	  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  	  request = Net::HTTP::Post.new(uri.request_uri)
  	  request.basic_auth @api_key, ''
  	  params = { "payment_id" => payment_id.to_s,
  	  			 "customer_phone" => customer_phone.to_s,
  	  			 "customer_company_phone" => customer_company_phone
  	  		   }
  	  request.set_form_data(params)
  	  response = http.request(request)
  	end
  end
end