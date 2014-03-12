# This used to be a complete 3d transformation library,
# but I'm cutting it down to a basic 3d transformation
# get/set api.
#
# I'll leave the matrix calculations to an external lib.

emptyStack = ->

	a = new Float32Array 20

	a[3] = 1
	a[4] = 1
	a[5] = 1

	a[6] = 10000

	a.movement = a.subarray 0, 3

	a.scale = a.subarray 3, 6

	a.rotation = a.subarray 7, 10

	a.localMovement = a.subarray 10, 13

	a.localRotation = a.subarray 13, 16

	a.rotate3d = a.subarray 16, 20

	a

copyStack = (from, to) ->

	to.set from

	return

module.exports = class Transformation

	@_emptyStack: emptyStack

	constructor: ->

		@_main = emptyStack()
		@_temp = emptyStack()

		@_current = @_main

		@_has =

			movement: no

			perspective: no

			rotation: no

			rotate3d: no

			scale: no

			localMovement: no

			localRotation: no

		@_tempMode = no

	temporarily: ->

		copyStack @_main, @_temp

		@_current = @_temp

		@_tempMode = yes

		@

	commit: ->

		if @_tempMode

			copyStack @_temp, @_main
			@_current = @_main

			@_tempMode = no

		@

	rollBack: ->

		if @_tempMode

			@_current = @_main

			@_tempMode = no

		@

	###
	Movement
	###

	resetMovement: ->

		@_has.movement = no

		@_current[0] = 0
		@_current[1] = 0
		@_current[2] = 0

		@

	getMovement: ->

		@_current.movement

	moveTo: (x, y, z) ->

		@_has.movement = yes

		@_current[0] = x
		@_current[1] = y
		@_current[2] = z

		@

	moveXTo: (x) ->

		@_has.movement = yes

		@_current[0] = x

		@

	moveYTo: (y) ->

		@_has.movement = yes

		@_current[1] = y

		@

	moveZTo: (z) ->

		@_has.movement = yes

		@_current[2] = z

		@

	move: (x, y, z) ->

		@_has.movement = yes

		@_current[0] += x
		@_current[1] += y
		@_current[2] += z

		@

	moveX: (x) ->

		@_has.movement = yes

		@_current[0] += x

		@

	moveY: (y) ->

		@_has.movement = yes

		@_current[1] += y

		@

	moveZ: (z) ->

		@_has.movement = yes

		@_current[2] += z

		@

	###
	Scale
	###

	resetScale: ->

		@_has.scale = no

		@_current[3] = 1
		@_current[4] = 1
		@_current[5] = 1

		@

	getScale: ->

		@_current.scale

	scaleTo: (x, y, z) ->

		@_has.scale = yes

		@_current[3] = x
		@_current[4] = y
		@_current[5] = z

		@

	scaleXTo: (x) ->

		@_has.scale = yes

		@_current[3] = x

		@

	scaleYTo: (y) ->

		@_has.scale = yes

		@_current[4] = y

		@

	scaleZTo: (z) ->

		@_has.scale = yes

		@_current[5] = z

		@

	scale: (x, y, z) ->

		@_has.scale = yes

		@_current[3] *= x
		@_current[4] *= y
		@_current[5] *= z

		@

	scaleAllTo: (x) ->

		if x is 1

			@_has.scale = no

		else

			@_has.scale = yes

		@_current[3] = @_current[4] = @_current[5] = x

		@

	scaleX: (x) ->

		@_has.scale = yes

		@_current[3] *= x

		@

	scaleY: (y) ->

		@_has.scale = yes

		@_current[4] *= y

		@

	scaleZ: (z) ->

		@_has.scale = yes

		@_current[5] *= z

		@

	###
	Perspective
	###

	resetPerspective: ->

		@_current[6] = 0

		@_has.perspective = no

		@

	perspective: (d) ->

		@_current[6] = d

		if d

			@_has.perspective = yes

		@

	getPerspective: ->

		@_current[6]

	###
	Rotation
	###

	resetRotation: ->

		@_has.rotation = no

		@_current[7] = 0
		@_current[8] = 0
		@_current[9] = 0

		@

	getRotation: ->

		@_current.rotation

	rotateTo: (x, y, z) ->

		@_has.rotation = yes

		@_current[7] = x
		@_current[8] = y
		@_current[9] = z

		@

	rotateXTo: (x) ->

		@_has.rotation = yes

		@_current[7] = x

		@

	rotateYTo: (y) ->

		@_has.rotation = yes

		@_current[8] = y

		@

	rotateZTo: (z) ->

		@_has.rotation = yes

		@_current[9] = z

		@

	rotate: (x, y, z) ->

		@_has.rotation = yes

		@_current[7] += x
		@_current[8] += y
		@_current[9] += z

		@

	rotateX: (x) ->

		@_has.rotation = yes

		@_current[7] += x

		@

	rotateY: (y) ->

		@_has.rotation = yes

		@_current[8] += y

		@

	rotateZ: (z) ->

		@_has.rotation = yes

		@_current[9] += z

		@

	###
	rotate3d
	###

	rotate3d: (x, y, z, amount) ->

		@_has.rotate3d = yes

		@_current[16] = x
		@_current[17] = y
		@_current[18] = z
		@_current[19] = amount

		@

	getRotate3d: ->

		@_current.rotate3d

	###
	Local Movement
	###

	resetLocalMovement: ->

		@_has.localMovement = no

		@_current[10] = 0
		@_current[11] = 0
		@_current[12] = 0

		@

	getLocalMovement: ->

		@_current.localMovement

	localMoveTo: (x, y, z) ->

		@_has.localMovement = yes

		@_current[10] = x
		@_current[11] = y
		@_current[12] = z

		@

	localMoveXTo: (x) ->

		@_has.localMovement = yes

		@_current[10] = x

		@

	localMoveYTo: (y) ->

		@_has.localMovement = yes

		@_current[11] = y

		@

	localMoveZTo: (z) ->

		@_has.localMovement = yes

		@_current[12] = z

		@

	localMove: (x, y, z) ->

		@_has.localMovement = yes

		@_current[10] += x
		@_current[11] += y
		@_current[12] += z

		@

	localMoveX: (x) ->

		@_has.localMovement = yes

		@_current[10] += x

		@

	localMoveY: (y) ->

		@_has.localMovement = yes

		@_current[11] += y

		@

	localMoveZ: (z) ->

		@_has.localMovement = yes

		@_current[12] += z

		@

	###
	Local Rotation
	###

	resetLocalRotation: ->

		@_has.localRotation = no

		@_current[13] = 0
		@_current[14] = 0
		@_current[15] = 0

		@

	getLocalRotation: ->

		@_current.localRotation

	localRotateTo: (x, y, z) ->

		@_has.localRotation = yes

		@_current[13] = x
		@_current[14] = y
		@_current[15] = z

		@

	localRotateXTo: (x) ->

		@_has.localRotation = yes

		@_current[13] = x

		@

	localRotateYTo: (y) ->

		@_has.localRotation = yes

		@_current[14] = y

		@

	localRotateZTo: (z) ->

		@_has.localRotation = yes

		@_current[15] = z

		@

	localRotate: (x, y, z) ->

		@_has.localRotation = yes

		@_current[13] += x
		@_current[14] += y
		@_current[15] += z

		@

	localRotateX: (x) ->

		@_has.localRotation = yes

		@_current[13] += x

		@

	localRotateY: (y) ->

		@_has.localRotation = yes

		@_current[14] += y

		@

	localRotateZ: (z) ->

		@_has.localRotation = yes

		@_current[15] += z

		@

	resetAll: ->

		do @resetMovement
		do @resetScale
		do @resetPerspective
		do @resetRotation
		do @resetLocalMovement
		do @resetLocalRotation