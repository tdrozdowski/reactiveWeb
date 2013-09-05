'use strict';

angular.module('reactiveApp')
  .directive 'file', [ () ->
    restrict: "E"
    template: "<input type=\"file\" />"
    replace: true
    require: "ngModel"
    link: (scope, element, attr, ctrl) ->
      listener = ->
        scope.$apply ->
          (if attr.multiple then ctrl.$setViewValue(element[0].files) else ctrl.$setViewValue(element[0].files[0]))


      element.bind "change", listener
  ]
