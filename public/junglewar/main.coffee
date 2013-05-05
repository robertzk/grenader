class JungleWar
  constructor: ->
    @canvas = document.getElementById('canvas')
    @context = @canvas.getContext('2d')
    @drawTransparentSquare @context
    @drawSquare @context
    
    @canvas.addEventListener('mousemove', (e) =>
      mousePos = @getMousePos(e)
      msg = "Mouse position: #{mousePos.x}, #{mousePos.y}"
      @writeMessage(msg)
    )

  getMousePos: (e) ->
    rect = @canvas.getBoundingClientRect()
    return { x: e.clientX - rect.left, y: e.clientY - rect.top }

  drawTransparentSquare: ->
    @context.fillStyle = 'red'
    @context.globalAlpha = 0.5
    @context.fillRect(100, 20, 300, 300)

  drawSquare: ->
    @context.fillStyle = 'red'
    @context.fillRect(300, 50, 120, 520)

  writeMessage: (msg) ->
    @context.clearRect(0, 0, 500, 40)
    #@context.clearRect(0, 0, @canvas.width, @canvas.height);
    @context.font = '18pt Calibri'
    @context.fillStyle = 'black'
    @context.fillText(msg, 10, 25)

$ -> new JungleWar()
