class UsersController < ApplicationController
    # before_action :authenticate_user!
    def show
        @user = User.find(params[:id])
        @profile = @user.profile
        @education = @profile.educations
        @experience = @profile.experiences
        @project = @profile.projects
        @certificate = @profile.certificates
    end
end
