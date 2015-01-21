class WelcomeController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:return_json]

  def return_json
    respond_to do |format|
      format.js { render json: {success: 1, message: 'stevey was a pretty girl'}, :callback => params[:callback] }
    end
  end
end
