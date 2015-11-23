require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
  let(:valid_attributes) { FactoryGirl.attributes_for(:record, datafile_id: 1) }

  let(:invalid_attributes) { { datafile_id: nil } }

  describe 'GET #index' do
    it 'assigns all records as @records' do
      record = Record.create! valid_attributes
      get :index, {}
      expect(assigns(:records)).to eq([record])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested record as @record' do
      record = Record.create! valid_attributes
      get :show, id: record.to_param
      expect(assigns(:record)).to eq(record)
    end
  end

  describe 'GET #new' do
    it 'assigns a new record as @record' do
      get :new, {}
      expect(assigns(:record)).to be_a_new(Record)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested record as @record' do
      record = Record.create! valid_attributes
      get :edit, id: record.to_param
      expect(assigns(:record)).to eq(record)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Record' do
        expect { post :create, record: valid_attributes }
          .to change(Record, :count).by(1)
      end

      it 'assigns a newly created record as @record' do
        post :create, record: valid_attributes
        expect(assigns(:record)).to be_a(Record)
        expect(assigns(:record)).to be_persisted
      end

      it 'redirects to the created record' do
        post :create, record: valid_attributes
        expect(response).to redirect_to(Record.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved record as @record' do
        post :create, record: invalid_attributes
        expect(assigns(:record)).to be_a_new(Record)
      end

      it 're-renders the "new" template' do
        post :create, record: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        FactoryGirl.attributes_for(:record, clicks: 42)
      end

      it 'updates the requested record' do
        record = Record.create! valid_attributes
        put :update, id: record.to_param, record: new_attributes
        record.reload
        expect(record.clicks).to eq(42)
      end

      it 'assigns the requested record as @record' do
        record = Record.create! valid_attributes
        put :update, id: record.to_param, record: valid_attributes
        expect(assigns(:record)).to eq(record)
      end

      it 'redirects to the record' do
        record = Record.create! valid_attributes
        put :update, id: record.to_param, record: valid_attributes
        expect(response).to redirect_to(records_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the record as @record' do
        record = Record.create! valid_attributes
        put :update, id: record.to_param, record: invalid_attributes
        expect(assigns(:record)).to eq(record)
      end

      it 're-renders the "edit" template' do
        record = Record.create! valid_attributes
        put :update, id: record.to_param, record: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested record' do
      record = Record.create! valid_attributes
      expect { delete :destroy, id: record.to_param }
        .to change(Record, :count).by(-1)
    end

    it 'redirects to the records list' do
      record = Record.create! valid_attributes
      delete :destroy, id: record.to_param
      expect(response).to redirect_to(records_url)
    end
  end
end
