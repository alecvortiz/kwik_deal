class UserMailer < ApplicationMailer
    default from: 'grouponappraisals@gmail.com'

    def approval
        mail(to: 'jwalkk@umich.edu',
		    subject: 'New Opportunity up for Approval',
		    template_path: 'user_mailer',
		    template_name: 'approval')
	   
    end
    
    def send_approved(user)
        email = user.email
        mail(to: email,
		    subject: 'Opportunity Approved',
		    template_path: 'user_mailer',
		    template_name: 'send_approved')
    end
    
end
