
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
$ ./runContainer.sh statick .
# statick tool executed in container
$ # out of the container
```

## The Official Statick Docker Container

SPAWAR Systems Center Pacific is the creator and maintainer of the Statick tool. The [Statick
repo](https://github.com/sscpac/statick) has a Dockerfile under `templates/Dockerfile`. Both
containers do approximately the same thing--install the tools and create a non-root user. Although I
may not have made this repo if I had realized the official container already existed, this repo has
a few subtle advantages:

- You can specify the user UID and GID at build-time
- Because this repo uses `requirements.txt` directly, it is always up-to-date
- The helper scripts let you hit the ground running
  - `buildImage.sh` for building and tagging
  - `runContainer.sh` to run the container interactively or via a script

## License

This code is made available under the Creative Commons Zero v1.0 Universal license. The full text is
available in the [LICENSE](LICENSE) file.
