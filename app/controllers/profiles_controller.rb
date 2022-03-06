class ProfilesController < ApplicationController
    before_action :authenticate_user!        #authenticate_user is a devise method
    before_action :only_current_user
    before_action :check_available ,except: [:new, :create]
    def new
        @user = User.find(params[:user_id])
        @profile = Profile.new 
    end
    
    def create
       @user = User.find(params[:user_id])
       @profile = @user.build_profile(profile_params)           #we use build_profile here to store the actual data that the user typed
       if @profile.save
           flash[:success] = "profile updated!"
           redirect_to user_path(current_user)
       else
           render action: :new
       end
    end
   
  def edit
        @user = User.find(params[:user_id])
        @profile = @user.profile
  end
    
    def update
        @user = User.find(params[:user_id])
        @profile = @user.profile
        if @profile.update_attributes(profile_params)
            flash[:success] = "Profile Updated!"
            redirect_to root_path
        else
            render action: :edit
        end
    end
    
    def del_img
        @user = User.find(params[:user_id])
        @profile = @user.profile
        @profile.avatar = nil
        @profile.save
        redirect_to user_path(current_user)
    end
    
    def destroy
        @profile = User.find(params[:user_id]).profile
        if @profile.delete
            flash[:success] = "Profile deleted!"
             redirect_to root_path
        end
    end
    
    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :country, :city, :contact_email, :phone_number, :fb_link, :lkd_link, :github_link, :profession, :years_of_experience, :background_overview, :avatar )
        end
        def only_current_user
            @user = User.find(params[:user_id])
            redirect_to(root_url) unless @user == current_user
        end
        def check_available
            @user = User.find(params[:user_id])
            @profile = @user.profile
            redirect_to(root_url) unless @profile
        end
end
