# -*- coding: utf-8 -*-
# Initialize the client & Google+ API
require 'google/api_client'
require "yaml"
require "time"

# Initialize OAuth 2.0 client
# authorization
oauth_yaml = YAML.load_file('.google-api.yaml')
client = Google::APIClient.new
client.authorization.client_id = oauth_yaml["client_id"]
client.authorization.client_secret = oauth_yaml["client_secret"]
client.authorization.scope = oauth_yaml["scope"]
client.authorization.refresh_token = oauth_yaml["refresh_token"]
client.authorization.access_token = oauth_yaml["access_token"]

cal = client.discovered_api('calendar', 'v3')

# 候補日の初日の確認
printf("候補日：開始：年(20XX)：")
year_s = gets.strip.to_i
printf("候補日：開始：月(1-12)：")
month_s = gets.strip.to_i
printf("候補日：開始：日(1-31)：")
day_s = gets.strip.to_i

printf("候補日：終了：年(20XX)：")
year_e = gets.strip.to_i
printf("候補日：終了：月(1-12)：")
month_e = gets.strip.to_i
printf("候補日：終了：日(1-31)：")
day_e = gets.strip.to_i

printf("候補日；開始；時(0-24)：")
hour_s = gets.strip.to_i
printf("候補日；終了；時(0-24)：")
hour_e = gets.strip.to_i

# 時間を格納
time_min = Time.utc(year_s, month_s, day_s, 0).iso8601
time_max = Time.utc(year_e, month_e, day_e, 24).iso8601

# イベントの取得
params = {'calendarId' => 'primary',
          'orderBy' => 'startTime',
          'timeMax' => time_max,
          'timeMin' => time_min,
          'singleEvents' => 'True'}

result = client.execute(:api_method => cal.events.list,
                        :parameters => params)

# イベントの格納
events = []
result.data.items.each do |item|
        events << item
end

# 出力
events.each do |event|
    printf("%s, %s, %s\n", event.start.dateTime, event.end.dateTime, event.summary)
end
