class Worldcup.Views.Pagination extends Backbone.View
  tagName: 'ul'
  className: 'pagination'
  template: _.template([
    "<% if(page!==1) { %>",
        "<li><a href=\"#\">Previous</a></li>",
    "<% } else { %>",
        "<li class='disabled'><a href=\"#\">Previous</a></li>",
    "<% } %>",
    "<% _.each(numbers, function(num) { %>",
      "<% if (page===num) { %><li class='active'><a href=\"#\"><%= num %></a></li><% } %>",
      "<% if (page!==num) { %><li><a href=\"#\"><%= num %></a></li><% } %>",
    "<% }); %>",
    "<% if(page!==last) { %>",
        "<li><a href=\"#\">Next</a></li>",
    "<% } else { %>",
        "<li class='disabled'><a href=\"#\">Next</a></li>",
    "<% } %>"
  ].join(''))

  initialize: ->
    
  render: ->
    arr = [1..@collection.getLastPage()]
    html = @template(numbers: arr, last: @collection.getLastPage(), page: @collection.page)
    @$el.append(html)
    @
