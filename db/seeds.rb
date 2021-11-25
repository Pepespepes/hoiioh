# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# %w[Animal Human\ Services Children Health Education Environment]

require 'faker'

Employer.destroy_all
User.destroy_all
Volunteer.destroy_all
Charity.destroy_all
Event.destroy_all
Booking.destroy_all
Review.destroy_all


# DEMO USER - EMPLOYER
emma_user = User.create!(email: "emma123@gmail.com", password: '123123', current_role: 'Employer')
# DEMO USER - VOLUNTEER
pepe_user = User.create!(email: "pepe.pepe@gmail.com", password: '123123', current_role: 'Volunteer')

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

# CHARITIES
food_cycle = Charity.create!(charity_name: 'FoodCycle Hackney',
                             category: 'Human Services',
                             description: 'Come and enjoy company and conversation with others from your local area over a delicious meal, prepared with care by FoodCycle volunteers. Everyone is welcome, no matter your background or circumstances. No referral needed, just turn up.',
                             user: User.where(current_role: 'Charity')[0]
                            )
skyway = Charity.create!(charity_name: 'Skyway',
                             category: 'Human Services',
                             description: 'We offer a wide range of free-to-access opportunities at youth clubs, community venues, parks, estates, schools and on the streets. Some of the sessions we run focus on developing new skills, learning or participating in sport, but we recognise the most important things are to provide safe, welcoming spaces where people can relax, socialise and have fun.',
                             user: User.where(current_role: 'Charity')[1]
                            )
national_childrens_bureau = Charity.create!(charity_name: "National Children's Bureau",
                             category: 'Children',
                             description: 'As a society we provide a vital system of support and services to keep children safe and give them the best childhood. For over 50 years NCB has been driving change throughout this system to make it as effective as possible and to protect the children whose welfare is most at risk.',
                             user: User.where(current_role: 'Charity')[2]
                            )
child_hope = Charity.create!(charity_name: 'Child Hope',
                             category: 'Children',
                             description: 'Every child has the right to a safe and secure childhood, but for many these rights are denied. Born into extreme poverty and violence, they are at high risk of exploitation and abuse. Our purpose is to draw out and build on the strengths of children and those around them to tackle injustice. Looking at root causes, such as poverty and inequality, we also focus on influencing the policies and systems that can and must be changed to enable children to thrive.',
                             user: User.where(current_role: 'Charity')[3]
                            )
hackney_friends_of_the_earth = Charity.create!(charity_name: 'Hackney and Tower Hamlets Friends of the Earth',
                             category: 'Environment',
                             description: 'We are part of an international community dedicated to protecting the natural world and the wellbeing of everyone in it. We lead campaigns, provide resources and information, and drive real solutions to the environmental problems facing us all.',
                             user: User.where(current_role: 'Charity')[4]
                            )
inspire = Charity.create!(charity_name: 'Inspire!',
                             category: 'Education',
                             description: 'Our vision is for all young people to reach their full potential, realise their ambitions and build fulfilling careers and lives. The London Borough of Hackney and surrounding areas have seen a vast improvement in academic achievement since we began in 2004. However, youth unemployment in London remains high. Many young people still lack the knowledge, skills and aspirations needed to build fulfilling careers. We believe that preparing young people for the future is as important as ever.',
                             user: User.where(current_role: 'Charity')[5]
                            )
caramel_rock = Charity.create!(charity_name: 'Caramel Rock',
                             category: 'Education',
                             description: 'We are an educational and creative arts charity that provides training and development to young people and young adults. We offer a range of accredited courses and apprenticeships. Caramel Rock is committed to developing the next generation of creatives, giving people the opportunity to access resources and gain work experience in the creative arts. Our aim is to advance the education for disadvantage young people in the fashion and creative arts sector.',
                             user: User.where(current_role: 'Charity')[6]
                            )
helping_hackney_health = Charity.create!(charity_name: 'Helping Hackney Health',
                             category: 'Health',
                             description: "Helping Hackney Health was set up in memory of the late Dr Gaby Tobias to improve the nutritional health and well being of Hackney residents, especially those with particular health needs or with fewer opportunities. We do this by providing free cook and eat classes from our purpose built kitchen at the Well Street GP practice. Gaby's Kitchen was paid for by donations.",
                             user: User.where(current_role: 'Charity')[7]
                            )
humane_society_international = Charity.create!(charity_name: 'Humane Society International',
                             category: 'Animal',
                             description: "Humane Society International works around the globe to promote the human-animal bond, rescue and protect dogs and cats, improve farm animal welfare, protect wildlife, promote animal-free testing and research, respond to natural disasters and confront cruelty to animals in all of its forms.",
                             user: User.where(current_role: 'Charity')[8]
                            )
network_for_animals = Charity.create!(charity_name: 'Network For Animals',
                             category: 'Animal',
                             description: "We financially support and provide logistical help for animal shelters, animal welfare initiatives and, importantly, raise public awareness about animal issues. Dogs, cats, horses and donkeys are among the animals who benefit from the work we do with the help of our nearly million supporters, who live all over the world.",
                             user: User.where(current_role: 'Charity')[9]
                            )
rugby_portobello_trust = Charity.create!(charity_name: 'Rugby Portobello Trust',
                             category: 'Children',
                             description: "RPT is a children's, youth and family support charity that has been operating in North Kensington for over 130 years. We provide a range of sporting, cultural and educational activities which are delivered in the daytime, evenings and during holidays, both on and off site.",
                             user: User.where(current_role: 'Charity')[10]
                            )
the_drake_trust = Charity.create!(charity_name: 'The Drake Trust',
                            category: 'Education',
                            description: "The Drake Trust is an architectural conservation charity that gives grants for education and training in building conservation. Set up in 1992 it provides funding for educational institutions, groups and individuals to provide skills training and information on building conservation.",
                            user: User.where(current_role: 'Charity')[11]
                           )
hestia = Charity.create!(charity_name: 'Hestia',
                           category: 'Human Services',
                           description: "At Hestia we support adults and children in times of crisis. We deliver services across London and the surrounding regions, as well as campaign and advocate nationally on the issues that affect the people we work with. Last year we supported 15,238 men, women and children. This includes victims of modern slavery, women and children who have experienced domestic abuse, young care leavers and older people. From giving someone a home, to helping them to get the right mental health support, we support people at the moment of crisis and enable them to build a life beyond a crisis.",
                           user: User.where(current_role: 'Charity')[12]
                          )
tiko_foundation = Charity.create!(charity_name: 'Tiko Foundation',
                          category: 'Education',
                          description: "We fund young asylum seekers or young people with limited leave through higher education in the UK who are not entitled to student finance and cannot otherwise afford the costs of higher education. We fund this group of young people because their immigration status does not allow them to secure student finance and therefore does not allow them to access and progress in higher education, despite legally being allowed to live in the UK.",
                          user: User.where(current_role: 'Charity')[13]
                         )
british_exploring_society = Charity.create!(charity_name: 'British Exploring Society',
                         category: 'Children',
                         description: "British Exploring Society is a world class youth development charity with a unique heritage, founded on the belief that challenging experiences can transform lives, empowering and equipping young people with the courage, skills, resilience and determination to make the most of their future. Most young people return with increased self-belief, a dynamic peer group and the determination and ability to make the most of their future, regardless of where they started out.",
                         user: User.where(current_role: 'Charity')[14]
                        )
welfare_association = Charity.create!(charity_name: 'British Exploring Society',
                        category: 'Human Services',
                        description: "The Welfare Association (WA) was registered with the Charity Commission of England and Wales in 1993 (Registered charity number No. 1020238) and works to support some of the most marginalised Palestinian families and communities in the West Bank and Gaza and in the refugee camps and gatherings of Lebanon. Our international development and emergency relief projects are funded through the EC, DFID, UK trusts, foundations, British public and through fundraising events.",
                        user: User.where(current_role: 'Charity')[15]
                       )
healthwatch = Charity.create!(charity_name: 'Healthwatch Central West London',
                       category: 'Health',
                       description: "We believe that the best way to improve local services is to listen to the people who use them. Our mission is to enable local residents, patients, and carers to have a say in how local services are shaped and to help guide you to the information and services you need. We are working to gather the best evidence and the widest range of views, especially those from minority groups, ethnic minority groups, people living with disabilities, older people, and younger people.",
                       user: User.where(current_role: 'Charity')[16]
                      )
blue_cross_for_pets = Charity.create!(charity_name: 'Blue Cross for Pets Hammersmith',
                      category: 'Animal',
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

employer_counter = 0
3.times do
  Employer.create!(
    company_name: Faker::Company.name,
    user: User.where(current_role: 'Employer')[employer_counter]
  )
  employer_counter += 1
end

volunteer_counter = 0
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

charity_counter = 0
40.times do
  Event.create!(
    address: Faker::Address.full_address,
    date: Faker::Date.forward(days: 2),
    start_time: Time.now,
    duration: (1..8).to_a.sample,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    number_positions: (1..10).to_a.sample,
    charity: Charity.all.sample
  )
  charity_counter += 1
end
