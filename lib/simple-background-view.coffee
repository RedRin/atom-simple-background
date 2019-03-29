{CompositeDisposable} = require 'atom'

class SimpleBackgroundView

  constructor: (serializedState) ->
    # Create the background element
    @background = document.createElement('div')
    @background.classList.add('simple-background')

    @refresh()

  refresh: =>
    image_url = atom.config.get('simple-background.image_url')
    @background.style.backgroundImage = "url(\"" + image_url + "\")"

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @background.remove()

  getElement: ->
    @background

module.exports = SimpleBackgroundView
