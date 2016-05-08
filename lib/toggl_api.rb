module TogglApi

  def self.get_time_entries(from:, to:)
    from = from.utc.iso8601
    to = to.utc.iso8601
    api = ENV["TOGGL_API_USERNAME"]
    url = "https://toggl.com/api/v8/time_entries?start_date=#{from}&end_date=#{to}"
    request = HTTParty.get(url, {basic_auth: {username: "#{api}", password: 'api_token'}})
    JSON.parse(request.body)
  end

  def self.get_dashboard_info(from:, to:)
    api = ENV["TOGGL_API_USERNAME"]
    url = "https://toggl.com/reports/api/v2/summary?workspace_id=543572&since=#{from}&until=#{to}&user_agent=api_test"
    request = HTTParty.get(url, {basic_auth: {username: "#{api}", password: 'api_token'}})
    JSON.parse(request.body)
  end

end