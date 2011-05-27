require 'spec_helper'

describe SesionesController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "debe fallar si no se pasan los datos de usuario" do
      post 'create'
      flash{:error}.should_not be_nil
    end

    it "debe fallar si los datos de usuario no existen" do
      usuario = {:correo => 'prueba', :password => 'prueba'}
      post 'create', :usuario => usuario
      flash{:error}.should_not be_nil
    end

    it "debe funcionar si se pasan los datos correctos" do
      usuario = Factory(:usuario, :correo => 'prueba@server.com', :password => 'prueba')
      usuario.save
      post 'create', :usuario => usuario
      #response.should redirect_to root_path
      flash{:error}.should be_nil
      response.should be_success
      #session[:usuario_id].should_not be_nil
    end
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get 'destroy', :id => 1
      response.should be_success
    end
  end

end
