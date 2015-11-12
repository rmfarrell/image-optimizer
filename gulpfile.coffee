gulp        = require 'gulp'
imagemin    = require 'gulp-imagemin'
clean       = require 'gulp-clean'
pngquant    = require 'imagemin-pngquant'
svgo        = require 'imagemin-svgo'
cache       = require 'gulp-cache'
responsive  = require 'gulp-responsive'

###*
* Optimize images with imagemin
* Runs recrusively, so it should leave your subdirectory folder intact
* Must specify a src folder and destination folder
* ex. gulp images --dest ./assets/img/folder_name --src ./_raw_img
###

src = 'src'
dest = 'dest'

gulp.task 'optimize', ->

  gulp.src(src + '/**/*')
    .pipe(cache(imagemin(
      progressive: true,
      use: [pngquant(), svgo()]
    )))
    .pipe(gulp.dest dest)

# *
# Shrink Images by 1/2
# Scope is one folder defined on -d arg from command line
# example: `$gulp half-size-images -d ./assets/img/whatever`
# shrinks every image in the that directory
# appends -@1x to image name.
# *
gulp.task 'responsive', ->

  return gulp.src(src + '/**/*')
    .pipe(cache(imagemin(
      progressive: true,
      use: [pngquant(), svgo()]
    )))
    .pipe(responsive(
      '**/*': {
        width: '50%',
        rename: {
          suffix: '-@1x'
        }
      }, {
        errorOnUnusedImage: false
      }
    ))
    .pipe(gulp.dest dest)


