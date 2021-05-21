# Dockerising the Information mining

This repository gives the reader the possibility to easily recreate the static
code analysis executed during the work for my Bachelor Thesis in *Software
Engineering and Management* at the *University of Gothenburg*.

The docker image contains all dependencies that are necessary to build the
various tools as well as the tooling provided by the SonarSource company. User
only need to create a placeholder project on SonarCloud and provide the
credentials of that project.

## Building the Docker Image

If you simply want to analyse versions of the projects that compile with the
given `build_script.sh` for the corresponding project, you will not need to make
any changes to the container and can skip to the next section.

There are however already at the point of writing this thesis versions of the 3
tools that require minor changes in the source code to properly compile and
build. To analyse those version, these changes need to be applied and the docker
image needs to be rebuilt with the changed source code.

Since the idea of this repository was to preserve the information, even if the
public repositories were to be deleted, the docker image preserves their
git-history prior to May 20th 2021 and does not dynamically clone the latest
versions. It will therefore be necessary to clone the latest developments in the
analysed repositories and rebuild the image when analysing future releases.

Once desired changes are made, the Docker image can be build from the root
directory:

```bash
docker build -t <image_name> .
```

## Starting an Analysis Process

Once you have the Docker container ready, you can simply run a manual analysis
of any of the 3 projects we are currently supporting. Depending of the mapper
you chose, you have to pass the relative path to the repositories root
directory. That is one of the following:

- "bowtie2_repo"
- "megahit_repo"
- "star_repo"

The full command for starting the process is based on the following pattern:

```bash
docker run --rm -it --network host --name <process_name> <image_name> "megahit_repo"
```

The argument `--rm` for removing the container and naming with `--name
<process_name>` are optional. The composed argument `-it` is necessary for the
shell-interactions executed at runtime. Using the host machine's network via
`--network host` is necessary to upload the results of sonar-scaner to to
SonarCloud.

## Step-by-step Analysis

Here will go detailed instructions.

Konrad Otto - May 20th, 2021