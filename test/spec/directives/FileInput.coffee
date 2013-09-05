'use strict'

describe 'Directive: FileInput', () ->

  # load the directive's module
  beforeEach module 'reactiveApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<-file-input></-file-input>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the FileInput directive'
