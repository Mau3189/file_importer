require 'rails_helper'
include ActionDispatch::TestProcess

RSpec.describe DatafilesController, type: :controller do
  let(:valid_attributes) do
    FactoryGirl.attributes_for(:datafile)
  end

  let(:invalid_attributes) { { filename: nil } }

  describe "GET #index" do
    it "assigns all datafiles as @datafiles" do
      get :index
      expect(assigns(:datafiles).count).to eq(1)
    end
  end

  describe "GET #records" do
    it "assigns the requested datafile as @datafile" do
      datafile = Datafile.create! valid_attributes
      get :records, {:id => datafile.to_param}
      expect(assigns(:datafile)).to eq(datafile)
    end
  end

  describe "GET #show" do
    it "assigns the requested datafile as @datafile" do
      datafile = Datafile.create! valid_attributes
      get :show, {:id => datafile.to_param}
      expect(assigns(:datafile)).to eq(datafile)
    end
  end

  describe "GET #new" do
    it "assigns a new datafile as @datafile" do
      get :new, {}
      expect(assigns(:datafile)).to be_a_new(Datafile)
    end
  end

  describe "GET #edit" do
    it "assigns the requested datafile as @datafile" do
      datafile = Datafile.create! valid_attributes
      get :edit, {:id => datafile.to_param}
      expect(assigns(:datafile)).to eq(datafile)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_attributes) do
        {
          datafile: {
            filename: 'test',
            file: fixture_file_upload('test.zip', 'application/zip')
          }
        }
      end

      it "creates a new Datafile" do
        expect {
          post :create, valid_attributes.except(:file)
        }.to change(Datafile, :count).by(1)
      end

      it "assigns a newly created datafile as @datafile" do
        post :create, valid_attributes.except(:file)
        expect(assigns(:datafile)).to be_a(Datafile)
        expect(assigns(:datafile)).to be_persisted
      end

      it "redirects to the created datafile" do
        post :create, valid_attributes
        expect(response).to redirect_to(datafiles_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved datafile as @datafile" do
        post :create, {:datafile => invalid_attributes}
        expect(assigns(:datafile)).to be_a_new(Datafile)
      end

      it "re-renders the 'new' template" do
        post :create, {:datafile => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        FactoryGirl.attributes_for(:datafile, filename: 'test2')
      end

      it "updates the requested datafile" do
        datafile = Datafile.create! valid_attributes
        put :update, {:id => datafile.to_param, :datafile => new_attributes}
        datafile.reload
        expect(datafile.filename).to eq("test2")
      end

      it "assigns the requested datafile as @datafile" do
        datafile = Datafile.create! valid_attributes
        put :update, {:id => datafile.to_param, :datafile => valid_attributes}
        expect(assigns(:datafile)).to eq(datafile)
      end

      it "redirects to the datafile" do
        datafile = Datafile.create! valid_attributes
        put :update, {:id => datafile.to_param, :datafile => valid_attributes}
        expect(response).to redirect_to(datafiles_url)
      end
    end

    context "with invalid params" do
      it "assigns the datafile as @datafile" do
        datafile = Datafile.create! valid_attributes
        put :update, {:id => datafile.to_param, :datafile => invalid_attributes}
        expect(assigns(:datafile)).to eq(datafile)
      end

      it "re-renders the 'edit' template" do
        datafile = Datafile.create! valid_attributes
        put :update, {:id => datafile.to_param, :datafile => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested datafile" do
      datafile = Datafile.create! valid_attributes
      expect {
        delete :destroy, {:id => datafile.to_param}
      }.to change(Datafile, :count).by(-1)
    end

    it "redirects to the datafiles list" do
      datafile = Datafile.create! valid_attributes
      delete :destroy, {:id => datafile.to_param}
      expect(response).to redirect_to(datafiles_url)
    end
  end

end
