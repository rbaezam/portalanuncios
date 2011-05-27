# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#$(document).ready ->

  #Manejar el evento del select de ESTADO
#  $('#estado_id').change ->
#    estado_id = $('#estado_id').val
#    select_ciudad = $('#ciudad_id')
#    url = <%= url_for(:action => 'obtener_por_estado', :controller => 'ciudades') %>
#    $.get url, {estado_id:estado_id}, (datos) ->
#      if datos.length>0
#        select_ciudad.empty().append("<option value='0'>--Seleccione una opción--</option>")
#        select_ciudad.removeAttr('disabled')
#        datos.each (d) ->
#          select_ciudad.append("<option value='" + d.id + "'>" + d.nombre + "</option>")
#      else
#        select_ciudad.attr('disabled', true)
