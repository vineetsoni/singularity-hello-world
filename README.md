# Singularity Hello-World

This repository contains:

- Hello-World program written in Fortran
- Singularity definition file to build this container
- Jenkinsfile to test the workflow


## Building container

The container can be built either locally (as root or using `--fakeroot` option) or remotely on the cloud as:

```bash
# Locally
# -------
# As root
sudo singularity build helloworld.sif helloworld.def
# Without root
singularity build --fakeroot helloworld.sif helloworld.def

# Remotely
# --------
singularity remote login --tokenfile <token-file>
singularity build --remote helloworld.sif helloworld.def
```
