class PrototypesController < ApplicationController
  before_action :set_prototype, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index, except: [:index, :show]
  
  
  # GET /prototypes or /prototypes.json
  def index
    @prototypes = Prototype.all
  end

  # GET /prototypes/1 or /prototypes/1.json
  def show
    @comment = Comment.new
    @prototype = Prototype.find(params[:id])
    @allComment = @prototype.comments
  end

  # GET /prototypes/new
  def new
    @prototype = Prototype.new
  end

  # GET /prototypes/1/edit
  def edit
    if @prototype.user_id != current_user.id
       redirect_to action: :index
    end 
    @prototype = Prototype.find(params[:id])
   
  end

  # POST /prototypes/1/edit
  def update
    prototype = Prototype.find(params[:id])
  
    prototype.assign_attributes(prototype_params) 
  
    if prototype.valid? 
      prototype.save # Lưu nếu hợp lệ
      redirect_to prototype_path(params[:id])
    else
      @prototype = prototype 
      render :edit, locals: { prototype:  @prototype }
    end    
  end


  # POST /prototypes or /prototypes.json
  def create
    if Prototype.new(prototype_params).save
      redirect_to root_path
    else
      @prototype = Prototype.new
      @prototype.assign_attributes(prototype_params) 
      @prototype.image = nil
      render :new, locals: { prototype: @prototype },status: :unprocessable_entity
    end 
  end


  # DELETE /prototypes/1 or /prototypes/1.json
  def destroy

    prototype = Prototype.find(params[:id])
    prototype.comments.destroy_all
    prototype.destroy
    redirect_to root_path

  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prototype
      @prototype = Prototype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prototype_params
      params.require(:prototype).permit(:title,:catch_copy,:concept,:image).merge(user_id: current_user.id)
    end
  
end
