@tours = [
{
title: 'Прогулка по барам',
places: ['Заброшенный парк Spreepark', 'Комплекс закрытых дворов', 'Сад церкви Святого Дунстана на востоке', 'Пешеходный туннель', 'Замок Поенари']
}, {
title: 'Модерн XIX века',
places: ['Музей букв', 'Олимпийская деревня', 'Блошиный рынок', 'Клуб Бергиан', 'Дерево-траффик']
}, {
title: 'Музей граффити',
places: ['Клуб Бергиан', 'Дерево-траффик','Музей Хокстон', 'Сады Киото в парке Холланд', 'Шато-Гайар']
}, {
title: 'Современное городское искусство',
places: ['Сад церкви Святого Дунстана на востоке', 'Пешеходный туннель', 'Замок Поенари', 'Музей букв', 'Олимпийская деревня', 'Блошиный рынок']
}, {
title: 'Места уличных музыкантов',
places: ['Музей Хокстон', 'Сады Киото в парке Холланд', 'Шато-Гайар','Чимчильбаны', 'Крафт-кафе', 'Дизайн Плаза', 'Ручей Чхонгечхон']
}, {
title: 'Растения города',
places: ['Чимчильбаны', 'Крафт-кафе', 'Дизайн Плаза', 'Ручей Чхонгечхон', 'Музей Хокстон', 'Сады Киото в парке Холланд', 'Шато-Гайар']
}
]

@users = [
{
name: 'Иван Седов',
description: 'Привет из Берлина. Я Ваня, занимаюсь коучингом в консалтинге, а также обожаю историю и в свободное время вожу экскурсии по городу, обожаю делиться своей страстью с людьми со всего мира.'
}, {
name: 'Антон Завгородний',
description: 'Я и мои друзья оставили свои работы, чтобы рассказывать о Лондоне. Мы привносим страсть и энергию в наши туры, так что вы обязательно почувствуете себя немного более близким Лондону после наших маршрутов. Мы также знаем город изнутри, так что вы гарантированно увидите ту сторону Лондона, которую никогда не найдете самостоятельно '
}, {
name: 'Саша Павлов',
description: 'Привет, я Саша. Я музыкант уже более 15 лет и глубоко знаком с местной музыкальной культурой Пуэрто-Рико и его историей. Я познакомлю вас ней, чтобы мы могли делиться, смеяться и иногда даже узнавать некоторые танцевальные движения.'
}
]

@cities = ['Ванкувер', 'Берлин', 'Сеул', 'Лондон']

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
  c = City.create!(name: city, cover: upload_random_cover)
  puts "City with name #{c.name} just created"
end

def create_users(users)
  users.each do |user|
   c = User.create!(user)
   puts "User with name #{c.name} created"
  end
end

def create_tours(tours)
  tours.each { |tour| create_tour(tour) }
end

def create_tour(tour)
  c = Tour.create!(title: tour[:title], cover: upload_random_cover)
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
  s = tour.places.create!(title: place, cover: upload_random_cover)
  puts "Place with title #{s.title} just created in tour with title #{s.tour.title}"
end

def upload_random_cover
  uploader = TourCoverUploader.new(Tour.new, :cover)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload', "*")).sample))
  uploader
end

def upload_random_cover
  uploader = CityCoverUploader.new(City.new, :cover)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload', "*")).sample))
  uploader
end

def upload_random_cover
  uploader = PlaceCoverUploader.new(Place.new, :cover)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload', "*")).sample))
  uploader
end


seed
