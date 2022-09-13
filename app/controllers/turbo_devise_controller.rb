class TurboDeviseController < ApplicationController
  class Responder < ActionController::Responder
    def turbo_stream
      controller.render(options.merge(formats: :html))
    rescue ActionView::MissinTemplate => error
      if get?
        raise error
      elsif has_errors? && default_action
        render rendering_options.merge(formats: :html, status: :unprocessable_entity)
      else
        redirect_to navigation_location
      end
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_stream
end

