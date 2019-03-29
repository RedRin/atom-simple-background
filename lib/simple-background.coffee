SimpleBackgroundView = require './simple-background-view'
{CompositeDisposable} = require 'atom'

module.exports = SimpleBackground =
  config:
    image_url:
      title: 'Image URL'
      description: 'background image url'
      type: 'string'
      default: 'Enter a url'

  simpleBackgroundView: null
  subscriptions: null

  activate: (state) ->
    @simpleBackgroundView = new SimpleBackgroundView(state.simpleBackgroundViewState)
    document.body.appendChild @simpleBackgroundView.getElement()

    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'simple-background:refresh': @simpleBackgroundView.refresh

  deactivate: ->
    @subscriptions.dispose()
    @simpleBackgroundView.destroy()

  serialize: ->
    simpleBackgroundViewState: @simpleBackgroundView.serialize()
