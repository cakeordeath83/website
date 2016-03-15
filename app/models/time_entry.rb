class TimeEntry < ActiveRecord::Base
  
  validates_uniqueness_of :toggl_id
  # Codebar
  
=begin
  def update_database
    today = Date.today.iso8601
    start_today = "#{today}T01%3A00%3A00%2B00%3A00"
    end_today = "#{today}T23%3A55%3A59%2B00%3A00"
    api = ENV["TOGGL_API_USERNAME"]
    
    @url = "https://toggl.com/api/v8/time_entries?start_date=#{start_today}&end_date=#{end_today}"
    request = HTTParty.get(@url, {basic_auth: {username: "#{api}", password: 'api_token'}})
    @today_time_entries = JSON.parse(request.body)

    if @today_time_entries
      @today_time_entries.each do |today|
        TimeEntry.create(toggl_id: today["toggl_id"], 
                         description: today["description"], 
                         duration: today["duration"], 
                         start: today["start"], 
                         stop: today["stop"], 
                         pid: today["pid"])
      end
    end
  end
  handle_asynchronously :update_database, :run_at => Proc.new {DateTime.tomorrow.beginning_of_day}
=end
  
end
