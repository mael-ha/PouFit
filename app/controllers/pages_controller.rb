class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :landmark ]
  def home
  end
end
