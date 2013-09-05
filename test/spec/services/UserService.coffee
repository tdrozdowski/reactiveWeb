'use strict'

describe 'Service: UserService', () ->

  # load the service's module
  beforeEach module 'reactiveApp'

  # instantiate service
  UserService = {}
  beforeEach inject (_UserService_) ->
    UserService = _UserService_

  it 'should do something', () ->
    expect(!!UserService).toBe true
