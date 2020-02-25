class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  def home
  end

  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def home
    @items = Item.all
  end

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      flash[:notice] = "Added a new item!"
      redirect_to @item
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if @item.update(item_params)
      flash[:notice] = "You've updated your item! "
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to home_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :state, :description, :category, :address, :reward, :photo)
  end
end