module.exports = rotation =

	toPlainCss: (x, y, z) ->

		if -0.00001 < x < 0.00001

			x = 0


		if -0.00001 < y < 0.00001

			y = 0


		if -0.00001 < z < 0.00001

			z = 0

		"rotateX(#{x}rad) rotateY(#{y}rad) rotateZ(#{z}rad) "
