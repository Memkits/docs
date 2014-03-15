
require "./focus"
{sites} = require "./sites"
Vue = require 'vue'

search = (name, keyword) ->
  words = keyword.split(" ").map (word) ->
    word.toLowerCase()
  words.every (word) ->
    name.toLowerCase().indexOf(word) >= 0

app = new Vue
  el: '#app'
  data:
    keyword: ""
    sites: sites
  computed:
    count: ->
      @sites.filter (x) ->
        not x.hide
      .length
  methods:
    hit: (name) ->
      search name, @keyword
