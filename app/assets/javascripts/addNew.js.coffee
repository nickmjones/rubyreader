$ ->
  
  handleForm = ->
    p = $('.view')
    o = $('.overlay')
    f = $('.new-form')
    p.toggleClass('zoom-out')
    o.toggleClass('in-view')
    f.toggleClass('is-popped')
  
  $('.new').click (e)->
    e.preventDefault()
    handleForm()
  $('.close').click ->
    handleForm()

  