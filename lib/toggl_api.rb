module TogglApi

  def self.get_time_entries(from:, to:)
    from = from.utc.iso8601
    to = to.utc.iso8601
    api = ENV["TOGGL_API_USERNAME"]
    url = "https://toggl.com/api/v8/time_entries?start_date=#{from}&end_date=#{to}"
    request = HTTParty.get(url, {basic_auth: {username: "#{api}", password: 'api_token'}})
    JSON.parse(request.body)
  end

end