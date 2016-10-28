class Admin::ApplicationController < ApplicationController
  before_action :check_if_admin

  layout 'admin'

  def check_if_admin
    if current_user.admin == false
      redirect_to authenticated_root_path
    end
  end
end
