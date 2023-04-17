Category.create(name: 'Food', description: Faker::Food.description, image: 'app/assets/images/food_icon.png')

10.times do |x|
  Dream.create(
    date: Faker::Date.between(from: '2023-01-01', to: '2023-04-04'),
    duration: rand(0..24),
    title: Faker::Books::Lovecraft.word,
    description: Faker::Fantasy::Tolkien.poem,
    image: "https://cataas.com/cat?#{x}",
    tags: Faker::Hipster.words(number: rand(1..4)),
    user_id: User.first.id,
    category_id: Category.first.id
  )
end
