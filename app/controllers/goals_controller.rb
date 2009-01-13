class GoalsController < ApplicationController
  layout false
  
  def index
    @goals = Goal.find(:all)
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(params[:goal])
    if @goal.save
      flash[:notice] = "Successfully saved goal."
      redirect_to goal_path(@goal)
    else
      render :action => 'new'
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(params[:goal])
      flash[:notice] = "Successfully updated goal."
      redirect_to goal_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    flash[:notice] = "Successfully destroyed goal."
    redirect_to goals_path
  end

end
