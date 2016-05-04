class Admin::TopController < Admin::Base
  def index
    logger.debug "administrator: #{current_administrator}"
    if current_administrator
      render action: 'dashboard'
    else
    render action: 'index'
    end
  end
end
