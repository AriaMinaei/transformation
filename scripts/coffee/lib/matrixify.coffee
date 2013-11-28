{mat4} = require 'gl-matrix/src/gl-matrix/mat4'

module.exports =

	convert: (out, t) ->

		has = t._has

		# movement
		if has.movement

			mat4.translate out, out, t.getMovement()

		# perspectove
		if has.perspective

			throw Error "perspective not implemented yet"

		# rotation
		if has.rotation

			rot = t.getRotation()

			mat4.rotateX out, out, rot[0]

			mat4.rotateY out, out, rot[1]

			mat4.rotateZ out, out, rot[2]

		# translation
		if has.localMovement

			mat4.translate out, out, t.getLocalMovement()

		# rotation
		if has.localRotation

			rot = t.getLocalRotation()

			mat4.rotateX out, out, rot[0]

			mat4.rotateY out, out, rot[1]

			mat4.rotateZ out, out, rot[2]

		# scale
		if has.scale

			mat4.scale out, out, t.getScale()

		out