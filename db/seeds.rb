user = User.create!(name: 'evrusha', email: ENV['SMTP_USER'], password: ENV['ADMIN_PASSWORD'], confirmed_at: Time.now, role: :admin)
user.avatar.attach(io: File.open('app/assets/images/default_avatar.jpg'), filename: 'default_avatar.jpg')

20.times do
  category = Category.create(
    name: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
    status: :active
  )
  file = URI.open(Faker::Avatar.image)
  category.image.attach(io: file, filename: 'avatar.jpg')
end

10.times do
  Tag.create(name: Faker::Lorem.word)
end

20.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    confirmed_at: Time.now
  )

  file = URI.open(Faker::Avatar.image)
  user.avatar.attach(io: file, filename: 'avatar.jpg')
end

50.times do
  dream = Dream.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    duration: rand(1..24),
    user: User.order('RANDOM()').first,
    category: Category.order('RANDOM()').first
  )

  file = URI.open(Faker::Avatar.image)
  dream.image.attach(io: file, filename: 'avatar.jpg')

  dream.tags << Tag.order('RANDOM()').first(rand(0..5))

  rand(15..45).times do
    Comment.create(
      body: Faker::Lorem.sentence,
      user: User.order('RANDOM()').first,
      dream:
    )
  end
end
