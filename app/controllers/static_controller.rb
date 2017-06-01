
# Static controller is only for pages that are not
# associated with any resources
class StaticController < ApplicationController
  def dashboard
    @summary = Score.summary[0]
    @products_count = Product.count
  end

  def docs; end

  def about; end

  def contact; end

  def send_to_slack
    NotifySlackService.build.call(name: params[:name], email: params[:email], message: params[:message])
    flash[:notice] = { type: 'success', message: 'Thanks for your valuable feedback.' }
    redirect_to controller: 'products', action: 'index'
  end
end
