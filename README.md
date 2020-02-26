# Handles

A lightweight (primitive), integer-like handle to a resource.  Useful for dispatch.
i.e. pretty much an integer, but with a unique dispatch signature.

@HandleType(n)

Create a new type named n to be used as a handle to your resource.

Example:
    
    julia> @HandleType(Foo)
    Foo

    julia> foo(x::Integer) = x*x
    foo (generic function with 1 method)

    julia> foo(Foo(2))
    4

    julia> foo(x::Foo) = x-x
    foo (generic function with 2 methods)

    julia> foo(Foo(2))
    0

## Project Information

### Contributing

Please read [CONTRIBUTING.md](./CONTRIBUTING.md) for details.

### Authors

* **Michael Alexander Ewert** - Developer - [Digital Domain](https://digitaldomain.com)

### License

This project is licensed under a modified Apache 2.0 license - see the [LICENSE](./LICENSE) file for details
