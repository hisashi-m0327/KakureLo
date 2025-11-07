# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

yamada = User.find_or_create_by(email: "yamada@example.com") do |user|
  user.name = "山田 太郎"
  user.password = "password"
  user.postal_code = "909-0001"
  user.address = "鹿児島県熊毛郡屋久島町"
  user.telephone_number = "07095182982"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

tanaka = User.find_or_create_by(email: "tanaka@example.com") do |user|
  user.name = "田中 次郎"
  user.password = "password"
  user.postal_code = "977-0001"
  user.address = "秋田県秋田市茨島"
  user.telephone_number = "07050062406"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

sato = User.find_or_create_by(email: "sato@example.com") do |user|
  user.name = "佐藤 花子"
  user.password = "password"
  user.postal_code = "978-0001"
  user.address = "島根県浜田市熱田町"
  user.telephone_number = "07025242011"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

Post.find_or_create_by(title: "もののけの森") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.body = "知る人ぞ知る、癒しの場所です。"
  post.user = yamada
end

Post.find_or_create_by(title: "ノスタルジックな風景") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post.body = "昔ながらの民家と季節の景色！"
  post.user = tanaka
end

Post.find_or_create_by(title: "日本海") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  post.body = 'どこまでも続く水平線！'
  post.user = sato
end