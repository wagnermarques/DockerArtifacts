FROM wagnermarques/fzl_vnc:0.0.1
MAINTAINER wagnerdocri@gmail.com

#TODO: use this xfce (when its fixed and working) for base to cinelerra

#installing rpmfusion
RUN dnf -y install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-27.noarch.rpm
RUN echo 'y' | rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-27

RUN dnf -y install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-27.noarch.rpm
RUN echo 'y' | rpm  --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-27

RUN dnf -y install amrnb amrwb faad2 flac ffmpeg gpac-libs lame libfc14audiodecoder mencoder mplayer x264 x265 gstreamer-plugins-espeak gstreamer-plugins-fc gstreamer-rtsp gstreamer-plugins-good gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-plugins-base gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good


# Install the appropriate software
RUN dnf -y update

# Install xfce minimal (from:https://forums.fedoraforum.org/showthread.php?310618-How-to-install-minimal-XFCE-without-using-groupinstall-or-xfce-desktop-environment)
RUN dnf -y install xfce4-{appfinder,session,settings,terminal} xfdesktop Thunar

#codecs and multimedia requirements
RUN dnf -y install amrnb amrwb faad2 flac \
            ffmpeg gpac-libs lame libfc14audiodecoder \
            mencoder mplayer x264 x265 \
            gstreamer-plugins-espeak gstreamer-plugins-fc gstreamer-rtsp \
            gstreamer-plugins-good gstreamer-plugins-bad \
            gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree \
            gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-plugins-base \
            gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld \
            gstreamer1-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly \
            gstreamer1-plugins-bad-free gstreamer1-plugins-good


#cinelerra installation
RUN dnf -y install firefox
 
 

RUN dnf clean all

RUN sed -i '/\/etc\/X11\/xinit\/xinitrc-common/a [ -x /usr/bin/firefox ] && /usr/bin/firefox &' /etc/X11/xinit/xinitrc

EXPOSE 5901

CMD    ["vncserver", "-fg" ]
# ENTRYPOINT ["vncserver", "-fg" ]
