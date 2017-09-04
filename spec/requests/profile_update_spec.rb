require 'rails_helper'

describe 'dashboard#authorize linkedin information', type: :request do
  it "redirects to linkedin#callback" do
    get '/auth/linkedin'

    expect(response).to redirect_to(oauth_callback_path(:linkedin))
  end
end
