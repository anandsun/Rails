class Notifications < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_post.subject
  #
  def new_post(post)
    @greeting = "Hello! There has been a new post to your discussion on " + post.discussion.topic + " at rubydark.herokuapp.com. Please sign in to view the post."

    mail to: post.discussion.user.email
  end
end
