# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :anuncio do |f|
  f.titulo "MyString"
  f.descripcion "MyText"
  f.empresa nil
  f.ciudad nil
  f.subcategoria nil
  f.periodicidad_sueldo nil
  f.sueldo_minimo "9.99"
  f.sueldo_maximo "9.99"
  f.moneda nil
  f.puesto "MyString"
  f.referencia "MyString"
  f.usuario nil
  f.nivel_anuncio nil
  f.activo false
end