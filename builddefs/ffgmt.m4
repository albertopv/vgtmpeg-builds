include(`builddefs/gstcommon.m4')
include([builddefs/vgtmpeg.m4])
include([builddefs/libvpx.m4])
include([builddefs/pthreads-w32.m4])
include([builddefs/x264.m4])
include([builddefs/x265.m4])
include([builddefs/lame.m4])
include([builddefs/libdvdread.m4])
include([builddefs/libbluray.m4])
include([builddefs/xvid.m4])
include([builddefs/ffmpeg.m4])
include([builddefs/fdk-aac.m4])
include([builddefs/libopus.m4])


DEFMOD([ffgmt_dist], [HEAD], [gst_dist_builder], [git], [$(NL_GIT_BASE)],,,[./autogen.sh] )
DEFMOD_MAKECMD([ffgmt_dist],[GSTDISTCMD([vgtmpeg_release],[ffgmt_dist])])
DEFMOD_INSTCMD([ffgmt_dist],[:])

opt = --enable-gpl --enable-nonfree --disable-shared --disable-indevs --disable-outdevs
opt += --disable-network  
#opt += --disable-encoders
#opt += --disable-muxers

# enable encoders
opt += --enable-libfdk-aac --enable-encoder=libfdk_aac
opt += --enable-libvpx --enable-encoder=libvpx_vp8 
opt += --enable-libxvid --enable-encoder=libxvid
opt += --enable-libx264 --enable-encoder=libx264 
opt += --enable-libx265 --enable-encoder=libx265 
opt += --enable-libvorbis --enable-encoder=libvorbis --disable-encoder=vorbis
opt += --enable-encoder=mpeg4
opt += --enable-libmp3lame --enable-encoder=libmp3lame
opt += --enable-libopus --enable-encoder=libopus --enable-decoder=libopus

# enable protocols
opt += --enable-protocol=bluray --enable-libbluray

# enable muxers
#opt += --enable-muxer=avi 
#opt += --enable-muxer=mp4 
#opt += --enable-muxer=asf
#opt += --enable-muxer=flv
#opt += --enable-muxer=wav

DEFMOD_COPT_ADD([vgtmpeg], [ $(opt) ] )
dnl DEFMOD_COPT_ADD([ffmpeg], [--disable-indevs --disable-outdevs --disable-shared --enable-gpl  --disable-network --disable-muxers --enable-muxer=mp4 --disable-encoders --enable-encoder=mpeg4 ] )
DEFMOD_COPT_ADD([faac], [--disable-shared ] )

PKG =
ifeq ($(buildtype),windows-x86_32)
  dnl  PKG = pthreads-w32
endif

ifeq ($(buildtype),windows-x86_64)
 dnl   PKG = pthreads-w32
endif

PKG += opus fdk-aac xvid libbluray libdvdread lame libogg libvorbis libvpx x264 x265 vgtmpeg 


