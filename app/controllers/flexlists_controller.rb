class FlexlistsController < ApplicationController
  before_action :set_flexlist, only: [:show, :edit, :update, :destroy]

  # GET /flexlists
  def index
    @flexlists = Flexlist.all
  end

  # GET /flexlists/1
  def show
  end

  # GET /flexlists/new
  def new
    @flexlist = Flexlist.new
  end

  # GET /flexlists/1/edit
  def edit
  end

  # POST /flexlists
  def create
    @flexlist = Flexlist.new(flexlist_params)

    if @flexlist.save
      redirect_to @flexlist, notice: 'Flexlist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /flexlists/1
  def update
    if @flexlist.update(flexlist_params)
      redirect_to @flexlist, notice: 'Flexlist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /flexlists/1
  def destroy
    @flexlist.destroy
    redirect_to flexlists_url, notice: 'Flexlist was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flexlist
      @flexlist = Flexlist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flexlist_params
      params.require(:flexlist).permit(:name)
    end
end
