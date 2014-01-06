class FakeServerSide
  constructor: ->

  getInitialStream: =>
    new Stream(0, "http://188.40.32.140:8172/stream", "Kontestacja")

  getPosts: (fromNumber = 0, amount = 4) =>
