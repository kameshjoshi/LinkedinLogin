class AuthController < ApplicationController
  require 'net/http'

  def linkedin
    received_code = params[:code]
    url = URI('https://www.linkedin.com/oauth/v2/accessToken')

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/x-www-form-urlencoded'
    request["Cache-Control"] = 'no-cache'

    client_id     = '81ree3q9jedvkh'
    client_secret = 'isw7fqJPUL2BgzP4'
    redirect_url  = 'http://localhost:3000/auth/linkedin'

    request["Authorization"] = ActionController::HttpAuthentication::Basic.encode_credentials(client_id,client_secret)
    http.use_ssl = true
    request.body = "grant_type=authorization_code&code=#{received_code}&redirect_uri=#{redirect_url}&client_id=#{client_id}&client_secret=#{client_secret}"

    response = http.request(request)
    access_token = JSON.parse(response.read_body)['access_token']

    url_to_retrive_data = "https://api.linkedin.com/v1/people/~:(id,first-name,last-name,public-profile-url,email-address,phone-numbers)?format=json&oauth2_access_token=#{access_token}"

    parsed_url = URI(url_to_retrive_data)
    parsed_url_http = Net::HTTP.new(parsed_url.host, parsed_url.port)
    parsed_url_request = Net::HTTP::Get.new(parsed_url)
    parsed_url_http.use_ssl = true
    user_details_response = parsed_url_http.request(parsed_url_request)
    # user_details_response = parsed_url_http.request(parsed_url_request)
    json_response = JSON.parse(user_details_response.read_body)
    puts json_response.inspect
    data_to_save = {first_name: json_response['firstName'],last_name: json_response['lastName'],email: json_response['emailAddress'],contact_number: json_response['phoneNumbers'],public_profile_url: json_response['publicProfileUrl']}

    @user = User.create!(data_to_save)    
  end
end
