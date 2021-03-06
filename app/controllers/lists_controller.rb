class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    puts params[:email]
    if params[:email]
      # puts params[:email]
      user = User.find_by_email(params[:email])
      puts user.f_name
      render json: user.lists.all()
    else
      @lists = current_user.lists.all()
    end
    
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @list = set_list
    @list_items = @list.list_items.all()

  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    if params[:email]
      @list.user = User.find_by_email(params[:email])
    else
      @list.user = current_user
    end
    
    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end
    # def item_params
    #   params.require(:list_item).permit(:quantity, :name, :list_id)
    # end
    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:note, :email)
    end
end
