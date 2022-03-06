class CertificatesController < ApplicationController
    before_action :authenticate_user!  , except: :show      #authenticate_user is a devise method
    before_action :only_current_user, except: :show
    before_action :check_available ,except: [:new, :create]
    def new
        @profile = User.find(params[:user_id]).profile
        @certificate = Certificate.new 
      
    end
    
    def create
       @profile = User.find(params[:user_id]).profile
       @certificate = Certificate.new(certificate_params) 
       @certificate.profile_id = @profile.id
       
       if @certificate.save
           flash[:success] = "Certificate Added"
           redirect_to  user_path(current_user)
       else
           render action: :new
       end
    end
    
    def edit
        @profile = User.find(params[:user_id]).profile
        @certificate = Certificate.find(params[:id])
    end
    
    def update
        @profile = User.find(params[:user_id]).profile
        @certificate = Certificate.find(params[:id])
        if @certificate.update_attributes(certificate_params)
            flash[:success] = "Certificate Updated!"
            redirect_to user_path(current_user)
        else
            render action: :edit
        end
    end
    
    def destroy
        @profile = User.find(params[:user_id]).profile
        @certificate = Certificate.find(params[:id])
        if @certificate.delete
            flash[:success] = "Certificate deleted!"
             redirect_to user_path(current_user)
        end
    end
    
    def show
        @profile = User.find(params[:user_id]).profile
        @certificate = Certificate.find(params[:id])
    end
    
     private
        def certificate_params
            params.require(:certificate).permit(:title, :institute ,:avatar)
        end
        def only_current_user
            @user = User.find(params[:user_id])
            redirect_to(root_url) unless @user == current_user
        end
        def check_available
            @user = User.find(params[:user_id])
            @profile = @user.profile
            redirect_to(root_url) unless @profile.certificates !=[]
        end
end
