require 'rails_helper'
RSpec.describe MessagesController, type: :controller do

  describe "GET index" do
    it "assigns all messages to @messages" do
      message1 = Message.create(content: "test1")
      message2 = Message.create(content: "test2")
      
      get :index
      
      expect(assigns(:messages)).to match_array([message1, message2])
    end

    it "assigns a new message to @message" do
      get :index
      
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "renders the index template" do
      get :index
      
      expect(response).to render_template(:index)
    end
  end

  describe "POST create" do
    context "with valid parameters" do
      it "creates a new message" do
        expect {
          post :create, format: :turbo_stream, params: { message: { content: "mensaje2" } }
        }.to change(Message, :count).by(1)

        expect(assigns(:message)).to be_a(Message)
      end
    end

    context "with invalid parameters" do
      it "does not create a new message" do
        expect {
          post :create, params: { message: { content: "" } }
        }.to_not change(Message, :count)
      end

      it "assigns all messages to @messages" do
        message1 = Message.create(content: "test1")
        message2 = Message.create(content: "test2")

        post :create, params: { message: { content: "" } }

        expect(assigns(:messages)).to match_array([message1, message2])
      end

      it "renders the index template" do
        post :create, params: { message: { content: "" } }

        expect(response).to render_template(:index)
      end

      it "returns status unprocessable_entity" do
        post :create, params: { message: { content: "" } }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
