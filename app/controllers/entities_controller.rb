class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  # GET /entities
  # GET /entities.json
  def index
    @entities = Entity.all
  end

  def all
    @entities = Entity.all
  end

  def all_only_position
    @entities = Entity.all
    @body = [@entities.length]
    count = 0
    @entities.each do |item|
      @body[count] = {
          "id" => item.id,
          "latitude" => item.latitude,
          "longitude" => item.longtitude
      }
      count += 1
    end

    puts @body.to_json

    render :text => @body.to_json
=begin

    respond_to do |format|
      if params[:callback]
        format.js { render :json => {:running => @body}, :callback => params[:callback] }
      else
        format.json { render json: {:running => @body} }
      end
    end
=end
  end

  def game
    @entities = Entity.all
  end
  

  # GET /entities/1
  # GET /entities/1.json
  def show
  end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit
  end

  # POST /entities
  # POST /entities.json
  def create

    @entity = Entity.new()

    if params[:entity][:image]
      @entity.image = params[:entity][:image].read
      @entity.filename = params[:entity][:image].original_filename
      @entity.mime_type = params[:entity][:image].content_type
    end

    @entity.latitude = params[:entity][:latitude]
    @entity.longtitude = params[:entity][:longtitude]

    if @entity.save
      redirect_to(@entity, :notice => 'Photo was successfully created.')
    else
      render :action => "new"
    end

    respond_to do |format|
      if @entity.save
        format.html { redirect_to @entity, notice: 'Entity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @entity }
      else
        format.html { render action: 'new' }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_new

    @entity = Entity.new()

    if params[:file]
      @entity.image = params[:file].read
      @entity.filename = params[:file].original_filename
      @entity.mine_type = params[:file].content_type
    end

    @entity.latitude = params[:latitude]
    @entity.longtitude = params[:longitude]

    @entity.save
  end

  def load_image
    @entity = Entity.find(params[:id])
    puts @entity.mine_type + " " + @entity.filename
    send_data(@entity.image, :type => @entity.mine_type, :filename => "#{ @entity.filename }.jpg", :disposition => "inline")
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to @entity, notice: 'Entity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @entity.destroy
    respond_to do |format|
      format.html { redirect_to entities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_params
      params.require(:entity).permit(:image, :latitude, :longitude, :mine_type, :filename)
    end
end
