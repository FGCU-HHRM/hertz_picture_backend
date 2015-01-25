class ProductsController < ApplicationController
  before_action :loggedIn
  before_action :set_one, only: [:show, :edit, :update, :destroy, :history, :prerent, :postrent, :prereturn, :postreturn]
  before_action :set_all, only: [:index]
  
  def index
  end
  
  def show
    @transactions = @product.transactions
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(post_params)

    respond_to do |format|
      if @product.save
        @success = 1
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :create }
      else
        @success = 0
        @message = "could not save"
        format.html { render :new }
        format.json { render :create }
      end
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end

  def history
  end

  def prerent
  end

  def postrent
    @transaction = Transaction.new(product_id: params[:id])
    File.open('uploads/transaction/'+@transaction.id+'/' + mount(params[:pic_id]), "w+") do |f|
      f.write(debug(params))
    end
    File.open('uploads/transaction/testparams', "w+") do |f|
      f.write(debug(params))
    end
  end

  def prereturn
  end

  def postreturn
  end

  private
  
    def loggedIn
      @user = User.find_by(id: session[:user_id])
      if @user.nil?
        redirect_to login_url
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_one
      @product = Product.find(params[:id])
      if @product.nil?
        
      else
        @trans = Transaction.where(product_id: @product.id)
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_all
      @products = Product.all
      @num_products = @products.nil? ? 0 : @products.size()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:product).permit(:ic,:name)
    end
    
    def mount( i )
      mounts = ['north','north_east','north_west','south','south_east','south_west','easst','west']
      mounts[i]
    end
end
