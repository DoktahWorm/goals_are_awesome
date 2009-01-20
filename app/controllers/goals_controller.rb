class GoalsController < ApplicationController
  # layout false
  include AuthenticatedSystem
  before_filter :redirect_if_not_logged_in
  before_filter :requested_user
  
  def tags
    @popular_tags = Tag.top_ten
    respond_to do |wants|
      wants.html
    end
  end
  
  def index
    @goals = @requested_user.goals.find(:all)
    respond_to do |wants|
      wants.html
    end
  end

  def show
    @goal = @requested_user.goals.find(params[:id])
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
    
    respond_to do |wants|
      if @goal.save
        flash[:notice] = 'Goal was successfully created.'
        wants.html { redirect_to([current_user, @goal]) }
        wants.xml { render :xml => @goal, :status => :created, :location => [current_user, @goal] }
      else
        wants.html { render :action => "new" }
        wants.xml { render :xml => @goal.errors, :status => :unprocessable_entity }
      end
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
        flash[:notice] = 'Goal was successfully updated.'
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
    flash[:notice] = "Successfully destroyed goal."
    redirect_to goals_path
  end
  
  protected
  
    def requested_user
      @requested_user ||= User.find_by_login(params[:user_id])
    end

end
