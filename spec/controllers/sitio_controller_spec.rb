require 'spec_helper'

describe SitioController do

  describe "GET 'index'" do
    it "debe ser correcto" do
      get 'index'
      response.should be_success
    end

    it "debe regresar anuncios destacados" do
      get 'index'
      @destacados.should_not be_nil
    end
  end

end
