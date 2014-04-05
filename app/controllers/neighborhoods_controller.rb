class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: [:show, :edit, :update, :destroy]

  # GET /neighborhoods
  # GET /neighborhoods.json
  def index
    @neighborhoods = Neighborhood.all
  end

  # GET /neighborhoods/1
  # GET /neighborhoods/1.json
  def show
    wiki = LocalwikiClient.new
    @localwiki_pages = wiki.list :pages, {
      region__slug: 'seattle',
      tags: @neighborhood.name.downcase.gsub(/\s+/, '') 
    }
  end

  # GET /neighborhoods/new
  def new
    authorize! :manage, @neighborhood
    @neighborhood = Neighborhood.new
  end

  # GET /neighborhoods/1/edit
  def edit
    authorize! :manage, @neighborhood
  end

  # POST /neighborhoods
  # POST /neighborhoods.json
  def create
    authorize! :manage, @neighborhood
    @neighborhood = Neighborhood.new(neighborhood_params)
    wiki = LocalwikiClient.new

    res = wiki.fetch_map @neighborhood.name.downcase
    geom = res['results'][0]['geom']
    @neighborhood.geometry = geom.to_json

    respond_to do |format|
      if @neighborhood.save
        format.html { redirect_to @neighborhood, notice: 'Neighborhood was successfully created.' }
        format.json { render action: 'show', status: :created, location: @neighborhood }
      else
        format.html { render action: 'new' }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /neighborhoods/1
  # PATCH/PUT /neighborhoods/1.json
  def update
    authorize! :manage, @neighborhood
    respond_to do |format|
      if @neighborhood.update(neighborhood_params)
        format.html { redirect_to @neighborhood, notice: 'Neighborhood was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neighborhoods/1
  # DELETE /neighborhoods/1.json
  def destroy
    authorize! :manage, @neighborhood
    @neighborhood.destroy
    respond_to do |format|
      format.html { redirect_to neighborhoods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neighborhood
      @neighborhood = Neighborhood.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def neighborhood_params
      params.require(:neighborhood).permit(:name, :description, :geometry)
    end
end
