$ = jQuery
$ ->
  $.setAjaxPagination = ->
    $('.pagination a').click (event) ->
      event.preventDefault()
      loading = $ '<div id="loading" style="display: none;"><span><img src="/assets/loading.gif" alt="cargando..."/></span></div>'
      $('.pagination').prepend loading
      loading.fadeIn()
      $.ajax type: 'GET', url: $(@).attr('href'), dataType: 'script', success: (-> loading.fadeOut -> loading.remove())
      false

  $.setAjaxPagination()
