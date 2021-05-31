user1 = User.create!(
  first_name: "Rodrigo",
  last_name: "Yamashita",
  email: "rodrigomarcondes2000@gmail.com",
  username: "rodrigo"
)

user2 = User.create!(
  first_name: "Alberto",
  last_name: "Pasqualini",
  email: "pasqualini@pdt.org",
  username: "pasqualini"
)

Bond.create(user: user1, friend: user2, state: Bond::FOLLOWING)
Bond.create(user: user2, friend: user1, state: Bond::FOLLOWING)

place = Place.create!(
  locale: "en",
  name: "Tangamandápio",
  place_type: "hotel",
  coordinate: "POINT ( 112.73 -7.25 0 )"
)

post = Post.create!(
  user: user1,
  postable: Status.new(
    text: "Aoooo! Que doidera"
  )
)

Post.create!(
  user: user2,
  postable: Status.new(
    text: "Realmente, é muito loko!"
  ),
  thread: post
)

Post.create!(
  user: user1,
  postable: Status.new(
    text: "Realmente"
  ),
  thread: post
)

Post.create!(
  user: user2,
  postable: Status.new(
    text: "Né..."
  ),
  thread: post
)

Post.create!(
  user: user1,
  postable: Sight.new(
    place: place,
    activity_type: Sight::CHECKIN
  )
)