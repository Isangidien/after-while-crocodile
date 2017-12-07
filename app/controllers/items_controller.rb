class ItemsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @item = Item.new
  end

  def create
    @user = User.find(params[:user_id])
    @items = @user.items
    @item = current_user.items.build(item_params)
    @item.user = @user
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Your item was saved."
    else
      flash[:error] = "There was an error saving your item."
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item completed!"
    else
      flash[:alert] = "There was an error deleting the item, please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :body)
  end
end
