class SettingsController < ApplicationController

  # GET /settings.json
  def index
    @settings = Settings.get_all
    respond_to do |format|
      # to get all items for render list
      format.json { render json: @settings }
    end
  end

  # GET /settings/:var
  def show
    @setting = Settings[params[:var]]
    respond_to do |format|
      format.json { render json: @setting }
    end
  end

  # POST /settings
  def create
    Settings[params[:var]] = settings_params[:value]
    redirect_to '/settings.json'
  end

  # PUT/PATCH /settings/:var
  def update
    record = Settings.where(var: params[:var]).first
    record.value = settings_params[:value]
    record.save!
    redirect_to '/settings.json'
  end

  # DELETE /settings/:var
  def destroy
    Settings.destroy params[:var]
    redirect_to '/settings.json'
  end

  protected
  def settings_params
    params.permit(:value)
  end
end
