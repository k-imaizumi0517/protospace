class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototypes = Prototype.all
    respond_to do |format|
    format.html
    format.json
    end
    # render "show"
    # redirect_to :root, notice: 'like was successfully created'
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    like.destroy
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototypes = Prototype.all
    respond_to do |format|
    format.html
    format.json
    end
    # render "show"
    # redirect_to :root, notice: 'like was successfully deleted'
  end
end
