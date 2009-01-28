class GoalsController < ApplicationController

  before_filter :redirect_if_not_logged_in
  
  def tags
    @popular_tags = Tag.top_ten
  end
  
  def index
    @goals = current_user.goals.find(:all)
  end

  def show
    @goal = current_user.goals.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(params[:goal])
    # @goal.tag_with_string params[:list_o_tags]
    if @goal.save
      flash[:notice] = "Successfully saved goal."
      redirect_to goal_path(@goal)
    else
      render :action => 'new'
    end
    
    # on error destroy orphaned tags?
  end

  def edit
    @goal = current_user.goals.find(params[:id])
  end

  def update
    params[:tags_for_existing] ||= ""

    @goal = current_user.goals.find(params[:id])
    if @goal.update_attributes(params[:goal])
      flash[:notice] = "Successfully updated goal."
      redirect_to goal_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @goal = current_user.goals.find(params[:id])
    @goal.destroy
    flash[:notice] = "Successfully destroyed goal."
    redirect_to goals_path
  end

end
