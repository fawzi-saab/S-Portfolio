class EducationsController < ApplicationController
    before_action :authenticate_user!        #authenticate_user is a devise method
    before_action :only_current_user
    before_action :check_available ,except: [:new, :create]
    def new
        @profile = User.find(params[:user_id]).profile
        @education = Education.new 
      
    end
    
    def create
       @profile = User.find(params[:user_id]).profile
       @education = Education.new(education_params) 
       @education.profile_id = @profile.id
       
       if @education.save
           flash[:success] = "Education Added"
           redirect_to user_path(current_user)
       else
            flash[:danger] = 'Error occured, Input all fields.'
            render action: :new
       end
    end
    
    def edit
        @profile = User.find(params[:user_id]).profile
        @education = Education.find(params[:id])
    end
    
    def update
        @profile = User.find(params[:user_id]).profile
        @education = Education.find(params[:id])
        if @education.update_attributes(education_params)
            flash[:success] = "Education Updated!"
            redirect_to user_path(current_user)
        else
            render action: :edit
        end
    end
    
    def destroy
        @profile = User.find(params[:user_id]).profile
        @education = Education.find(params[:id])
        if @education.delete
            flash[:success] = "Education deleted!"
             redirect_to user_path(current_user)
        end
    end
     private
        def education_params
            params.require(:education).permit(:title, :institute, :year_of_graduation)
        end
        def only_current_user
            @user = User.find(params[:user_id])
            redirect_to(root_url) unless @user == current_user
        end
        def check_available
            @user = User.find(params[:user_id])
            @profile = @user.profile
            redirect_to(root_url) unless @profile.educations !=[]
        end
end
