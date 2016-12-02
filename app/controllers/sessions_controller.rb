class SessionsController < ApplicationController
  def setup
    strategy = request.env['omniauth.strategy']
    strategy_name = 'facebook'
    binding.pry
    render :text => "Setup complete.", status: 404
  end

  def create
    access_token = request.env['omniauth.auth']['credentials']['token']
    facebook_app = ConnectedApp.where(name: 'facebook').first
    facebook_app.access_token = access_token
    facebook_app.save!
    
    redirect_to '/', status: 302
  end
end
