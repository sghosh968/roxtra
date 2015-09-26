module MoxtraApi
  class Client
    attr_accessor :access_token, :token_type, :expires_in, :user_id, :org_id
    include HTTParty
    include MoxtraApi::Meeting
     headers 'Content-Type' => 'application/json'
    # default_params :access_token => @access_token if @access_token.present?

      MOXTRA_CLIENT_ID = "lTE6iTwHgzs"
      MOXTRA_CLIENT_SECRET = "qTSWKvoxWh4"
      MOXTRA_API_ENDPOINT = "https://apisandbox.moxtra.com/v1/"
      MOXTRA_AUTHENTICATION_ENDPOINT = "https://apisandbox.moxtra.com/oauth/token"


    def initialize(user)
      response = self.class.post(MOXTRA_AUTHENTICATION_ENDPOINT, headers: {'Content-Type' => 'application/x-www-form-urlencoded'},
             query: {client_id: MoxtraApi::Client::MOXTRA_CLIENT_ID,
                      client_secret: MoxtraApi::Client::MOXTRA_CLIENT_SECRET,
                      grant_type: 'http://www.moxtra.com/auth_uniqueid',
                      uniqueid:  user.id,
                      timestamp: (Time.now.to_f * 1000).to_i,
                      firstname: 'Suman',
                      lastname: 'Ghosh'})
      @access_token = response['access_token']
      @token_type = response['token_type']
      @expires_in = response['expires_in']
      self.me
    end


    def me
      response = self.class.get(MOXTRA_API_ENDPOINT.to_s + 'me', query: {access_token: @access_token})
      @user_id = response['id']
      @organization_id = response['org_id']
      response
    end

    def get_user_profile(user_id)
      response = self.class.get(MOXTRA_API_ENDPOINT.to_s + user_id, query: {access_token: @access_token})
    end

    def self.get_request_test(url)
      puts "In get_request_test"
      result = get(url)
      puts result
    end


  end
end
