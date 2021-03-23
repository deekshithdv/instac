class NotificationsController < ApplicationController
  def index
    @notifications = current_account.notifications.order('created_at DESC')
  end
  def link_through
    @notification = Notification.find(params[:id])
    @notification.update read: true
    redirect_to dashboard_path 
  end
end
