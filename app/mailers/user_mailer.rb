class UserMailer < ApplicationMailer
    default from: 'grouponappraisals@gmail.com'

    def approval
        mail(to: 'jwalkk@umich.edu',
		    subject: 'New Deal up for Approval',
		    template_path: 'user_mailer',
		    template_name: 'approval')
	   
    end
end
