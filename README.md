# Geohash [![Build Status](https://travis-ci.com/rcedwards/geohash.svg?branch=master)](https://travis-ci.com/rcedwards/geohash)

Native Swift geohash package supporting binary and character encoding

Geohashes are represented internally as 64 bit integers.  A hash can be constructed either using character
precision (up to 12 characters) or binary precision (up to 32 bits per angle).

```swift
GeohashBits(location: Location(longitude: -0.1, latitude: 51.5), characterPrecision: 12).hash()
=> "gcpuvxr1jzf"
GeohashBits(location: Location(longitude: -0.1, latitude: 51.5), bitPrecision: 26).hash()
=> "gcpuvxr1jz" 
```

Note that the last value is truncated at 10 characters (50 bits) even though the "full" representation is 
52 bits total.  Since the character encoding is Base32, we require 5 bits for each.

The Geohash boundaries and centroids are correctly handled when the character representation provides a 
different number of bits for latitude and longitude (e.g. geohash 7 which has 18 bits of longitude and 17 
bits of latitude).

```swift
GeohashBits(hash: "u10hfr2").boundingBox().center()
=> (longitude: 0.0995635986328125, latitude: 51.5004730224609)
```

The library also supports computing neighbors:

```swift
GeohashBits(hash: "u10hfr2c4pv").neighbor(.north).hash()
=> "u10hfr2c60j"
```

## Testing

### macOS
Run `GeocodeTests` target via the `Geocode` scheme in `XCode`.

### Linux
Run the vagrant file and execute `swift test`

## Acknowledgements

Forked from [michael-groble/Geohash](https://github.com/michael-groble/Geohash):
* [Original BSD-3 License](./original_license.md) 

Based on the [Redis implementation](https://github.com/antirez/redis/blob/unstable/src/geohash.c), 
* Copyright (c) 2013-2014, yinqiwen <yinqiwen@gmail.com>
* Copyright (c) 2014, Matt Stancliff <matt@genges.com>
* Copyright (c) 2015-2016, Salvatore Sanfilippo <antirez@gmail.com>
