document.addEventListener 'turbolinks:load', ->

  request = new XMLHttpRequest
  target = document.querySelector '.book-title'
  author_field = document.querySelector '.author-field'
  desc_field = document.querySelector '.book__desc h4'
  term = target.dataset.title
  request.open 'GET', 'https://www.googleapis.com/books/v1/volumes?q=' + term, true

  request.onload = ->

    if request.status >= 200 and request.status < 400
      data = JSON.parse(request.responseText)
      author = data.items[0].volumeInfo.authors.join(", ")
      desc = data.items[0].volumeInfo.description

      setAuthor = ->
        if (author == 'undefined' || author == null)
          author_field.innerHTML = 'No author found'
        else
          author_field.innerHTML = 'by ' + author
        return
      
      setDesc = ->
        if (desc == 'undefined' || desc == null)
          desc_field.textContent = 'No description found'
        else
          desc_field.textContent = desc
        return

      setAuthor()
      setDesc()

    else
      # We reached our target server, but it returned an error
    return

  request.onerror = ->
    # There was a connection error of some sort
    return

  request.send()
  return