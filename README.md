# Fortune test

An API that utilizes `fortune` command.

## Prerequisities

For application to work properly, you need to install `fortune` unix utility. 

You can download it [here](http://download.cnet.com/fortune/3000-20416_4-8558.html).

## Usage

To get a random fortune access API via url: `/fortune/{?long}/{?dirty}`

Parameters:

__long:__ 0 = disallow long, 1 = force long, null value indicates allow but do not force (integer, optional)
__dirty:__ 0 = only clean ones, 1 = only dirty ones, null value defaults to only clean ones (integer, optional) 

## Testing

To test application, simply run `rspec` from application's root directory.
