class Notification < ActionMailer::Base
  default from: "from@example.com"
  
  def add_comments_sendemail(comment)
    @commentdetail = comment
    mail(:to =>"jbadgire27@gmail.com", :subject=>"New Comment to your post")
  end
  
end
