require "csv"
require "json"
require "date"
require "pry"


# 実行は ruby weather.rb

print "住んでいる地域を以下から選択してください"
# 佐賀県の地域を表示
CSV.read("sagapre.csv")

puts "No.#{i}, #{local[1]}"