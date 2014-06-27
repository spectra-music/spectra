angular.module('angularPikaday', []).directive('pikaday', ->
  {
    restrict: 'A',
    scope: {
      pikaday: '=',
      defaultDate: '@',
      minDate: '@',
      maxDate: '@'
    },
    link: (scope, elem, attrs) ->
      scope.$watchCollection('[defaultDate, minDate, maxDate]', (values, oldValues) ->
        if("" not in values)
          picker = new Pikaday({

            field: elem[0],
            trigger: document.getElementById(attrs.triggerId),
            bound: attrs.bound != 'false',
            position: attrs.position || '',
            format: attrs.format || 'ddd MMM D YYYY', # Requires Moment.js for custom formatting
            defaultDate: new Date(values[0]),
            setDefaultDate: attrs.setDefaultDate == 'true',
            firstDay: if attrs.firstDay then parseInt(attrs.firstDay) else 0,
            minDate: new Date(values[1]),
            maxDate: new Date(values[2]),
            yearRange: if attrs.yearRange then JSON.parse(attrs.yearRange) else 10, # Accepts int (10) or 2 elem array ([1992, 1998]) as strings
            isRTL: attrs.isRTL == 'true',
            i18n: {
              previousMonth : 'Previous Month',
              nextMonth     : 'Next Month',
              months        : ['January','February','March','April','May','June','July','August','September','October','November','December'],
              weekdays      : ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'],
              weekdaysShort : ['Sun','Mon','Tue','Wed','Thu','Fri','Sat']
            },
            yearSuffix: attrs.yearSuffix || '',
            showMonthAfterYear: attrs.showMonthAfterYear == 'true',

            onSelect: () ->
              setTimeout(() ->
                scope.$apply()
              )
          })
          scope.pikaday = picker
      )
  }
)