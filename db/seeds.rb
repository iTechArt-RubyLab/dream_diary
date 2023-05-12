User.create(name: 'evrusha', email: 'uzaharau@gmail.com', password: ENV['ADMIN_PASSWORD'], confirmed_at: Time.now, role: :admin)

Category.create(name: 'Food', description: Faker::Food.description)

10.times do |x|
  Dream.create(
    date: Faker::Date.between(from: '2023-01-01', to: '2023-04-04'),
    duration: rand(0..24),
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 3),
    tags: Faker::Hipster.words(number: rand(1..4)),
    user_id: User.first.id,
    category_id: Category.first.id
  )
end
