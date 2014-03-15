
document.onkeypress = (event) ->
  query = document.querySelector('#query')
  char = String.fromCharCode event.charCode
  if char is "/"
    query.focus()
    query.value = ""
    event.preventDefault()

document.onkeydown = (event) ->
  switch
    when event.keyCode is 13
      elem = document.querySelector '.item.show a'
      if elem?
        window.open elem.href, "_blank"
    when event.keyCode is 27
      document.querySelector('#query').blur()
