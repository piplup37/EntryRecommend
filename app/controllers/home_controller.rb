# coding: utf-8 

class HomeController < ApplicationController
	skip_before_filter :authenticate_user!
  def index
  end
  
  def list
  	@subjects = Subject.all
  end

end
