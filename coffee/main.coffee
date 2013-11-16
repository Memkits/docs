
search = (site, keyword) ->
  words = keyword.split(" ").map (word) ->
    word.toLowerCase()
  words.every (word) ->
    site.name.toLowerCase().indexOf(word) >= 0

define (require, exports) ->

  require "src/focus"
  
  sites = require "src/sites"
  Ractive = require "Ractive"
  listTmpl = require "text!view/list.mustache"

  app = new Ractive
    el: '#app'
    template: listTmpl
    data:
      cursor: 0
      keyword: ""
      results: sites
      classShow: (show) ->
        switch show
          when yes then "show"
          when no then ""
          else ""
      showCursor: (num, cursor) ->
        switch
          when num is cursor then "cursor"
          else ""

  app.observe "keyword", (keyword) ->
    count = 0

    Object.keys(sites).map (id) ->
      site = sites[id]
      show = search site, keyword
      app.set "results.#{id}.show", show

      count++ if show
    app.set "count", count