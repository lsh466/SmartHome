# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lee/OpenFace/opencv-2.4.11

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lee/OpenFace/opencv-2.4.11/release

# Utility rule file for pch_Generate_opencv_test_superres.

# Include the progress variables for this target.
include modules/superres/CMakeFiles/pch_Generate_opencv_test_superres.dir/progress.make

modules/superres/CMakeFiles/pch_Generate_opencv_test_superres: modules/superres/test_precomp.hpp.gch/opencv_test_superres_RELEASE.gch


modules/superres/test_precomp.hpp.gch/opencv_test_superres_RELEASE.gch: ../modules/superres/test/test_precomp.hpp
modules/superres/test_precomp.hpp.gch/opencv_test_superres_RELEASE.gch: modules/superres/test_precomp.hpp
modules/superres/test_precomp.hpp.gch/opencv_test_superres_RELEASE.gch: lib/libopencv_test_superres_pch_dephelp.a
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/lee/OpenFace/opencv-2.4.11/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating test_precomp.hpp.gch/opencv_test_superres_RELEASE.gch"
	cd /home/lee/OpenFace/opencv-2.4.11/release/modules/superres && /usr/bin/cmake -E make_directory /home/lee/OpenFace/opencv-2.4.11/release/modules/superres/test_precomp.hpp.gch
	cd /home/lee/OpenFace/opencv-2.4.11/release/modules/superres && /usr/bin/c++ -O3 -DNDEBUG -DNDEBUG -I"/home/lee/OpenFace/opencv-2.4.11/modules/superres/test" -I"/home/lee/OpenFace/opencv-2.4.11/modules/video/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/features2d/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/highgui/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/imgproc/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/flann/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/core/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/highgui/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/ts/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/superres/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/ocl/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/gpu/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/photo/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/objdetect/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/legacy/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/video/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/ml/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/calib3d/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/features2d/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/highgui/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/imgproc/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/flann/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/core/include" -isystem"/home/lee/OpenFace/opencv-2.4.11/release/modules/superres" -I"/home/lee/OpenFace/opencv-2.4.11/modules/superres/src" -I"/home/lee/OpenFace/opencv-2.4.11/modules/superres/include" -isystem"/home/lee/OpenFace/opencv-2.4.11/3rdparty/include/opencl/1.2" -I"/home/lee/OpenFace/opencv-2.4.11/modules/ocl/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/gpu/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/photo/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/objdetect/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/legacy/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/video/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/ml/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/calib3d/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/features2d/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/highgui/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/imgproc/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/flann/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/core/include" -isystem"/home/lee/OpenFace/opencv-2.4.11/release/modules/superres" -I"/home/lee/OpenFace/opencv-2.4.11/modules/superres/src" -I"/home/lee/OpenFace/opencv-2.4.11/modules/superres/include" -isystem"/home/lee/OpenFace/opencv-2.4.11/release" -fsigned-char -W -Wall -Werror=return-type -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Winit-self -Wpointer-arith -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -Wno-long-long -pthread -fomit-frame-pointer -msse -msse2 -msse3 -ffunction-sections -Wno-undef -Wno-shadow -x c++-header -o /home/lee/OpenFace/opencv-2.4.11/release/modules/superres/test_precomp.hpp.gch/opencv_test_superres_RELEASE.gch /home/lee/OpenFace/opencv-2.4.11/release/modules/superres/test_precomp.hpp

modules/superres/test_precomp.hpp: ../modules/superres/test/test_precomp.hpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/lee/OpenFace/opencv-2.4.11/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating test_precomp.hpp"
	cd /home/lee/OpenFace/opencv-2.4.11/release/modules/superres && /usr/bin/cmake -E copy /home/lee/OpenFace/opencv-2.4.11/modules/superres/test/test_precomp.hpp /home/lee/OpenFace/opencv-2.4.11/release/modules/superres/test_precomp.hpp

pch_Generate_opencv_test_superres: modules/superres/CMakeFiles/pch_Generate_opencv_test_superres
pch_Generate_opencv_test_superres: modules/superres/test_precomp.hpp.gch/opencv_test_superres_RELEASE.gch
pch_Generate_opencv_test_superres: modules/superres/test_precomp.hpp
pch_Generate_opencv_test_superres: modules/superres/CMakeFiles/pch_Generate_opencv_test_superres.dir/build.make

.PHONY : pch_Generate_opencv_test_superres

# Rule to build all files generated by this target.
modules/superres/CMakeFiles/pch_Generate_opencv_test_superres.dir/build: pch_Generate_opencv_test_superres

.PHONY : modules/superres/CMakeFiles/pch_Generate_opencv_test_superres.dir/build

modules/superres/CMakeFiles/pch_Generate_opencv_test_superres.dir/clean:
	cd /home/lee/OpenFace/opencv-2.4.11/release/modules/superres && $(CMAKE_COMMAND) -P CMakeFiles/pch_Generate_opencv_test_superres.dir/cmake_clean.cmake
.PHONY : modules/superres/CMakeFiles/pch_Generate_opencv_test_superres.dir/clean

modules/superres/CMakeFiles/pch_Generate_opencv_test_superres.dir/depend:
	cd /home/lee/OpenFace/opencv-2.4.11/release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lee/OpenFace/opencv-2.4.11 /home/lee/OpenFace/opencv-2.4.11/modules/superres /home/lee/OpenFace/opencv-2.4.11/release /home/lee/OpenFace/opencv-2.4.11/release/modules/superres /home/lee/OpenFace/opencv-2.4.11/release/modules/superres/CMakeFiles/pch_Generate_opencv_test_superres.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : modules/superres/CMakeFiles/pch_Generate_opencv_test_superres.dir/depend

