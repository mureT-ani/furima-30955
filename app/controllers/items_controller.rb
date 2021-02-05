class ItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit]
  before_action :seller_check, only: :edit
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
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
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :fee_id, :area_id, :days_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def seller_check
    item = Item.find(params[:id])
    redirect_to root_path if current_user.id != item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
