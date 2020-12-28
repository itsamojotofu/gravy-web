class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[edit update destroy]
  before_action :move_to_index, only: %i[edit destroy update]

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to chef_path(current_chef.id)
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:image, :about, :business_hour_begin, :business_hour_end, :status_id,
                                    :gender_id, :age_id, :genre_id)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_chef.id == @profile.chef.id
  end
end
