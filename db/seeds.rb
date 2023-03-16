# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


areas = [
  "千代田区",
  "中央区",
  "港区",
  "新宿区",
  "文京区",
  "台東区",
  "墨田区",
  "江東区",
  "品川区",
  "目黒区",
  "大田区",
  "世田谷区",
  "渋谷区",
  "中野区",
  "杉並区",
  "豊島区",
  "北区",
  "荒川区",
  "板橋区",
  "練馬区",
  "足立区",
  "葛飾区",
  "江戸川区",
]

areas.each do |area|
  Area.create(name: area)
end

genres = [
  "公園",
  "アスレチック", 
  "プール", 
  "山登り", 
  "海水浴場", 
  "スケート場", 
  "スポーツ施設", 
  "博物館",
  "美術館", 
  "図書館", 
  "児童館・公民館",
  ]
  
genres.each do |genre|
  Genre.create(name: genre)
end