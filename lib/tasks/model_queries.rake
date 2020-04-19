namespace :db do
  task :populate_fake_data => :environment do
    # If you are curious, you may check out the file
    # RAILS_ROOT/test/factories.rb to see how fake
    # model data is created using the Faker and
    # FactoryBot gems.
    puts "Populating database"
    # 10 event venues is reasonable...
    create_list(:event_venue, 10)
    # 50 customers with orders should be alright
    create_list(:customer_with_orders, 50)
    # You may try increasing the number of events:
    create_list(:event_with_ticket_types_and_tickets, 10)
  end
  task :model_queries => :environment do
    # Sample query: Get the names of the events available and print them out.
    # Always print out a title for your query
    puts("Query 0: Sample query; show the names of the events available")
    result = Event.select(:name).distinct.map { |x| x.name }
    puts(result)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end
  task :task_2 => :environment do
    puts "Total number of different events a customer has attended"
    result = Customer.select(:name).group(:orders).count
    puts(result)
    puts("EOQ")
  end

  task :task_1 => :environment do
    puts(" total number bought by given customer")
    result = Customer.include(:tickets).count(:tickets)
    puts(result)
    puts("EOQ")
  end

  task :task3 => :environment do
    puts(" name of hte event assisted by a given customer")
    result = Event.select(:name).group(:name).where(customer.id = 001)
    puts(result)
    puts("EOQ")
  end

  task :task5 => :environment do
    puts(" total sold by an event")
    result = Ticket.group.includes(:event.name).sum(ticket_price)
    puts(result)
    puts("EOQ")
  end

  task :task7 => :environment do
    puts(" event most attended by men of 18 to 30")
    result = event.select(:name).where("customer.age >= 18 AND customer.age <= 30", {Customer.age, params[:customer.age]}).group(:event.name)
    puts(result)
    puts("EOQ")
  end


end