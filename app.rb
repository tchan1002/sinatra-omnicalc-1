require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @sq_number = params.fetch("number").to_f
  @sq_result = @sq_number ** 2
 erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @sqroot_number = params.fetch("number").to_f
  @sqroot_result = @sqroot_number ** 0.5
 erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr = params["user_apr"].to_f
  @years = params["user_years"].to_i
  @principal = params["user_pv"].to_f
  @interest_rate = @apr/100/12
  @months = @years * 12
  @payment = @interest_rate * @principal / (1 - (1+@interest_rate)**-@months )

 erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @result = rand(@min..@max)
  erb(:random_results)
end



#Rails.application.routes.draw do
  #get("/",{:controller => "morty", :action => "square_new"})
  #get("/square/results",{:controller => "morty", :action => "square_results"})
  #get("/square_root/new",{:controller => "morty", :action => "square_root_new"})
  #get("/payment/new",{:controller => "morty", :action => "payment_new"})
  #get("/payment/results",{:controller => "morty", :action => "payment_results"})
  #get("/random/new",{:controller => "morty", :action => "random_new"})
  #get("/random/results",{:controller => "morty", :action => "random_results"})
#end
