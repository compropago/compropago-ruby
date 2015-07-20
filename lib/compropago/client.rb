require 'net/https'
require 'uri'

module Compropago
  class Client

  	#BASE_URI = 'https://api.compropago.com/v1'
    BASE_URI = 'https://api-staging-compropago.herokuapp.com'

  	def initialize(api_key='', options={})
  	  @api_key = api_key

  	  #defaults
  	  options[:base_uri] ||= BASE_URI
  	  @base_uri = options[:base_uri]
  	end

  	def create_charge(order_price, order_name, customer_name, customer_email, payment_type, order_id=nil, image_url=nil)
  	  uri = URI.parse(BASE_URI+'/charges')
  	  http = Net::HTTP.new(uri.host, uri.port)
  	  http.use_ssl = true
  	  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  	  request = Net::HTTP::Post.new(uri.request_uri)
  	  request.basic_auth @api_key, ''
  	  params = { "order_price" => order_price,
  	  			     "order_name" => order_name,
  	  			     "customer_name" => customer_name,
  	  			     "customer_email" => customer_email,
  	  			     "payment_type" => payment_type,
  	  			     "order_id" => order_id,
  	    		     "image_url" => image_url
  	  		     }
  	  request.set_form_data(params)
  	  http.request(request)
  	end

  	def verify_charge(payment_id)
  	  uri = URI.parse(BASE_URI+'/charges/'+payment_id)
  	  http = Net::HTTP.new(uri.host, uri.port)
  	  http.use_ssl = true
  	  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  	  request = Net::HTTP::Get.new(uri.request_uri)
  	  request.basic_auth @api_key, ''
  	  http.request(request)
  	end

  	def send_payment_instructions(payment_id, customer_phone, customer_company_phone)
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
  	  http.request(request)
  	end
  end
end
