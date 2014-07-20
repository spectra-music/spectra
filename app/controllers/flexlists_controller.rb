class FlexlistsController < ApplicationController
  before_action :set_flexlist, only: [:show, :edit, :update, :destroy]

  # GET /flexlists
  def index
    @flexlists = Flexlist.all
  end

  # GET /flexlists/1
  def show
  end

  # POST /flexlists
  def create
    @flexlist = Flexlist.new(flexlist_params)

    if @flexlist.save
      render json: { flexlist: @flexlist, notice: 'Flexlist was successfully created.' }, status: :created, location: @flexlist
    else
      render json: { errors: @flexlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flexlists/1
  def update
    if @flexlist.update(flexlist_params)
      render json: {flexlist: @flexlist.slug, notice: 'Flexlist was successfully updated.'}, status: :ok, location: @flexlist
    else
      render json: { errors: @flexlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /flexlists/1
  def destroy
    @flexlist.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flexlist
      @flexlist = Flexlist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flexlist_params
      params.require(:flexlist).permit(:name, :match)
    end
end
