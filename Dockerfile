FROM debian:buster

RUN apt-get update \
 && apt-get install -y locales \
 && dpkg-reconfigure -f noninteractive locales \
 && locale-gen C.UTF-8 \
 && /usr/sbin/update-locale LANG=C.UTF-8 \
 && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
 && locale-gen \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Users with other locales should set this in their derivative image
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update
RUN apt-get install -y curl unzip python3 python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python \
 && ln -s /usr/bin/pip3 /usr/bin/pip
RUN pip install --upgrade pip
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN pip install numpy pandas matplotlib azure statsmodels flask flask-api jupyter

# http://blog.stuart.axelbrooke.com/python-3-on-spark-return-of-the-pythonhashseed
ENV PYTHONHASHSEED 0
ENV PYTHONIOENCODING UTF-8
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV HOMEDIR=/tmp

# JAVA
RUN apt-get update \
 && apt-get install -y openjdk-11-jdk \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR $HOMEDIR
PS D:\OneDrive - OUI SNCF\Docker\debian_python> cat .\Dockerfile
FROM debian:buster

RUN apt-get update \
 && apt-get install -y locales \
 && dpkg-reconfigure -f noninteractive locales \
 && locale-gen C.UTF-8 \
 && /usr/sbin/update-locale LANG=C.UTF-8 \
 && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
 && locale-gen \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Users with other locales should set this in their derivative image
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update
RUN apt-get install -y curl unzip python3 python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python \
 && ln -s /usr/bin/pip3 /usr/bin/pip
RUN pip install --upgrade pip
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN pip install numpy pandas matplotlib azure statsmodels flask flask-api jupyter

ENV PYTHONHASHSEED 0
ENV PYTHONIOENCODING UTF-8
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV HOMEDIR=/tmp

# JAVA
RUN apt-get update \
 && apt-get install -y openjdk-11-jdk \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR $HOMEDIR
