require_relative('./models/customer')
require_relative('./models/film')
require_relative('./models/screening')
require_relative('./models/ticket')

require('pry-byebug')


Ticket.delete_all
Screening.delete_all
Film.delete_all
Customer.delete_all

num_customers = 10
num_films = 10
num_screenings = 10
num_tickets = 10

customers = (1..num_customers).map do |i|
  Customer.new({'name' => 'Cname'+i.to_s, 'funds' => 100*i})
end
(1..num_customers).each {|i| customers[i-1].save}

films = (1..num_films).map do |i|
  Film.new({'title' => 'Ftitle'+i.to_s, 'price' => 1*i})
end
(1..num_films).each {|i| films[i-1].save}

# print films

screenings = (1..num_screenings).map do |i|
  Screening.new({'screen' => i, 'start_time' => (12+i).to_s + ":00", 'capacity' => 10*i, 'film_id' => films[i-1].id})
end
(1..num_screenings).each {|i| screenings[i-1].save}

tickets = (1..num_tickets).map do |i|
  Ticket.new({'customer_id' => customers[i-1].id, 'screening_id' => screenings[i-1].id})
end
(1..num_tickets).each {|i| tickets[i-1].save}


binding.pry
nil
