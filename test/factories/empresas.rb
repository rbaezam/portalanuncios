# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :empresa do |f|
  f.nombre "MyString"
  f.descripcion "MyString"
  f.ciudad nil
  f.industria nil
  f.direccion "MyString"
  f.usuario nil
  f.pagina_web "MyString"
  f.url_logo "MyString"
end