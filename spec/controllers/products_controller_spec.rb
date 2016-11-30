require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:valid_attributes) do
    { name: 'product', description: 'description', price: 10.01, count: 5 }
  end

  let(:valid_session) { {} }

  describe 'GET #edit' do
    it 'assigns the requested product as @product' do
      product = Product.create! valid_attributes
      get :edit, params: { id: product.to_param }, session: valid_session
      expect(assigns(:product)).to eq(product)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Product' do
        expect do
          post :create, params: { product: valid_attributes },
                        session: valid_session
        end.to change(Product, :count).by(1)
      end

      it 'assigns a newly created product as @product' do
        post :create, params: { product: valid_attributes },
                      session: valid_session
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it 'redirects to the created product' do
        post :create, params: { product: valid_attributes },
                      session: valid_session
        expect(response).to redirect_to(Product.last)
      end
    end
  end

  # ...
  describe 'POST #buy' do
    context 'with valid params' do
      it 'assigns a product as @product' do
        product = Product.create! valid_attributes
        post :buy, params: { id: product.to_param }, session: valid_session
        expect(assigns(:product)).to be_a(Product)
      end

      it 'decreases product count by 1 after buying a product'

      it 'receives notification from stripe of successful purchase'
    end
  end
end
