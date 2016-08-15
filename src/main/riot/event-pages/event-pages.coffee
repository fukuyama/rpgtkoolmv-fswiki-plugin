# event-pages.coffee

@currentPage = 0

@clickPage = (e) =>
  @currentPage = e.item.i

@on 'update', (e) ->
  unless @opts.pages?
    @currentPage = 0
