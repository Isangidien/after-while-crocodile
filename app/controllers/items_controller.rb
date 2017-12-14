class ItemsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      flash[:notice] = "Your item was saved."
    else
      flash[:error] = "There was an error saving your item."
    end

    @items = @user.items

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was completed."
    else
      flash[:error] = "Item couldn't be removed. Try again."
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :body)
  end
end
