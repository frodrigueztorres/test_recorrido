 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/alerts", type: :request do
  
  # Alert. As you add validations to Alert, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Alert.create! valid_attributes
      get alerts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      alert = Alert.create! valid_attributes
      get alert_url(alert)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_alert_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      alert = Alert.create! valid_attributes
      get edit_alert_url(alert)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Alert" do
        expect {
          post alerts_url, params: { alert: valid_attributes }
        }.to change(Alert, :count).by(1)
      end

      it "redirects to the created alert" do
        post alerts_url, params: { alert: valid_attributes }
        expect(response).to redirect_to(alert_url(Alert.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Alert" do
        expect {
          post alerts_url, params: { alert: invalid_attributes }
        }.to change(Alert, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post alerts_url, params: { alert: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested alert" do
        alert = Alert.create! valid_attributes
        patch alert_url(alert), params: { alert: new_attributes }
        alert.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the alert" do
        alert = Alert.create! valid_attributes
        patch alert_url(alert), params: { alert: new_attributes }
        alert.reload
        expect(response).to redirect_to(alert_url(alert))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        alert = Alert.create! valid_attributes
        patch alert_url(alert), params: { alert: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested alert" do
      alert = Alert.create! valid_attributes
      expect {
        delete alert_url(alert)
      }.to change(Alert, :count).by(-1)
    end

    it "redirects to the alerts list" do
      alert = Alert.create! valid_attributes
      delete alert_url(alert)
      expect(response).to redirect_to(alerts_url)
    end
  end
end