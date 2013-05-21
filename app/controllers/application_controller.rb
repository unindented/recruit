class ApplicationController < ActionController::Base

  protect_from_forgery

  after_filter :flash_to_headers

  private

  def flash_to_headers
    return unless request.xhr?

    flash_json = Hash[flash.map { |k, v| [k, v] }].to_json
    response.headers['X-Messages'] = flash_json
    flash.discard
  end

end
