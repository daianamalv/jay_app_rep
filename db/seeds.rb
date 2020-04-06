@tours = [
{
title: 'Кутузовская набережная',
places: ['Дом архитекторов', 'Памятник Тарасу Шевченко']
}, {
title: 'Модерн на Петроградке',
places: ['Театр Миронова', 'Каменноостровский дворец', 'Жилой дом Люмьер']
}, {
title: 'Истории Озерков',
places: ['Дача Лесснера', 'Спасо-Парголовская церковь']
}, {
title: 'С Рубинштейна на Фонтанку',
places: ['Толстовский дом', 'Башня пяти углов', 'Обуховский мост']
}, {
title: 'По каналу Грибоедова',
places: ['Львиный мост', 'Экономический университет', 'Историческая булочная']
}
]

@users = [
{
name: 'Иван',
description: 'Знаю все о Петроградском районе',
email: 'user1@test.com',
password: 'testtest'
}, {
name: 'Антон',
description: 'Рассказываю о лучшей корейской кулинарии',
email: 'user2@test.com',
password: 'testtest'
}, {
name: 'Саша',
description: 'Люблю котиков Озерков',
email: 'user3@test.com',
password: 'testtest'
}
]

@cities = ['Краснодар', 'Санкт-Петербург', 'Пушкин', 'Хабаровск']

def seed
 reset_db
 create_users(@users)
 create_cities(@cities)
 create_tours(@tours)

end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_cities(cities)
  cities.each { |city| create_city(city) }
  @cities = City.all
end

def create_city(city)
  c = City.create!(name: city)
  puts "City with name #{c.name} just created"
end

def create_users(users)
  users.each do |user|
   User.create!(
     name:                  user[:name],
     description:           user[:description],
     email:                 user[:email],
     password:              user[:password],
     password_confirmation: user[:password]
   )
  end
end

def create_tours(tours)
  tours.each { |tour| create_tour(tour) }
end

def create_tour(tour)
  c = Tour.create!(title: tour[:title])
  c.city_id = City.all.sample.id
  c.user_id = User.all.sample.id
  puts "Tour with title #{c.title} created"

  create_tour_places(c, tour[:places])
  c.save!
end

def create_tour_places(tour, places)
  places.each { |place| create_tour_place(tour, place) }

end

def create_tour_place(tour, place)
  s = tour.places.create!(title: place)
  puts "Place with title #{s.title} just created in tour with title #{s.tour.title}"
end


seed
