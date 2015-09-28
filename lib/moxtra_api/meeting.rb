module MoxtraApi
  module Meeting
    def create_meeting
      puts "In create_meeting"
      puts "access_token"
      puts @access_token
      self.class.post(MoxtraApi::Client::MOXTRA_API_ENDPOINT + '/meets/schedule',
                      body: {
                        name: 'Test',
                        starts: Time.now.utc.iso8601,
                        ends: (Time.now.utc + 1.hours).iso8601,
                        agenda: 'Testing meet'}.to_json, query: {access_token: @access_token})
    end


    def get_user_meetings
      puts "In get_user_meetings"
      self.class.get(MoxtraApi::Client::MOXTRA_API_ENDPOINT + "UdqFYO2fNo0BEbHPbO38zA9/meets",
                      query: {
                        access_token: @access_token})
    end

    def get_meeting_status(meet)
      self.class.get(MoxtraApi::Client::MOXTRA_API_ENDPOINT + "meets/status/#{meet_session_key}",
                      query: {
                        access_token: @access_token})
    end


    def get_meeting_info(meet)
      self.class.get(MoxtraApi::Client::MOXTRA_API_ENDPOINT + "/meets/#{meet_session_key}",
                      query: {
                        access_token: @access_token})
    end

    def invite_users_to_meeting(meet, invitees = [])
      self.class.post(MoxtraApi::Client::MOXTRA_API_ENDPOINT + 'meets/inviteuser',
                      body: {
                        session_key: meet_session_key,
                        users: invitees,
                        message}.to_json,
                      query: {access_token: @access_token})
    end

    def remove_user_from_meet(meet, invitee_unique_id)
      self.class.post(MoxtraApi::Client::MOXTRA_API_ENDPOINT + 'meets/removeuser',
                      body: {
                        session_key: meet_session_key,
                        unique_id: invitee_unique_id}.to_json,
                      query: {access_token: @access_token})
    end

    def update_meeting(meet)

    end


    def delete_meeting(meet)

    end

    def get_meet_recording(meet_session_key)

    end


  end
end
