class BlocksController < ApplicationController
  before_action :set_block, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /blocks or /blocks.json
  def index
    @blocks = Block.all
  end

  # GET /blocks/1 or /blocks/1.json
  def show
  end

  # GET /blocks/new
  def new
    @block = Block.new
    
    # Will find landing page based on user login
    @landingpage = Landingpage.where(account_id: current_account.id).first
    
    @new_block_bool = true
  end
  
  # GET /blocks/1/edit
  def edit
    #@new_block = Block.new
    @new_block_bool = false
  end

  # POST /blocks or /blocks.json
  def create
    @landingpage = Landingpage.where(account_id: current_account.id).first
    
    @block = Block.new(block_params)
    @block.landingpage_id = @landingpage.id

    respond_to do |format|
      if @block.save
        format.html { redirect_to edit_landingpage_path(1), notice: "Block was successfully created." }
        format.json { render :show, status: :created, location: @block }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blocks/1 or /blocks/1.json
  def update
    respond_to do |format|
      if @block.update(block_params)
        # Redirect to the landing page of the current user
        format.html { redirect_to edit_landingpage_path(1), notice: "Block was successfully updated." }
        format.json { render :show, status: :ok, location: @block }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1 or /blocks/1.json
  def destroy
    @block.destroy

    respond_to do |format|
      format.html { redirect_to edit_landingpage_path(1), notice: "Block was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def block_params
      params.require(:block).permit(:block_type, :url, :landingpage_id, :content, :title)
    end
end
