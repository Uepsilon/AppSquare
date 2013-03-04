# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  # hide function
  $('#pages #navigation span').click ->
    showNewBox($(this)) unless $(this).hasClass('active')

  # initiation
  $('#pages #boxes .box').hide()
  $('#pages #navigation span').first().click()

showNewBox = (element) ->
      if ( $('#pages #boxes .box.active').length > 0 )
        $('#pages #navigation span.active').removeClass('active')
        element.addClass('active')
        $('#pages #boxes .box').stop(true, true)
        $('#pages #boxes .box.active').removeClass('active').fadeOut('fast', ->
          $('#pages #boxes .box#'+ element.attr('rel')).fadeIn('fast').addClass('active')
        );
      else
        element.addClass('active')
        $('#pages #boxes .box#'+ element.attr('rel')).fadeIn('fast').addClass('active')

  #$('.box').first().addClass('open').removeClass('closed')
  #$('.box:not(".open")').addClass('closed')
  #$('.box.closed .boxbody').fadeoUt()

  # $('.box').click ->
  #   # Close all other boxes
  #   $('.box.open').click()

  #   # perform opening / closing
  #   if $(this).hasClass('open')
  #     $(this).removeClass('open').addClass('closed')
  #     $('.boxbody', this).fadeoUt()
  #   else if $(this).hasClass('closed')
  #     $(this).removeClass('closed').addClass('open')
  #     $('.boxbody', this).fadeiN()
