class EventHandler

  constructor: () ->
    @mobileThreshold = 550;

  ##############################################################################
  # Initialize all click handlers
  ##############################################################################
  init: () ->
    _this = this

    # Show mobile menu
    $('#navigation').on 'click', () ->
      $(this).toggleClass('active') if $(window).width() < _this.mobileThreshold
      $(this).find('ul').toggleClass('hide-mobile') if $(window).width() < _this.mobileThreshold

    # Menu Buttons
    $('#navigation li').on 'click', () ->
      type = $(this).attr 'data-type'
      value = $(this).attr 'data-value'
      _this._processNav(type, value)


  ##############################################################################
  # Get data for a pod and show the pod
  ##############################################################################
  showPod: (podContext) ->
    PodLoader.getPodData podContext, (err, data) ->
      unless err
        PodLoader.loadPod data
      else
        console.error err


  ##############################################################################
  # Clear the given element
  ##############################################################################
  clearEl: (clearEl) ->
    $(clearEl).empty()


  ##############################################################################
  # Process a nav link click
  ##############################################################################
  _processNav: (type, value) ->
    switch type
      when 'link' then window.location = value
      when 'pod' then @showPod value
      when 'clear' then@clearEl value


window.EventHandler = new EventHandler()
