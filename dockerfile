FROM epitechcontent/epitest-docker:latest

WORKDIR /tmp

#install missing useful packages
RUN dnf -y install pulseaudio alsa-utils

#install vera++
RUN dnf -y install tcl-devel tk-devel lua-devel luabind luabind-devel boost-devel && \
    wget https://bitbucket.org/verateam/vera/downloads/vera++-1.2.1.tar.gz && \
    tar -xvf vera++-1.2.1.tar.gz && cd vera++-1.2.1/ && mkdir build && cd build && \
    cmake .. && make -j && make install

#crate universal user
RUN useradd -G audio,video,disk -m epitest
USER epitest

#copy vera config
RUN cp -rp /usr/local/lib/vera++ ~/.vera++ && \
    git clone https://github.com/YunnXairou/VeraProfileCodingStyleEpitech.git && \
    cd VeraProfileCodingStyleEpitech && \
    cp -r rules ~/.vera++/scripts/ && \
    cp coding_style_epitech ~/.vera++/profiles/ && \
    cp coding_style_epitech.params ~/.vera++/profiles/  && \
    echo "alias vera='vera++ -p coding_style_epitech --parameters ~/.vera++/profiles/coding_style_epitech.params'" >> ~/.bashrc

WORKDIR /home/epitest/project

USER root
ENTRYPOINT ["bash"]

CMD  ["-c", "setfacl -m u:epitest:rw /dev/snd/* && su epitest"]
