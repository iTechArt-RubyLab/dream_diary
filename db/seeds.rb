10.times do
  Dream.create(
    date: Faker::Date.between(from: '2023-01-01', to: '2023-04-04'),
    duration: rand(0..24),
    title: Faker::Books::Lovecraft.word,
    description: Faker::Fantasy::Tolkien.poem,
    image: Faker::Avatar.image,
    category: Faker::Color.color_name,
    tags: Faker::Hipster.words(number: rand(1..4)),
    user_id: User.first.id
  )
end
