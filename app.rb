require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hi)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f 
  @the_result = Math.sqrt(@the_num)
  erb(:square_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random_new/results") do 
  @min_num = params.fetch("user_min").to_f
  @max_num = params.fetch("user_max").to_f
  @random_num = rand(@min_num .. @max_num)
  erb(:random_new_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payments/new/results") do
  apr = params.fetch("users_apr").to_f / 100 / 12 # Keep APR as a float for calculation
  @payment_years = params.fetch("users_num_years").to_i * 12
  principal = params.fetch("users_principal").to_f
  monthly_payment = principal * apr / (1 - (1 + apr) ** -@payment_years)
  
  @payment_apr = apr.to_fs(:percentage, { :precision => 4 }) # Format for display
  @payment_principal = principal.to_fs(:currency, { :precision => 2 })
  @monthly_payment = monthly_payment.to_fs(:currency, { :precision => 2 }) # Format the result

  erb(:payments_new_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
