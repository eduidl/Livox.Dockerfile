FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p ~/opt && cd ~/opt \
    && git clone https://github.com/Livox-SDK/Livox-SDK.git \
    && cd Livox-SDK \
    && sed -i -E 's/(add_subdirectory\(sample)/# \1/' CMakeLists.txt \
    && mkdir -p build && cd build \
    && cmake .. && cmake --build . \
    && make install \
    && cd ~/opt && rm -rf Livox-SDK
