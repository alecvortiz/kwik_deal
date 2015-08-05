class MailersController < ApplicationController
    def sent 
        
    end
    
    def approval
      
    end
    
    def send_approved
        @user = User.find params[:id] 
    end
end