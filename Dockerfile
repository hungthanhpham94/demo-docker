# Define working directory.
FROM python:3.5
WORKDIR /data
COPY . /data
CMD ["python3", "get-pip.py"]
RUN pip3 install numpy

################ DONE ###########################
# RUN pip3 install tornado
################ DONE ###########################
RUN pip3 install Pillow scipy opencv-python
RUN pip3 install -U flask-cors
RUN pip3 install shapely geojson Flask Cython
################ DONE ###########################
# Define default command.
CMD ["bash"]


# ================= TEST =======================
#FROM nvidia/cudagl:9.0-devel-ubuntu16.04
#LABEL maintainers="Tanmay Bangalore <tanmaybangalore@gmail.com>"
#
#RUN apt-get update && apt-get remove -y x264 libx264-dev
#RUN apt-get update && apt-get upgrade -y && apt-get install -y sudo clang-format wget apt-utils
#
## Get OpenCV dependencies
#RUN apt-get update && apt-get install -y build-essential checkinstall cmake pkg-config yasm git \
#    gfortran libjpeg8-dev libjasper-dev libpng12-dev libtiff5-dev libavcodec-dev libavformat-dev \
#    libswscale-dev libdc1394-22-dev libxine2-dev libv4l-dev libgstreamer0.10-dev \
#    libgstreamer-plugins-base0.10-dev qt5-default libgtk2.0-dev libtbb-dev libatlas-base-dev \
#    libfaac-dev libmp3lame-dev libtheora-dev libvorbis-dev libxvidcore-dev libopencore-amrnb-dev \
#    libopencore-amrwb-dev x264 v4l-utils libprotobuf-dev protobuf-compiler libgoogle-glog-dev \
#    libgflags-dev libgphoto2-dev libeigen3-dev libhdf5-dev doxygen \
#    python-dev python-pip python3-dev python3-pip &&\
#    rm -rf /var/lib/apt/lists/* &&\
#    pip2 install -U pip numpy &&\
#    pip3 install -U pip numpy &&\
#    pip install numpy scipy matplotlib scikit-image scikit-learn ipython
#
#RUN pip3 install http://download.pytorch.org/whl/cu90/torch-0.4.0-cp35-cp35m-linux_x86_64.whl
#RUN pip3 install torchvision
#RUN pip3 install tornado
#RUN pip3 install Pillow scipy opencv-python
#RUN pip3 install -U flask-cors
#RUN pip3 install shapely geojson Flask Cython
#RUN pip3 install xmltodict
#RUN pip3 install packaging
#RUN pip3 install PyYAML
#RUN pip3 install pycocotools
#RUN pip3 install cffi
## Set the working directory to /app
#WORKDIR /app
#
## Copy the current directory contents into the container at /app
#ADD . /app
#
#RUN pip3 install -r requirements.txt
#
#EXPOSE 8084
#
## Define environment variable
#ENV NAME World
#
## Run app.py when the container launches
#CMD ["python3", "app.py"]
#
### Fetch OpenCV
##RUN cd /opt && git clone --verbose https://github.com/opencv/opencv.git -b 3.4.1 &&\
##    cd /opt && wget https://github.com/opencv/opencv_contrib/archive/3.4.1.tar.gz &&\
##    mkdir opencv_contrib && tar -xf 3.4.1.tar.gz -C opencv_contrib --strip-components 1
##
##RUN cd /opt/opencv && mkdir release && cd release && \
##    cmake -G "Unix Makefiles" -DENABLE_PRECOMPILED_HEADERS=OFF -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
##    CMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local \
##    -DWITH_TBB=ON -DBUILD_NEW_PYTHON_SUPPORT=ON -DWITH_V4L=ON -DINSTALL_C_EXAMPLES=ON \
##    -DINSTALL_PYTHON_EXAMPLES=ON -DBUILD_EXAMPLES=OFF -DWITH_QT=ON -DWITH_OPENGL=ON \
##    -DWITH_CUDA=ON -DCUDA_GENERATION=Auto -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
##    .. &&\
##    make -j"$(nproc)"  && \
##    make install && \
##    ldconfig &&\
##cd /opt/opencv/release && make clean