require 'faker'

Booking.destroy_all
Event.destroy_all
Volunteer.destroy_all
Employer.destroy_all
Charity.destroy_all
Message.destroy_all
Invitation.destroy_all
Chatroom.destroy_all
User.destroy_all
Review.destroy_all

puts "Old seeds destroyed"

# DEMO USER - EMPLOYER
katy_user = User.create!(email: "emma@gmail.com", password: '123123', current_role: 'Employer')

katy_employer = Employer.create!(
                  company_name: "Ultra Tech",
                  user: katy_user
                )

# DEMO USER - VOLUNTEER
pepe_user = User.create!(email: "pepe@gmail.com", password: '123123', current_role: 'Volunteer')

pepe_volunteer = Volunteer.create!(
                  first_name: 'Pepe',
                  last_name: 'Baena',
                  employer: katy_employer,
                  description: "I like helping and volunteering and dedicate a bit of time to the causes that are closer to my heart. Especially those that involve people and animals. Issues of human rights and identity are also quite dear to me and often support those causes too. I believe that in order to change the environment you live in, you need to change yourself first, and by helping others when I can I hope I will be living in a more humane and better world.",
                  age: (18..80).to_a.sample,
                  dbs_checked: false,
                  user: pepe_user
                )

puts "Demo users created"

# OTHER USERS

charity_users = []
19.times do
  charity_users << User.create!(
    email: "#{Faker::Name.unique.first_name}@charity.com",
    password: '123123',
    current_role: 'Charity'
  )
end

demo_charity = User.create!(
                email: "charity@gmail.com",
                password: '123123',
                current_role: 'Charity'
  )

10.times do
  User.create!(
    email: "#{Faker::Name.unique.first_name}@volunteer.com",
    password: '123123',
    current_role: 'Volunteer'
  )
end

2.times do
  User.create!(
    email: "#{Faker::Name.unique.first_name}@employer.com",
    password: '123123',
    current_role: 'Employer'
  )
end

puts "Users created"

# user: User.where(current_role: 'Charity')[0]

# CHARITIES
food_cycle = Charity.create!(charity_name: 'FoodCycle Hackney',
                             category: 'Human Welfare',
                             description: 'Come and enjoy company and conversation with others from your local area over a delicious meal, prepared with care by FoodCycle volunteers. Everyone is welcome, no matter your background or circumstances. No referral needed, just turn up.',
                             user: charity_users[0]
                            )
skyway = Charity.create!(charity_name: 'Skyway',
                             category: 'Human Welfare',
                             description: 'We offer a wide range of free-to-access opportunities at youth clubs, community venues, parks, estates, schools and on the streets. Some of the sessions we run focus on developing new skills, learning or participating in sport, but we recognise the most important things are to provide safe, welcoming spaces where people can relax, socialise and have fun.',
                             user: charity_users[1]
                            )
national_childrens_bureau = Charity.create!(charity_name: "Children's Bureau",
                             category: 'Human Welfare',
                             description: 'As a society we provide a vital system of support and services to keep children safe and give them the best childhood. For over 50 years NCB has been driving change throughout this system to make it as effective as possible and to protect the children whose welfare is most at risk.',
                             user: charity_users[2]
                            )
child_hope = Charity.create!(charity_name: 'Child Hope',
                             category: 'Human Welfare',
                             description: 'Every child has the right to a safe and secure childhood, but for many these rights are denied. Born into extreme poverty and violence, they are at high risk of exploitation and abuse. Our purpose is to draw out and build on the strengths of children and those around them to tackle injustice. Looking at root causes, such as poverty and inequality, we also focus on influencing the policies and systems that can and must be changed to enable children to thrive.',
                             user: charity_users[3]
                            )
hackney_friends_of_the_earth = Charity.create!(charity_name: 'Friends of the Earth',
                             category: 'Environment',
                             description: 'We are part of an international community dedicated to protecting the natural world and the wellbeing of everyone in it. We lead campaigns, provide resources and information, and drive real solutions to the environmental problems facing us all.',
                             user: charity_users[4]
                            )
scope = Charity.create!(charity_name: 'Scope',
                             category: 'Human Welfare',
                             description: "We're Scope, the disability equality charity in England and Wales. We provide practical information and emotional support when it's most needed and we campaign relentlessly to create a fairer society.",
                             user: charity_users[5]
                            )
crisis_hackney = Charity.create!(charity_name: 'Crisis Hackney',
                             category: 'Charity Shops',
                             description: 'Charity Shops',
                             user: charity_users[6]
                            )
access_to_sports = Charity.create!(charity_name: 'Access to Sports',
                             category: 'Sports',
                             description: "The Access to Sports Project deliver a wide range of Sporting Activities for Children and Young People in Hackney, our programme is supported by Young Hackney, local community organisations, schools and the London Borough of Hackney.
",
                             user: charity_users[7]
                            )
humane_society_international = Charity.create!(charity_name: 'Humane Society',
                             category: 'Animal Welfare',
                             description: "Humane Society International works around the globe to promote the human-animal bond, rescue and protect dogs and cats, improve farm animal welfare, protect wildlife, promote animal-free testing and research, respond to natural disasters and confront cruelty to animals in all of its forms.",
                             user: charity_users[8]
                            )
network_for_animals = Charity.create!(charity_name: 'Network For Animals',
                             category: 'Animal Welfare',
                             description: "We financially support and provide logistical help for animal shelters, animal welfare initiatives and, importantly, raise public awareness about animal issues. Dogs, cats, horses and donkeys are among the animals who benefit from the work we do with the help of our nearly million supporters, who live all over the world.",
                             user: demo_charity
                            )
rugby_portobello_trust = Charity.create!(charity_name: 'Rugby Portobello Trust',
                             category: 'Human Welfare',
                             description: "RPT is a children's, youth and family support charity that has been operating in North Kensington for over 130 years. We provide a range of sporting, cultural and educational activities which are delivered in the daytime, evenings and during holidays, both on and off site.",
                             user: charity_users[9]
                            )
the_drake_trust = Charity.create!(charity_name: 'The Drake Trust',
                            category: 'Human Welfare',
                            description: "The Drake Trust is an architectural conservation charity that gives grants for education and training in building conservation. Set up in 1992 it provides funding for educational institutions, groups and individuals to provide skills training and information on building conservation.",
                            user: charity_users[10]
                            )
hestia = Charity.create!(charity_name: 'Hestia',
                            category: 'Human Welfare',
                            description: "At Hestia we support adults and children in times of crisis. We deliver services across London and the surrounding regions, as well as campaign and advocate nationally on the issues that affect the people we work with. Last year we supported 15,238 men, women and children. This includes victims of modern slavery, women and children who have experienced domestic abuse, young care leavers and older people. From giving someone a home, to helping them to get the right mental health support, we support people at the moment of crisis and enable them to build a life beyond a crisis.",
                            user: charity_users[11]
                            )
red_cross = Charity.create!(charity_name: 'Red Cross',
                            category: 'Charity Shops',
                            description: "We fund young asylum seekers or young people with limited leave through higher education in the UK who are not entitled to student finance and cannot otherwise afford the costs of higher education. We fund this group of young people because their immigration status does not allow them to secure student finance and therefore does not allow them to access and progress in higher education, despite legally being allowed to live in the UK.",
                            user: charity_users[12]
                            )
british_exploring_society = Charity.create!(charity_name: 'Exploring Society',
                            category: 'Human Welfare',
                            description: "British Exploring Society is a world class youth development charity with a unique heritage, founded on the belief that challenging experiences can transform lives, empowering and equipping young people with the courage, skills, resilience and determination to make the most of their future. Most young people return with increased self-belief, a dynamic peer group and the determination and ability to make the most of their future, regardless of where they started out.",
                            user: charity_users[13]
                           )
marie_curie = Charity.create!(charity_name: 'Marie Curie',
                            category: 'Charity Shops',
                            description: "Our charity shops raise funds so we can care for more people living with a terminal illness and their families. Shop, donate some items or volunteer.",
                            user: charity_users[14]
                           )
chelsea_foundation = Charity.create!(charity_name: 'Chelsea Foundation',
                            category: 'Sports',
                            description: "Formed in 2010, the Chelsea Foundation brings together the Football in the Community and the Education department along with the club’s other charitable and community activities, including our international work and anti-discrimination projects.",
                            user: charity_users[15]
                            )
blue_cross_for_pets = Charity.create!(charity_name: 'Blue Cross for Pets',
                            category: 'Animal Welfare',
                            description: "Pets are at the heart of everything we do. Each year, thousands of cats, dogs, small pets and horses turn to our animal hospitals, clinics and rehoming services for treatment and to find them the happy homes they deserve. Meanwhile, our Education and Behaviour Teams prepare future pet owners to take responsibility and look after their pets for life.",
                            user: charity_users[16]
                           )
the_conservation_foundation = Charity.create!(charity_name: 'Conservation Fund',
                          category: 'Environment',
                          description: "The Conservation Fund creates and manages environmental projects, award schemes, awareness campaigns, publications and events covering wide ranging issues and aimed at different and diverse audiences.
                          Some include the spiritual dimension of concern for the environment. The Foundation is also an environmental incubator, helping fledgling organisations get off the ground and turning good ideas into fundable projects.",
                          user: charity_users[17]
                          )
ashden = Charity.create!(charity_name: 'Ashden',
                          category: 'Environment',
                          description: "Ashden's mission is to accelerate transformative climate solutions and build a more just world. Our awards, events, networks and analysis support climate innovation in the UK and developing countries around the world. Climate champions, organisations on the frontline of the climate crisis, are creating something extraordinary. A planet powered by low-carbon start-ups, bold green policies, liveable cities, better work and clean energy for all. We help these innovators attract investment and funding, build their networks, and create radical change. We do this because we believe in them, and their vision of a cleaner, fairer, healthier world.",
                          user: charity_users[18]
                         )

puts "Charities created"

# EMPLOYERS
employer_counter = 1
2.times do
  Employer.create!(
    company_name: Faker::Company.name,
    user: User.where(current_role: 'Employer')[employer_counter]
  )
  employer_counter += 1
end

puts "Employers created"

# VOLUNTEERS
katy_volunteer_counter = 0
4.times do
  Volunteer.create!(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    employer: katy_employer,
    description: 'TO BE WRITTEN',
    age: (18..80).to_a.sample,
    dbs_checked: [true, false].sample,
    user: User.where(current_role: 'Volunteer')[katy_volunteer_counter]
  )
  katy_volunteer_counter += 1
end

volunteer_counter = 1
6.times do
  Volunteer.create!(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    employer: Employer.where.not(company_name: "Ultra Tech").sample,
    description: 'TO BE WRITTEN',
    age: (18..80).to_a.sample,
    dbs_checked: [true, false].sample,
    user: User.where(current_role: 'Volunteer')[volunteer_counter]
  )
  volunteer_counter += 1
end

puts "Volunteers created"

# ADDRESSES
hackney_events_addresses = ["25 Weymouth Terrace, London E2 8LT",
                            "128 Hoxton St, London N1 6SH",
                            "134 Columbia Rd, London E2 7RG",
                            "130 Bethnal Green Rd, London E2 6DG",
                            "39A Hoxton Square, London N1 6NN",
                            "262 Hackney Rd, London E2 7SJ",
                            "65 Balls Pond Rd, London N1 4BW",
                            "141 De Beauvoir Rd, London N1 4DL",
                            "111B Tottenham Rd, London N1 4EA",
                            "192 Haggerston Rd, London E8 4JA",
                            "3 Nursery Ln, London E2 8AU",
                            "49 Northway Rd, London SE5 9AN",
                            "Peabody Estate, London SE5 7BD",
                            "92 Curtain Rd, London EC2A 3AA",
                            "Boyfield St, London SE1 0SB",
                            "102 Brocklehurst St, London SE14 5RA",
                            "11 Vanderbilt Rd, London SW18 3BE",
                            "14A Mandalay Rd, London SW4 9EE",
                            "5G Cliveden Pl, London SW1W 8LA",
                            "97 Royal College St, London NW1 0SE"
                            ]

west_events_addresses =  ["11C Cornwall Cres, London W11 1PH",
                          "225-227 Walmer Rd, London W11 4EY",
                          "27 Hillgate Pl, London W8 7SL",
                          "25 Bark Pl, London W2 4AT",
                          "3a Ladbroke Terrace, London W11 3PG",
                          "23 Penzance St, London W11 4QX",
                          "28 Ruston Mews, London W11 1RB",
                          "174 Kensington Park Rd, London W11 2ER",
                          "35 Chepstow Villas, London W11 3DP",
                          "3 Chepstow Villas, London W11 3EE",
                          "22 Romilly St, London W1D 5AG",
                          "14 Bedford Row, London WC1R 4ED",
                          "50 Elliott's Row, London SE11 4SZ",
                          "66 Brunswick Gardens, London W8 4AN",
                          "42 Pilgrimage St, London SE1 4LL",
                          "12 Violet Rd, London E3 3QH",
                          "45 St Maur Rd, London SW6 4DR",
                          "6 Wells Pl, London SW18 3BF",
                          "4 Henley Street, London SW11 5BZ",
                          "17 Oval Way, London SE11 5RR"]

# EVENT NAMES
event_names =  ["Paws for the Cause",
                "The Crucial Cause",
                "Together We Fight",
                "Donate to Others",
                "Find a Fortune",
                "Cancer Research",
                "A Better life",
                "Awareness Games",
                "Clever Donations",
                "Thank a Veteran",
                "Bright Futures Fund",
                "Fortune Found",
                "Love Hands",
                "Life of Giving",
                "Dream It",
                "Secret Family",
                "Double Donation",
                "Baby Buy, Buy, Buy",
                "Support Others",
                "Bright Futures",
                "Giving Hands",
                "Smileys",
                "Ignite helpers",
                "Generous Hearts",
                "Red and Blu cross",
                "Charitable Change",
                "Together for London",
                "All For Love",
                "Give a Little",
                "Give for Good",
                "The Charity City",
                "Crits for Bits",
                "Heaven Fundraisers",
                "Service for Strength",
                "Charity for Literacy",
                "A better tomorrow",
                "Endless Battle",
                "Angel Time",
                "Sweeter Home",
                "Distribute Love"
                ]

# EVENTS

time_array = [Time.new(2021, 11, 20, 9, 0, 0),
              Time.new(2021, 11, 20, 10, 0, 0),
              Time.new(2021, 11, 20, 11, 0, 0),
              Time.new(2021, 11, 20, 12, 0, 0),
              Time.new(2021, 11, 20, 13, 0, 0),
              Time.new(2021, 11, 20, 14, 0, 0),
              Time.new(2021, 11, 20, 15, 0, 0),
              Time.new(2021, 11, 20, 10, 15, 0),
              Time.new(2021, 11, 20, 11, 30, 0),
              Time.new(2021, 11, 20, 13, 45, 0),
              Time.new(2021, 11, 20, 12, 30, 0),
              Time.new(2021, 11, 20, 9, 30, 0),
              Time.new(2021, 11, 20, 10, 45, 0)]

# CHAT DEMO EVENT
Event.create!(
    event_name: "Paws for the Cause",
    address: "11C Cornwall Cres, London W11 1PH",
    date: Faker::Date.forward(days: 2),
    start_time: time_array.sample,
    duration: (1..6).to_a.sample,
    description: "Completing the relevant training and asking questions if you are uncertain about anything. Completing all duties assigned by the supervisor and reporting any issues immediately. Observing the rules and safety regulations of the organization while carrying out tasks. Arriving on time for duty and remaining professional in your interactions with all stakeholders. Making recommendations for improvement where feasible and appropriate. Communicating with the supervisor or relevant stakeholders when you are running late or unable to fulfill your duties.",
    number_positions: (1..10).to_a.sample,
    charity: network_for_animals
  )

hackney_counter = 0
hackney_name_counter = 1
20.times do
  Event.create!(
    event_name: event_names[hackney_name_counter],
    address: hackney_events_addresses[hackney_counter],
    date: Faker::Date.forward(days: 2),
    start_time: time_array.sample,
    duration: (1..6).to_a.sample,
    description: "Completing the relevant training and asking questions if you are uncertain about anything. Completing all duties assigned by the supervisor and reporting any issues immediately. Observing the rules and safety regulations of the organization while carrying out tasks. Arriving on time for duty and remaining professional in your interactions with all stakeholders. Making recommendations for improvement where feasible and appropriate. Communicating with the supervisor or relevant stakeholders when you are running late or unable to fulfill your duties.",
    number_positions: (1..10).to_a.sample,
    charity: Charity.all.sample
  )
  hackney_counter += 1
  hackney_name_counter += 1
end

west_counter = 1
west_name_counter = 20
19.times do
  Event.create!(
    event_name: event_names[west_name_counter],
    address: west_events_addresses[west_counter],
    date: Faker::Date.forward(days: 2),
    start_time: time_array.sample,
    duration: (1..6).to_a.sample,
    description: "Completing the relevant training and asking questions if you are uncertain about anything. Completing all duties assigned by the supervisor and reporting any issues immediately. Observing the rules and safety regulations of the organization while carrying out tasks. Arriving on time for duty and remaining professional in your interactions with all stakeholders. Making recommendations for improvement where feasible and appropriate. Communicating with the supervisor or relevant stakeholders when you are running late or unable to fulfill your duties.",
    number_positions: (1..10).to_a.sample,
    charity: Charity.all.sample
  )
  west_counter += 1
  west_name_counter += 1
end

# PEPE EVENTS AND BOOKINGS

pepe_event_1 = Event.create!(
  event_name: event_names[0],
  address: west_events_addresses[2],
  date: Date.new(2021, 11, 1),
  start_time: Time.new(2021, 11, 29, 14, 30, 0),
  duration: 5,
  description: "Completing the relevant training and asking questions if you are uncertain about anything. Completing all duties assigned by the supervisor and reporting any issues immediately. Observing the rules and safety regulations of the organization while carrying out tasks. Arriving on time for duty and remaining professional in your interactions with all stakeholders. Making recommendations for improvement where feasible and appropriate. Communicating with the supervisor or relevant stakeholders when you are running late or unable to fulfill your duties.",
  number_positions: (1..10).to_a.sample,
  charity: the_drake_trust
)

pepe_event_2 = Event.create!(
  event_name: event_names[6],
  address: hackney_events_addresses[5],
  date: Date.new(2021, 11, 12),
  start_time: Time.new(2021, 11, 18, 9, 0, 0),
  duration: 4,
  description: "Completing the relevant training and asking questions if you are uncertain about anything. Completing all duties assigned by the supervisor and reporting any issues immediately. Observing the rules and safety regulations of the organization while carrying out tasks. Arriving on time for duty and remaining professional in your interactions with all stakeholders. Making recommendations for improvement where feasible and appropriate. Communicating with the supervisor or relevant stakeholders when you are running late or unable to fulfill your duties.",
  number_positions: (1..10).to_a.sample,
  charity: humane_society_international
)

pepe_event_3 = Event.create!(
  event_name: event_names[7],
  address: hackney_events_addresses[7],
  date: Date.new(2021, 11, 29),
  start_time: Time.new(2021, 11, 20, 11, 0, 0),
  duration: 6,
  description: "Completing the relevant training and asking questions if you are uncertain about anything. Completing all duties assigned by the supervisor and reporting any issues immediately. Observing the rules and safety regulations of the organization while carrying out tasks. Arriving on time for duty and remaining professional in your interactions with all stakeholders. Making recommendations for improvement where feasible and appropriate. Communicating with the supervisor or relevant stakeholders when you are running late or unable to fulfill your duties.",
  number_positions: (1..10).to_a.sample,
  charity: the_conservation_foundation
)

sport_event = Event.create!(
  event_name: "Double Donation",
  address: hackney_events_addresses[7],
  date: Date.new(2021, 11, 22),
  start_time: Time.new(2021, 11, 20, 11, 0, 0),
  duration: 4,
  description: "Completing the relevant training and asking questions if you are uncertain about anything. Completing all duties assigned by the supervisor and reporting any issues immediately. Observing the rules and safety regulations of the organization while carrying out tasks. Arriving on time for duty and remaining professional in your interactions with all stakeholders. Making recommendations for improvement where feasible and appropriate. Communicating with the supervisor or relevant stakeholders when you are running late or unable to fulfill your duties.",
  number_positions: (1..10).to_a.sample,
  charity: chelsea_foundation
)

charity_shop_event = Event.create!(
  event_name: "Generous Hearts",
  address: hackney_events_addresses[7],
  date: Date.new(2021, 11, 28),
  start_time: Time.new(2021, 11, 20, 9, 0, 0),
  duration: 6,
  description: "Completing the relevant training and asking questions if you are uncertain about anything. Completing all duties assigned by the supervisor and reporting any issues immediately. Observing the rules and safety regulations of the organization while carrying out tasks. Arriving on time for duty and remaining professional in your interactions with all stakeholders. Making recommendations for improvement where feasible and appropriate. Communicating with the supervisor or relevant stakeholders when you are running late or unable to fulfill your duties.",
  number_positions: (1..10).to_a.sample,
  charity: marie_curie
)

Booking.create!(
  event: pepe_event_1,
  volunteer: pepe_volunteer,
  employer_associated: true
)

Booking.create!(
  event: pepe_event_2,
  volunteer: pepe_volunteer,
  employer_associated: true
)

Booking.create!(
  event: pepe_event_3,
  volunteer: pepe_volunteer,
  employer_associated: true
)

Booking.create!(
  event: sport_event,
  volunteer: Volunteer.where(employer: katy_employer)[1],
  employer_associated: true
)

Booking.create!(
  event: charity_shop_event,
  volunteer: Volunteer.where(employer: katy_employer)[2],
  employer_associated: true
)

Booking.create!(
  event: sport_event,
  volunteer: Volunteer.where(employer: katy_employer)[2],
  employer_associated: true
)

Booking.create!(
  event: pepe_event_1,
  volunteer: Volunteer.where(employer: katy_employer)[4],
  employer_associated: true
)

puts "Events and bookings created"

puts "You're fully seeded"
