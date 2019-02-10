class ProfileController < ApplicationController

	def index
	end

  def new
  	@profile = Profile.new()
  end

  def create
  	# begin
	  	params_to_save = params.require(:profile).permit!.to_h
	  	@profile = Profile.new(params_to_save)
	  	@profile.save!
	  # rescue Exception => e 
	  # end
  	render :index
  end
end
