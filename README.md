# imgopt
Simple gulp script which optimizes pngs and svgs and re-saves jpgs as progressive.

## Use

run `gulp optimize` to optimize images in the src directory. The optimized images will be stored in the `dest` directory

run `gulp responsive` to generate half size versions of each images in `src` and move them to `dest`. It will also optimize them

Both functions run recursively, and access a gulp cache so go ahead and store loads of files in `src`.
