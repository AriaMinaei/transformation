module.exports = cssify =

	convert: (t) ->

		has = t._has

		# movement
		if has.movement

			css = cssify._translation @_current[0], @_current[1], @_current[2]

		else

			css = ''

		# perspectove
		if has.perspective

			css += cssify._perspective @_current[6]

		# rotation
		if has.rotation

			css += cssify._rotation @_current[7], @_current[8], @_current[9]

		# translation
		if has.localMovement

			css += cssify._translation @_current[10], @_current[11], @_current[12]

		# rotation
		if has.localRotation

			css += cssify._rotation @_current[13], @_current[14], @_current[15]

		# scale
		if has.scale

			css += cssify._scale @_current[3], @_current[4], @_current[5]

		css

	_perspective: (d) ->

		"perspective(#{d}) "

	_rotation: (x, y, z) ->

		if -0.00001 < x < 0.00001

			x = 0


		if -0.00001 < y < 0.00001

			y = 0


		if -0.00001 < z < 0.00001

			z = 0

		"rotateX(#{x}rad) rotateY(#{y}rad) rotateZ(#{z}rad) "

	_scale: (x, y, z) ->

		if -0.00001 < x < 0.00001

			x = 0


		if -0.00001 < y < 0.00001

			y = 0


		if -0.00001 < z < 0.00001

			z = 0

		"scale3d(#{x}, #{y}, #{z}) "

	_translate: (x, y, z) ->

		if -0.00001 < x < 0.00001

			x = 0


		if -0.00001 < y < 0.00001

			y = 0


		if -0.00001 < z < 0.00001

			z = 0

		"translate3d(#{x}px, #{y}px, #{z}px) "