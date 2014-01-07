class LandingPagesController < ApplicationController

  def new
    @landing_page = LandingPage.new
    @landing_page.build_owner
  end

  def create
    @landing_page = LandingPage.new(landing_page_params)
    if @landing_page.save
      redirect_to root_path, notice: 'Signed up successfully'
    else
      render action: 'new'
    end
  end

  private
    def landing_page_params
      params.require(:landing_page).permit(:url, owner_attributes: [:name, :email, :password, :password_confirmation])
    end
end