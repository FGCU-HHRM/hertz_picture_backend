class TransactionsController < ApplicationController
  before_action :loggedIn
  
  def search
  end
  
  def index
  end
  
  def initiate
    @transaction = Transaction.new
    @product = Product.find(params[:id])
  end
  
  def submit
    
    @product = Product.find(params[:id])
    @transaction = Transaction.new(post_params)
    @transaction.product_id = @product.id
    
    if @transaction.save
        redirect_to @product, :notice => "Transaction Saved"
      else
        redirect_to root_path
    end
    
  end
  
  def show
    @transaction = Transaction.find(params[:id])
    @product = Product.find(@transaction.product_id)
    @ic = @transaction.product.ic
    @pics = @transaction.image
  end
  
  def new
   @product = Product.new
  end

  def destroy
  end
  
  def create
    @ic = params[:product][:ic]
    @product = Product.find_by(ic: @ic)
    if !@product.nil?
      redirect_to @product
    else
      redirect_to new_product_path, :alert => "Equipment with given IC# does not exist. Please create new Equipment below."
    end
  end
  
  private
  
  def loggedIn
      @user = User.find_by(id: session[:user_id])
      if @user.nil?
        redirect_to login_url
      end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:transaction).permit(:transtype,:north,:north_east,:north_west,:south_east,:south_west,:east,:west)
    end
  
end
