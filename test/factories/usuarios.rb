# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :usuario do |f|
  f.correo "MyString"
  f.password "MyString"
  f.nombre "MyString"
  f.apellido "MyString"
  f.ciudad nil
  f.tipo_usuario nil
end