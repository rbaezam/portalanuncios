# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'ciudad', 'ciudades'
  inflect.irregular 'tipo_usuario', 'tipos_usuario'
  inflect.irregular 'usuario', 'usuarios'
end
