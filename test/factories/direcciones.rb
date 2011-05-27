# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :direccion do |f|
  f.empresa nil
  f.calle "MyString"
  f.numero_interior "MyString"
  f.numero_exterior "MyString"
  f.colonia "MyString"
  f.codigo_postal "MyString"
  f.municipio "MyString"
  f.ciudad nil
end