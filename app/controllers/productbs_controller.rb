class ProductbsController < ApplicationController
  before_action :set_productb, only: [:show, :edit, :update, :destroy]

  # GET /productbs
  # GET /productbs.json
  def index
    @productbs = Productb.all
  end

  # GET /productbs/1
  # GET /productbs/1.json
  def show
  end

  # GET /productbs/new
  def new
    @productb = Productb.new
  end

  # GET /productbs/1/edit
  def edit
  end

  # POST /productbs
  # POST /productbs.json
  def create
    @productb = Productb.new(productb_params)

    respond_to do |format|
      if @productb.save
        format.html { redirect_to @productb, notice: 'Productb was successfully created.' }
        format.json { render action: 'show', status: :created, location: @productb }
      else
        format.html { render action: 'new' }
        format.json { render json: @productb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productbs/1
  # PATCH/PUT /productbs/1.json
  def update
    respond_to do |format|
      if @productb.update(productb_params)
        format.html { redirect_to @productb, notice: 'Productb was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @productb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productbs/1
  # DELETE /productbs/1.json
  def destroy
    @productb.destroy
    respond_to do |format|
      format.html { redirect_to productbs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productb
      @productb = Productb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productb_params
      params.require(:productb).permit(:title, :string, :description, :image_url, :price)
    end
end
