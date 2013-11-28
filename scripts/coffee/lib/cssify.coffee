module.exports = cssify =

	convert: (t) ->

		has = t._has
		current = t._current

		# movement
		if has.movement

			css = cssify._translation current[0], current[1], current[2]

		else

			css = ''

		# perspectove
		if has.perspective

			css += cssify._perspective current[6]

		# rotation
		if has.rotation

			css += cssify._rotation current[7], current[8], current[9]

		# translation
		if has.localMovement

			css += cssify._translation current[10], current[11], current[12]

		# rotation
		if has.localRotation

			css += cssify._rotation current[13], current[14], current[15]

		# scale
		if has.scale

			css += cssify._scale current[3], current[4], current[5]

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