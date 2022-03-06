class ExperiencesController < ApplicationController
    before_action :authenticate_user!        #authenticate_user is a devise method
    before_action :only_current_user
    before_action :check_available ,except: [:new, :create]
    def new
        @profile = User.find(params[:user_id]).profile
        @experience = Experience.new 
      
    end
    
    def create
       @profile = User.find(params[:user_id]).profile
       @experience = Experience.new(experience_params) 
       @experience.profile_id = @profile.id
       
       if @experience.save
           flash[:success] = "Experience Added"
           redirect_to user_path(current_user)
       else
           flash[:danger] = 'Error occured, Input all fields.'
           render action: :new
       end
    end
    
    def edit
        @profile = User.find(params[:user_id]).profile
        @experience = Experience.find(params[:id])
    end
    
    def update
        @profile = User.find(params[:user_id]).profile
        @experience = Experience.find(params[:id])
        if @experience.update_attributes(experience_params)
            flash[:success] = "Experience Updated!"
            redirect_to user_path(current_user)
        else
            render action: :edit
        end
    end
    
    def destroy
        @profile = User.find(params[:user_id]).profile
        @experience = Experience.find(params[:id])
        if @experience.delete
            flash[:success] = "Experience deleted!"
             redirect_to user_path(current_user)
        end
    end
    
     private
        def experience_params
            params.require(:experience).permit(:company_name, :position_title, :start_month, :start_year, :end_month, :end_year, :tasks_description)
        end
        def only_current_user
            @user = User.find(params[:user_id])
            redirect_to(root_url) unless @user == current_user
        end
        def check_available
            @user = User.find(params[:user_id])
            @profile = @user.profile
            redirect_to(root_url) unless @profile.experiences !=[]
        end
end
