$ ->
  
  handleForm = ->
    p = $('.view')
    o = $('.overlay')
    f = $('.new-form')
    p.toggleClass('zoom-out')
    o.toggleClass('in-view')
    f.toggleClass('is-popped')
  
  $('.test').click ->
    handleForm()
  $('.close').click ->
    handleForm()

  