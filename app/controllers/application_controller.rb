class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  rescue_from  ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
  	respond_to do |format|
      format.html { redirect_to root_path, notice: "Record could not be found" }
      format.json { head :not_found }
    end
  end
end
