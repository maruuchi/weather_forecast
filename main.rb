require "./weather"

csv_data = CSV.read("sagapre.csv")

select_list(csv_data)

num = select_region

result = data(csv_data, num)

weather_forecast_result(result, csv_data, num)