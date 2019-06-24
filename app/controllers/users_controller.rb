class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:confirmation, :confirmation_store]

end
