require 'sinatra'
require 'sinatra/reloader' if development?


get '/:stake/:number' do
	stake = params[:stake].to_i
	number = params[:number].to_i
	roll = rand(6) + 1
	if number == roll 
		"It landed on #{roll}. Well done, you win #{6*stake} chips"
	else
		"It landed on #{roll}. You lose your take of #{number} chips"
	end
end