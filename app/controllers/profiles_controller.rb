class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to profiles_url, notice: "Palabras claves almacenadas."
    else
      flash["alert"] = "Error, verifique e intente nuevamente"
      redirect_to new_profile_url
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to profiles_url, notice: "Palabras claves actualizadas."
    else
      flash["alert"] = "Error, verifique e intente nuevamente"
      redirect_to edit_profile_url
    end 
  end

  private

  def profile_params
    params.require(:profile).permit(:keywords)
  end
end
