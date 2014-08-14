class PodLoader

  constructor: (selector) ->
    @dataPath = '/js/data/podData.json'
    @targetEl = $ selector


  ##############################################################################
  # Fetch data for a pod
  ##############################################################################
  getPodData: (context, callback) ->
    $.ajax
      type: 'GET',
      url: @dataPath,
      dataType: 'json'

    # Single arrow (->) changes 'this' context
    .done (data) ->
      callback null, data[context]

    # Fat arrow (=>) preserves 'this' context
    .fail (jqXHR, type, err) =>
      callback "#{type}: #{err.message}. For request: #{@dataPath}"


  ##############################################################################
  # Load a pod into the dom
  ##############################################################################
  loadPod: (data) ->
    newPod = $(window.podTemplate.innerHTML).clone()

    title = newPod.find '.title'
    description = newPod.find '.description'

    title.html data.title
    description.html data.description

    @targetEl.append newPod


window.CLASSES.PodLoader = PodLoader
