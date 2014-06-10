/*
<input tagcomplete ng-model="skill.tags" options="tags" data-placeholder="Valitse avainsanoja" class="form-control">

Where skill.tags = [{_id: ..., name: 'Something'}, {_id: ..., name: 'Another'}];
...or maybe it is ['Something', 'Another'];
*/

angular.module('ui.select', [])
    .directive('tagcomplete', function($parse) {
        return {
            restrict: 'A',
            require: ['?ngModel'],
            scope: {
                options: '=',
                placeholder: '@', // Use as value
            },
            link: function(scope, el, attrs, ctrls) {
                var modelCtrl = ctrls[0];

                var $select = el.selectize({
                    create: function(input, cb) {
                        cb({name: input});
                    },
                    valueField: 'friendly_id',
                    labelField: 'name',
                    searchField: 'name',
                    plugins: ['restore_on_backspace'],
                    hideSelected: true,
                    onChange: function(val) {
                        _.defer(function(){
                            scope.$apply(function() {
                                var selected = _.map(val.split(','), function(tag) {
                                    return {friendly_id: tag};
                                });
                                modelCtrl.$setViewValue(selected);
                            });
                        });
                    },
                });

                var selectize = $select[0].selectize;

                scope.$watchCollection('options', function(newTags, oldTags) {
                    _.each(newTags, function(tag) {
                        selectize.addOption(tag);
                    });
                });

                scope.$watch(function() { return modelCtrl.$viewValue }, function(vals) {
                    _.each(vals, function(tag) {
                        selectize.addItem(tag.friendly_id);
                    });
                });
            }
        };
    });


