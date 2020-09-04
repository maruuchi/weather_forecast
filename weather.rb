require "csv"
require "json"
require "date"
require "pry"
require "open-uri"


# 実行は ruby main.rb

# 佐賀県の地域を表示
csv_data = CSV.read("sagapre.csv")


def select_list(csv_data)
  csv_data.each.with_index(1) do |local,i|
    puts "No.#{i}, #{local[1]}"
  end
end

# ---------------------------



def select_region
  while true
    print "住んでいる地域を上記から選択してください ＞"
    num = gets.to_i
    break if num >= 1 && num <= 2
  
  end
    # 実行
    num
  
end




def data(csv_data, num)
  response = open("http://weather.livedoor.com/forecast/webservice/json/v1?city=#{csv_data[num - 1][2].to_i}")

  parse_text = JSON.parse(response.read)

  parse_text["forecasts"]
end



def weather_forecast_result(result, csv_data, num)
  tomorrow = Date.today + 1
  tomorrow_climate = csv_data[select_num - 1][1]
  tomorrow_weather = result[0]["telop"]
  tomorrow_temperature = (result[1]["temperature"]["max"]["celsius"]).to_i

  puts "[-----明日の天気予報-----]"

  tomorrow_wdays = %w(日 月 火 水 木 金 土)[tomorrow.wday] + "曜日"

  puts "明日は#{tomorrow}.#{tomorrow_wdays}です"

  puts "#{tomorrow_climate}の天気は#{tomorrow_weather}です"

  def temparature_info
    if tomorrow_weather.include?("雨")
      puts "雨の恐れが有りますご注意を"
    else
      puts "ランニング日和になりそうです"
    end
  end

  puts "明日の気温は#{tomorrow_temperature}度です。"

  # if tomorrow_temperature < 10
  #   puts "寒いので厚着した方がいいと思います。"
  # elsif tomorrow_temperature <= 20
  #   puts "肌寒いので長袖がいいと思います。"
  # else
  #   puts "暑いので半袖で大丈夫だと思います。"
  # end

  case tomorrow_temperature
  when -100..10
    puts "寒いので厚着した方がいいと思います。"
  when 11..20
    puts "肌寒いので厚着した方がいいと思います。"
  else 20..100
puts "暑いので半袖で大丈夫だと思います。"
  end

  puts "明日もランニング頑張ってください!!!"
end