class @Accessible
  constructor: ->
    for accessory in @attr_accessible
      @[accessory] = ->
        value = undefined
        fn = (v) =>
          if v is undefined
            return value
          value = v
          @
        @[accessory] = fn
        @[accessory]()
      @[accessory]()
 
