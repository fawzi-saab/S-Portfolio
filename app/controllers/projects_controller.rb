class ProjectsController < ApplicationController
    before_action :authenticate_user!  , except: :show      #authenticate_user is a devise method
    before_action :only_current_user, except: :show
    before_action :check_available ,except: [:new, :create]
    def new
        @profile = User.find(params[:user_id]).profile
        @project = Project.new 
      
    end
    
    def create
       @profile = User.find(params[:user_id]).profile
       @project = Project.new(project_params) 
       @project.profile_id = @profile.id
       
       if @project.save
           flash[:success] = "Project Added"
           redirect_to  user_path(current_user)
       else
           flash[:danger] = 'Error occured, Input all fields.'
           render action: :new
       end
    end
    
    def edit
        @profile = User.find(params[:user_id]).profile
        @project = Project.find(params[:id])
    end
    
    def update
        @profile = User.find(params[:user_id]).profile
        @project = Project.find(params[:id])
        if @project.update_attributes(project_params)
            flash[:success] = "Project Updated!"
            redirect_to user_path(current_user)
        else
            render action: :edit
        end
    end
    
    def destroy
        @profile = User.find(params[:user_id]).profile
        @project = Project.find(params[:id])
        if @project.delete
            flash[:success] = "Project deleted!"
             redirect_to user_path(current_user)
        end
    end
    
    def show
        @profile = User.find(params[:user_id]).profile
        @project = Project.find(params[:id])
    end
    
     private
        def project_params
            params.require(:project).permit(:title, :project_description, :project_link, :avatar)
        end
        def only_current_user
            @user = User.find(params[:user_id])
            redirect_to(root_url) unless @user == current_user
        end
        def check_available
            @user = User.find(params[:user_id])
            @profile = @user.profile
            redirect_to(root_url) unless @profile.projects !=[]
        end
end
