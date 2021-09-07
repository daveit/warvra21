class VisitorsController < ApplicationController
  def index
    @notices = Notice.order(created_at: :desc).where(finalised: false)
  end

end
