# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# %w[Animal Human\ Services Children Health Education Environment]

require 'faker'


Booking.destroy_all
Event.destroy_all
Volunteer.destroy_all
Employer.destroy_all
Charity.destroy_all
User.destroy_all
Review.destroy_all

puts "Old seeds destroyed"

# DEMO USER - EMPLOYER
katy_user = User.create!(email: "emma@gmail.com", password: '123123', current_role: 'Employer')

Employer.create!(
  company_name: Faker::Company.name,
  user: katy_user
)

# DEMO USER - VOLUNTEER
pepe_user = User.create!(email: "pepe@gmail.com", password: '123123', current_role: 'Volunteer')

pepe_volunteer = Volunteer.create!(
                    first_name: 'Pepe',
                    last_name: 'Baena',
                    employer: Employer.all.sample,
                    description:"I like helping and volunteering and dedicate a bit of time to the causes that are closer to my heart. Specially those that involve people and animals. Issues of human rights and identity are also quite dear to me and often support those causes too. I believe that in order to change the environment you live in, you need to change yourself first, and by helping others when I can I hope I will be living in a more humane and better world.",
                    age: (18..80).to_a.sample,
                    dbs_checked: false,
                    user: pepe_user
                  )

puts "Demo users created"

# OTHER USERS
20.times do
  User.create!(
    email: "#{Faker::Name.unique.first_name}@charity.com",
    password: '123123',
    current_role: 'Charity'
  )
end

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

# CHARITIES
food_cycle = Charity.create!(charity_name: 'FoodCycle Hackney',
                             category: 'Human Welfare',
                             description: 'Come and enjoy company and conversation with others from your local area over a delicious meal, prepared with care by FoodCycle volunteers. Everyone is welcome, no matter your background or circumstances. No referral needed, just turn up.',
                             user: User.where(current_role: 'Charity')[0]
                            )
skyway = Charity.create!(charity_name: 'Skyway',
                             category: 'Human Welfare',
                             description: 'We offer a wide range of free-to-access opportunities at youth clubs, community venues, parks, estates, schools and on the streets. Some of the sessions we run focus on developing new skills, learning or participating in sport, but we recognise the most important things are to provide safe, welcoming spaces where people can relax, socialise and have fun.',
                             user: User.where(current_role: 'Charity')[1]
                            )
national_childrens_bureau = Charity.create!(charity_name: "National Children's Bureau",
                             category: 'Human Welfare',
                             description: 'As a society we provide a vital system of support and services to keep children safe and give them the best childhood. For over 50 years NCB has been driving change throughout this system to make it as effective as possible and to protect the children whose welfare is most at risk.',
                             user: User.where(current_role: 'Charity')[2]
                            )
child_hope = Charity.create!(charity_name: 'Child Hope',
                             category: 'Human Welfare',
                             description: 'Every child has the right to a safe and secure childhood, but for many these rights are denied. Born into extreme poverty and violence, they are at high risk of exploitation and abuse. Our purpose is to draw out and build on the strengths of children and those around them to tackle injustice. Looking at root causes, such as poverty and inequality, we also focus on influencing the policies and systems that can and must be changed to enable children to thrive.',
                             user: User.where(current_role: 'Charity')[3]
                            )
hackney_friends_of_the_earth = Charity.create!(charity_name: 'Friends of the Earth',
                             category: 'Environment',
                             description: 'We are part of an international community dedicated to protecting the natural world and the wellbeing of everyone in it. We lead campaigns, provide resources and information, and drive real solutions to the environmental problems facing us all.',
                             user: User.where(current_role: 'Charity')[4]
                            )
scope = Charity.create!(charity_name: 'Scope',
                             category: 'Human Welfare',
                             description: "We're Scope, the disability equality charity in England and Wales. We provide practical information and emotional support when it's most needed and we campaign relentlessly to create a fairer society.",
                             user: User.where(current_role: 'Charity')[5]
                            )
crisis_hackney = Charity.create!(charity_name: 'Crisis Hackney',
                             category: 'Charity Shops',
                             description: 'Charity Shops',
                             user: User.where(current_role: 'Charity')[6]
                            )
access_to_sports = Charity.create!(charity_name: 'Access to Sports Project',
                             category: 'Sports',
                             description: "The Access to Sports Project deliver a wide range of Sporting Activities for Children and Young People in Hackney, our programme is supported by Young Hackney, local community organisations, schools and the London Borough of Hackney.
",
                             user: User.where(current_role: 'Charity')[7]
                            )
humane_society_international = Charity.create!(charity_name: 'Humane Society International',
                             category: 'Animal Welfare',
                             description: "Humane Society International works around the globe to promote the human-animal bond, rescue and protect dogs and cats, improve farm animal welfare, protect wildlife, promote animal-free testing and research, respond to natural disasters and confront cruelty to animals in all of its forms.",
                             user: User.where(current_role: 'Charity')[8]
                            )
network_for_animals = Charity.create!(charity_name: 'Network For Animals',
                             category: 'Animal Welfare',
                             description: "We financially support and provide logistical help for animal shelters, animal welfare initiatives and, importantly, raise public awareness about animal issues. Dogs, cats, horses and donkeys are among the animals who benefit from the work we do with the help of our nearly million supporters, who live all over the world.",
                             user: User.where(current_role: 'Charity')[9]
                            )
rugby_portobello_trust = Charity.create!(charity_name: 'Rugby Portobello Trust',
                             category: 'Human Welfare',
                             description: "RPT is a children's, youth and family support charity that has been operating in North Kensington for over 130 years. We provide a range of sporting, cultural and educational activities which are delivered in the daytime, evenings and during holidays, both on and off site.",
                             user: User.where(current_role: 'Charity')[10]
                            )
the_drake_trust = Charity.create!(charity_name: 'The Drake Trust',
                            category: 'Human Welfare',
                            description: "The Drake Trust is an architectural conservation charity that gives grants for education and training in building conservation. Set up in 1992 it provides funding for educational institutions, groups and individuals to provide skills training and information on building conservation.",
                            user: User.where(current_role: 'Charity')[11]
                            )
hestia = Charity.create!(charity_name: 'Hestia',
                            category: 'Human Welfare',
                            description: "At Hestia we support adults and children in times of crisis. We deliver services across London and the surrounding regions, as well as campaign and advocate nationally on the issues that affect the people we work with. Last year we supported 15,238 men, women and children. This includes victims of modern slavery, women and children who have experienced domestic abuse, young care leavers and older people. From giving someone a home, to helping them to get the right mental health support, we support people at the moment of crisis and enable them to build a life beyond a crisis.",
                            user: User.where(current_role: 'Charity')[12]
                            )
red_cross = Charity.create!(charity_name: 'Portobello Red Cross',
                            category: 'Charity Shops',
                            description: "We fund young asylum seekers or young people with limited leave through higher education in the UK who are not entitled to student finance and cannot otherwise afford the costs of higher education. We fund this group of young people because their immigration status does not allow them to secure student finance and therefore does not allow them to access and progress in higher education, despite legally being allowed to live in the UK.",
                            user: User.where(current_role: 'Charity')[13]
                            )
british_exploring_society = Charity.create!(charity_name: 'British Exploring Society',
                            category: 'Human Welfare',
                            description: "British Exploring Society is a world class youth development charity with a unique heritage, founded on the belief that challenging experiences can transform lives, empowering and equipping young people with the courage, skills, resilience and determination to make the most of their future. Most young people return with increased self-belief, a dynamic peer group and the determination and ability to make the most of their future, regardless of where they started out.",
                            user: User.where(current_role: 'Charity')[14]
                           )
marie_curie = Charity.create!(charity_name: 'Portobello Marie Curie shop',
                            category: 'Charity Shops',
                            description: "Our charity shops raise funds so we can care for more people living with a terminal illness and their families. Shop, donate some items or volunteer.",
                            user: User.where(current_role: 'Charity')[15]
                           )
chelsea_foundation = Charity.create!(charity_name: 'The Chelsea Foundation',
                            category: 'Sports',
                            description: "Formed in 2010, the Chelsea Foundation brings together the Football in the Community and the Education department along with the club’s other charitable and community activities, including our international work and anti-discrimination projects.",
                            user: User.where(current_role: 'Charity')[16]
                            )
blue_cross_for_pets = Charity.create!(charity_name: 'Blue Cross for Pets Hammersmith',
                            category: 'Animal Welfare',
                            description: "Pets are at the heart of everything we do. Each year, thousands of cats, dogs, small pets and horses turn to our animal hospitals, clinics and rehoming services for treatment and to find them the happy homes they deserve. Meanwhile, our Education and Behaviour Teams prepare future pet owners to take responsibility and look after their pets for life.",
                            user: User.where(current_role: 'Charity')[17]
                           )
the_conservation_foundation = Charity.create!(charity_name: 'The Conservation Foundation',
                          category: 'Environment',
                          description: "The Conservation Foundation creates and manages environmental projects, award schemes, awareness campaigns, publications and events covering wide ranging issues and aimed at different and diverse audiences.
                          Some include the spiritual dimension of concern for the environment. The Foundation is also an environmental incubator, helping fledgling organisations get off the ground and turning good ideas into fundable projects.",
                          user: User.where(current_role: 'Charity')[18]
                          )
ashden = Charity.create!(charity_name: 'Ashden',
                          category: 'Environment',
                          description: "Ashden's mission is to accelerate transformative climate solutions and build a more just world. Our awards, events, networks and analysis support climate innovation in the UK and developing countries around the world. Climate champions, organisations on the frontline of the climate crisis, are creating something extraordinary. A planet powered by low-carbon start-ups, bold green policies, liveable cities, better work and clean energy for all. We help these innovators attract investment and funding, build their networks, and create radical change. We do this because we believe in them, and their vision of a cleaner, fairer, healthier world.",
                          user: User.where(current_role: 'Charity')[19]
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
volunteer_counter = 1
10.times do
  Volunteer.create!(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    employer: Employer.all.sample,
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
                            "44 Appleby St, London E2 8EP",
                            "84 Caroline Gardens, London E2 8AB",
                            "92 Curtain Rd, London EC2A 3AA",
                            "2 Dufferin St, London EC1Y 8PA",
                            "12 Finsbury Square, London EC2A 1AS",
                            "35 Bishops Square, Spital Square, London E1 6DY",
                            "19 Widegate St, London E1 7HP",
                            "23 Dunmore Point, London E2 7LX",
                            "129 Leman St, London E1 8EY"
                            ]

west_events_addresses =  ["11C Cornwall Cres, London W11 1PH",
                          "Walmer Courtyard, 225-227 Walmer Rd, London W11 4EY",
                          "27 Hillgate Pl, London W8 7SL",
                          "25 Bark Pl, London W2 4AT",
                          "3a Ladbroke Terrace, London W11 3PG",
                          "23 Penzance St, London W11 4QX",
                          "28 Ruston Mews, London W11 1RB",
                          "174 Kensington Park Rd, London W11 2ER",
                          "35 Chepstow Villas, London W11 3DP",
                          "3 Chepstow Villas, London W11 3EE",
                          "28 Dawson Pl, London W2 4TJ",
                          "21 Clanricarde Gardens, London W2 4JL",
                          "6 Woodsford Square, London W14 8DP",
                          "57 Palace Gardens Terrace, London W8 4RS",
                          "20 Pembridge Villas, London W11 2SU",
                          "26 Holland Park, London W11 3TD",
                          "17 Bonchurch Rd, London W10 5SD",
                          "14 Eynham Rd, London W12 0HA",
                          "100 St Ervans Rd, London W10 5QY",
                          "10 Dartmouth Cl, London W11 1DR"]

# EVENT NAMES
event_names =  ["The Crucial Cause",
                "Together We Fight",
                "Donate to Others",
                "Find a Fortune",
                "Paws for the Cause",
                "Cancer Research Charities",
                "A Better life",
                "Awareness Tournament",
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
                "Support Those Who Serve",
                "Bright Futures Education",
                "Giving Hands",
                "Smileys",
                "Ignite helpers",
                "Generous Hearts",
                "Red and Blu cross",
                "Charitable Change",
                "Together for London",
                "All For Love",
                "Give a Little",
                "Give for Good Donation",
                "The Charity City",
                "Crits for Bits",
                "Fundraisers to Heaven",
                "Service for Strength",
                "Charity for Literacy",
                "For a better tomorrow",
                "Endless Battle",
                "Angel Time",
                "Home Sweeter Home",
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

hackney_counter = 0
hackney_name_counter = 0
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

west_counter = 0
west_name_counter = 20
20.times do
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
  start_time: Time.new(2021, 11, 1, 14, 30, 0),
  duration: 5,
  description: "Completing the relevant training and asking questions if you are uncertain about anything. Completing all duties assigned by the supervisor and reporting any issues immediately. Observing the rules and safety regulations of the organization while carrying out tasks. Arriving on time for duty and remaining professional in your interactions with all stakeholders. Making recommendations for improvement where feasible and appropriate. Communicating with the supervisor or relevant stakeholders when you are running late or unable to fulfill your duties.",
  number_positions: (1..10).to_a.sample,
  charity: Charity.all.sample
)

pepe_event_2 = Event.create!(
  event_name: event_names[6],
  address: hackney_events_addresses[5],
  date: Date.new(2021, 11, 12),
  start_time: Time.new(2021, 11, 12, 9, 0, 0),
  duration: 4,
  description: "Completing the relevant training and asking questions if you are uncertain about anything. Completing all duties assigned by the supervisor and reporting any issues immediately. Observing the rules and safety regulations of the organization while carrying out tasks. Arriving on time for duty and remaining professional in your interactions with all stakeholders. Making recommendations for improvement where feasible and appropriate. Communicating with the supervisor or relevant stakeholders when you are running late or unable to fulfill your duties.",
  number_positions: (1..10).to_a.sample,
  charity: Charity.all.sample
)

pepe_event_3 = Event.create!(
  event_name: event_names[7],
  address: hackney_events_addresses[7],
  date: Date.new(2021, 11, 20),
  start_time: Time.new(2021, 11, 20, 11, 0, 0),
  duration: 6,
  description: "Completing the relevant training and asking questions if you are uncertain about anything. Completing all duties assigned by the supervisor and reporting any issues immediately. Observing the rules and safety regulations of the organization while carrying out tasks. Arriving on time for duty and remaining professional in your interactions with all stakeholders. Making recommendations for improvement where feasible and appropriate. Communicating with the supervisor or relevant stakeholders when you are running late or unable to fulfill your duties.",
  number_positions: (1..10).to_a.sample,
  charity: Charity.all.sample
)

Booking.create!(
  event: pepe_event_1,
  volunteer: pepe_volunteer,
  employer_associated: false
)

Booking.create!(
  event: pepe_event_2,
  volunteer: pepe_volunteer,
  employer_associated: false
)

Booking.create!(
  event: pepe_event_3,
  volunteer: pepe_volunteer,
  employer_associated: false
)

puts "Events and bookings created"

# 45.times do
#   Booking.create!(
#     event: Event.all.sample,
#     volunteer: Volunteer.all.sample,
#     employer_associated: [true, false].sample
#   )
# end

puts "You're fully seeded"
