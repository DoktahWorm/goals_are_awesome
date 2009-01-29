class GoalsController < ApplicationController

  before_filter :redirect_if_not_logged_in
  
  def tags
    @popular_tags = Tag.top_ten
    respond_to do |wants|
      wants.html
    end
  end
  
  def index
    @goals = current_user.goals.find(:all)
    respond_to do |wants|
      wants.html
    end
  end

  def show
    @goal = current_user.goals.find(params[:id])
    respond_to do |wants|
      wants.html
    end
  end

  def new
    @goal = current_user.goals.new
    respond_to do |wants|
      wants.html
    end
  end

  def create
    @goal = current_user.goals.new(params[:goal])
    # @goal.tag_with_string params[:list_o_tags]
    if @goal.save
      flash[:notice] = "Successfully saved goal"
      redirect_to goal_path(@goal)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @goal = current_user.goals.find(params[:id])
    respond_to do |wants|
      wants.html
    end
  end

  def update
    params[:tags_for_existing] ||= ""
    @goal = current_user.goals.find(params[:id])
    respond_to do |wants|
      if @goal.update_attributes(params[:goal])
        flash[:notice] = 'Goal was successfully updated'
        wants.html { redirect_to([current_user, @goal]) }
        wants.xml { render :xml => @goal, :status => :created, :location => [current_user, @goal] }
      else
        wants.html { render :action => "edit" }
        wants.xml { render :xml => @goal.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @goal = current_user.goals.find(params[:id])
    @goal.destroy
    flash[:notice] = "Successfully destroyed goal"
    redirect_to goals_path
  end

end
