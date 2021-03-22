class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new ,:edit,:create, :update,:destroy]
  before_action :define_item, only: [:show,:edit,:update,:destroy]
  before_action :move_to_index, only: [:edit, :update,:destroy]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end 
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end    
  end  

  def show
    
  end 
  
  def edit
   
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path
    else 
      render :edit
    end    
  end  

  def destroy
   
    @item.destroy
    redirect_to root_path
  end  

  private
  def item_params
    params.require(:item).permit(:title ,:price ,:item_pr ,:image ,:item_status_id ,:category_id ,:shipping_day_id ,:shipping_fee_id ,:prefecture_id).merge(user_id: current_user.id)
  end  
  def move_to_index
    unless (current_user.id == @item.user.id) and @item.order.blank?
      redirect_to items_path
    end 
  end   
  def define_item
    @item = Item.find(params[:id])
  end  
end
