module.exports = function(grunt) {
	const sass = require('node-sass');

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		watch: {
			sass: {
				files: ['assets/stylesheets/**/*.{scss,sass}'],
				tasks: ['sass:dist']
			},
			javascript: {
                files: ['assets/vendor/js/**/*.js', 'assets/js/*.js'],
                tasks: ['uglify:applibs']
            },
			livereload: {
				files: ['css/*.css'],
				options: {
					livereload: false
				}
			}
		},
		sass: {
			options: {
				sourceMap: true,
				implementation: sass,
				outputStyle: 'compressed'
			},
			dist: {
				files: {
					'assets/dist/styles.css': 'assets/stylesheets/application.css.scss'
				}
			}
		},
		uglify: {
			applibs:{
			  options: {
			  	// beautify: true,
			  	// mangle: false,
			    // the banner is inserted at the top of the output
			    banner: '/*! Marshwood Music Events <%= grunt.template.today("dd-mm-yyyy") %> */\n'
			  },
			  files: {
			  	'assets/dist/app.js': [
					 'assets/js/*.js'
			  	]
			  }
			},
			libraries:{
				options:{
					// preserveComments: true,
					banner: '/*! Marshwood Music Events - Consolidated Open Source Libraries. Generated: <%= grunt.template.today("dd-mm-yyyy") %> */\n\n'
				},
				files: {
					'assets/dist/lib.js':
					[
				      	'node_modules/@popperjs/core/dist/umd/popper.js',
				      	'node_modules/bootstrap/dist/js/bootstrap.bundle.js',
				      	'assets/vendor/js/*.js',
				      	'assets/vendor/js/**/*.js' 	
				    ]
				}

			}

		  
		}

	});
	grunt.registerTask('default', ['sass:dist', 'uglify', 'watch']);
	grunt.loadNpmTasks('grunt-sass');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-watch');
};