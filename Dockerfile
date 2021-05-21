FROM ubuntu:20.04
RUN apt-get update \
  && apt-get -y install git \
  && apt-get -y install build-essential \
  && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
  && apt-get -y install cmake \
  && apt-get -y install zlib1g-dev \
  && apt-get -y install libtbb-dev \
  && apt-get -y install unzip \
  && apt-get -y install curl \
  && apt-get -y install dialog

# Add and unzip build-wrapper and sonar-scanner
RUN mkdir /opt/sonar
ADD build-wrapper-linux-x86.zip /opt/sonar
ADD sonar-scanner-cli-4.4.0.2170-linux.zip /opt/sonar
RUN cd /opt/sonar \
  && unzip build-wrapper-linux-x86.zip && rm build-wrapper-linux-x86.zip \
  && unzip sonar-scanner-cli-4.4.0.2170-linux.zip \
  && rm sonar-scanner-cli-4.4.0.2170-linux.zip

# add build-wrapper to PATH
ENV PATH="/opt/sonar/build-wrapper-linux-x86/:${PATH}"
ENV PATH="/opt/sonar/sonar-scanner-4.4.0.2170-linux/bin/:${PATH}"

WORKDIR "/home"
COPY run_analysis.sh select_tag.sh set_sonar_params.sh ./
COPY "bowtie2_repo" "bowtie2_repo"
COPY "megahit_repo" "megahit_repo"
COPY "star_repo" "star_repo"

ENTRYPOINT ["bash", "./run_analysis.sh"]