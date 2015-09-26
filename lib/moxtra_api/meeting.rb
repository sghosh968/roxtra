module MoxtraApi
  module Meeting
    def create_meeting
      puts "In create_meeting"
      puts "access_token"
      puts @access_token
      self.class.post(MoxtraApi::Client::MOXTRA_API_ENDPOINT + '/meets/schedule',
                      query: {
                        name: 'Test',
                        starts: Time.now.utc.iso8601,
                        ends: (Time.now.utc + 1.hours).iso8601,
                        agenda: 'Testing meet',
                        access_token: @access_token})
    end


    def get_user_meetings
      puts "In get_user_meetings"
      self.class.get(MoxtraApi::Client::MOXTRA_API_ENDPOINT + "UdqFYO2fNo0BEbHPbO38zA9/meets",
                      query: {
                        access_token: @access_token})
    end
  end
end
