$(function(){
  $('.community_tags').select2({
    tags: true,
    width: '100%',
    tokenSeparators: [","," "],
    multiple: true,
    maximumSelectionSize: 10,

    initSelection: function (element, callback) {
      var data = [];

      $(element.val().split(",")).each(function () {
        data.push({id: this, text: this});
      });

      callback(data);
    },

    ajax: {
      dataType: 'json',
      url: '/communities',
      data: function (term, page) {
        return { tag: term };
      },
      results: function(data, page) {
        var tags = $.map(data['communities'], function(community, index){
          return community.tags
        })

        return {
          results: $.map(tags, function(tag, index){
            return {
              id: tag,
              text: tag
            }
          })
        };
      }
    },

    createSearchChoice: function(term, data) {
      var existsTags = $(data).filter(function() { return this.text.localeCompare(term)===0; });

      if (existsTags.length === 0) {
        return {id:term, text:term};
      }
    },

    formatResult: function(tag) {
      return tag.text
    },

    formatSelectionTooBig: function (limit) {
      return 'You can only add 5 tags'
    }
  })
})