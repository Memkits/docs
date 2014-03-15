
require 'shelljs/make'
{renderer} = require 'cirru-html'
fs = require 'fs'

station = require 'devtools-reloader-station'
station.start()

target.html = ->
  file = 'cirru/index.cirru'
  render = renderer (cat file), '@filename': file
  render().to 'index.html'
  console.log 'wrote to index.html'
  station.reload 'repo/docs'

target.coffee = (type, name) ->
  exec "coffee -o js/ -bc coffee/#{name}", ->
    exec 'browserify -o build/build.js js/main.js', ->
      console.log 'ok browserify'
      station.reload 'repo/docs'

target.watch = ->
  target.html()
  target.coffee undefined, 'main.coffee'
  fs.watch 'cirru/', interval: 200, target.html
  fs.watch 'coffee/', interval: 200, target.coffee