# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110525172924) do

  create_table "antiguedades_anuncio", :force => true do |t|
    t.string   "nombre"
    t.integer  "dias"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "anuncios", :force => true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.integer  "empresa_id"
    t.integer  "ciudad_id"
    t.integer  "subcategoria_id"
    t.integer  "periodicidad_sueldo_id"
    t.float    "sueldo_minimo"
    t.float    "sueldo_maximo"
    t.integer  "moneda_id"
    t.string   "puesto"
    t.string   "referencia"
    t.integer  "usuario_id"
    t.integer  "nivel_anuncio_id"
    t.boolean  "activo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "anuncios", ["ciudad_id"], :name => "index_anuncios_on_ciudad_id"
  add_index "anuncios", ["empresa_id"], :name => "index_anuncios_on_empresa_id"
  add_index "anuncios", ["moneda_id"], :name => "index_anuncios_on_moneda_id"
  add_index "anuncios", ["nivel_anuncio_id"], :name => "index_anuncios_on_nivel_anuncio_id"
  add_index "anuncios", ["periodicidad_sueldo_id"], :name => "index_anuncios_on_periodicidad_sueldo_id"
  add_index "anuncios", ["subcategoria_id"], :name => "index_anuncios_on_subcategoria_id"
  add_index "anuncios", ["usuario_id"], :name => "index_anuncios_on_usuario_id"

  create_table "categorias", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ciudades", :force => true do |t|
    t.string   "nombre"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "direcciones", :force => true do |t|
    t.integer  "empresa_id"
    t.string   "calle"
    t.string   "numero_interior"
    t.string   "numero_exterior"
    t.string   "colonia"
    t.string   "codigo_postal"
    t.string   "municipio"
    t.boolean  "es_facturacion"
    t.integer  "ciudad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "direcciones", ["ciudad_id"], :name => "index_direcciones_on_ciudad_id"
  add_index "direcciones", ["empresa_id"], :name => "index_direcciones_on_empresa_id"

  create_table "empresas", :force => true do |t|
    t.string   "nombre"
    t.string   "rfc"
    t.string   "descripcion"
    t.integer  "industria_id"
    t.string   "telefono"
    t.string   "fax"
    t.integer  "usuario_id"
    t.string   "pagina_web"
    t.string   "url_logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "empresas", ["industria_id"], :name => "index_empresas_on_industria_id"
  add_index "empresas", ["usuario_id"], :name => "index_empresas_on_usuario_id"

  create_table "estados", :force => true do |t|
    t.string   "nombre"
    t.integer  "pais_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estados", ["pais_id"], :name => "index_estados_on_pais_id"

  create_table "industrias", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monedas", :force => true do |t|
    t.string   "nombre"
    t.string   "simbolo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "niveles_anuncio", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paises", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periodicidades_sueldo", :force => true do |t|
    t.string   "nombre"
    t.integer  "num_horas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategorias", :force => true do |t|
    t.string   "nombre"
    t.integer  "categoria_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategorias", ["categoria_id"], :name => "index_subcategorias_on_categoria_id"

  create_table "tipo_usuarios", :force => true do |t|
    t.string   "nombre"
    t.boolean  "es_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_trabajo", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_trabajos_anuncio", :force => true do |t|
    t.integer  "anuncio_id"
    t.integer  "tipo_trabajo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tipos_trabajos_anuncio", ["anuncio_id"], :name => "index_tipos_trabajos_anuncio_on_anuncio_id"
  add_index "tipos_trabajos_anuncio", ["tipo_trabajo_id"], :name => "index_tipos_trabajos_anuncio_on_tipo_trabajo_id"

  create_table "usuarios", :force => true do |t|
    t.string   "correo"
    t.string   "password_digest"
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "ciudad_id"
    t.integer  "tipo_usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
