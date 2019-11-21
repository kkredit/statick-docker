
# Statick Docker Container

Build and run a Docker container encapsulating the [Statick](https://github.com/sscpac/statick)
static analysis framework.

## Usage

Using this repo requires Docker to be preinstalled.

To use the container, run the following:

```sh
$ ./buildImage.sh
$ ./runContainer.sh
Welcome to the Statick Docker environment
$ # in the container; the current directory is mounted as /host
$ exit
$ # out of the container
$ ./runContainer.sh mkdir statick_output && statick . statick_output
# statick tool executed in container
$ # out of the container
```

## License

This code is made available under the Creative Commons Zero v1.0 Universal license. The full text is
available in the [LICENSE](LICENSE) file.
