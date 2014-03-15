
body#app
  input#query
    :placeholder "Type to Search..."
    :autofocus
    :v-model keyword
  #results
    .item
      :v-repeat sites
      :v-class "show: hit(name)"
      .name
        :v-model name
      a.link
        :href {{link}}
        :target _blank
        :v-model link
  #hint
    = "{{count}} Results"