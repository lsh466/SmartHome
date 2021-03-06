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

# Utility rule file for pch_Generate_opencv_gpu.

# Include the progress variables for this target.
include modules/gpu/CMakeFiles/pch_Generate_opencv_gpu.dir/progress.make

modules/gpu/CMakeFiles/pch_Generate_opencv_gpu: modules/gpu/precomp.hpp.gch/opencv_gpu_RELEASE.gch


modules/gpu/precomp.hpp.gch/opencv_gpu_RELEASE.gch: ../modules/gpu/src/precomp.hpp
modules/gpu/precomp.hpp.gch/opencv_gpu_RELEASE.gch: modules/gpu/precomp.hpp
modules/gpu/precomp.hpp.gch/opencv_gpu_RELEASE.gch: lib/libopencv_gpu_pch_dephelp.a
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/lee/OpenFace/opencv-2.4.11/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating precomp.hpp.gch/opencv_gpu_RELEASE.gch"
	cd /home/lee/OpenFace/opencv-2.4.11/release/modules/gpu && /usr/bin/cmake -E make_directory /home/lee/OpenFace/opencv-2.4.11/release/modules/gpu/precomp.hpp.gch
	cd /home/lee/OpenFace/opencv-2.4.11/release/modules/gpu && /usr/bin/c++ -O3 -DNDEBUG -DNDEBUG -fPIC -I"/home/lee/OpenFace/opencv-2.4.11/modules/gpu/src/cuda" -I"/home/lee/OpenFace/opencv-2.4.11/modules/photo/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/objdetect/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/legacy/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/video/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/ml/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/calib3d/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/features2d/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/highgui/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/imgproc/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/flann/include" -I"/home/lee/OpenFace/opencv-2.4.11/modules/core/include" -isystem"/home/lee/OpenFace/opencv-2.4.11/release/modules/gpu" -I"/home/lee/OpenFace/opencv-2.4.11/modules/gpu/src" -I"/home/lee/OpenFace/opencv-2.4.11/modules/gpu/include" -isystem"/home/lee/OpenFace/opencv-2.4.11/release" -fsigned-char -W -Wall -Werror=return-type -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -Wno-long-long -pthread -fomit-frame-pointer -msse -msse2 -msse3 -ffunction-sections -DCVAPI_EXPORTS -x c++-header -o /home/lee/OpenFace/opencv-2.4.11/release/modules/gpu/precomp.hpp.gch/opencv_gpu_RELEASE.gch /home/lee/OpenFace/opencv-2.4.11/release/modules/gpu/precomp.hpp

modules/gpu/precomp.hpp: ../modules/gpu/src/precomp.hpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/lee/OpenFace/opencv-2.4.11/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating precomp.hpp"
	cd /home/lee/OpenFace/opencv-2.4.11/release/modules/gpu && /usr/bin/cmake -E copy /home/lee/OpenFace/opencv-2.4.11/modules/gpu/src/precomp.hpp /home/lee/OpenFace/opencv-2.4.11/release/modules/gpu/precomp.hpp

pch_Generate_opencv_gpu: modules/gpu/CMakeFiles/pch_Generate_opencv_gpu
pch_Generate_opencv_gpu: modules/gpu/precomp.hpp.gch/opencv_gpu_RELEASE.gch
pch_Generate_opencv_gpu: modules/gpu/precomp.hpp
pch_Generate_opencv_gpu: modules/gpu/CMakeFiles/pch_Generate_opencv_gpu.dir/build.make

.PHONY : pch_Generate_opencv_gpu

# Rule to build all files generated by this target.
modules/gpu/CMakeFiles/pch_Generate_opencv_gpu.dir/build: pch_Generate_opencv_gpu

.PHONY : modules/gpu/CMakeFiles/pch_Generate_opencv_gpu.dir/build

modules/gpu/CMakeFiles/pch_Generate_opencv_gpu.dir/clean:
	cd /home/lee/OpenFace/opencv-2.4.11/release/modules/gpu && $(CMAKE_COMMAND) -P CMakeFiles/pch_Generate_opencv_gpu.dir/cmake_clean.cmake
.PHONY : modules/gpu/CMakeFiles/pch_Generate_opencv_gpu.dir/clean

modules/gpu/CMakeFiles/pch_Generate_opencv_gpu.dir/depend:
	cd /home/lee/OpenFace/opencv-2.4.11/release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lee/OpenFace/opencv-2.4.11 /home/lee/OpenFace/opencv-2.4.11/modules/gpu /home/lee/OpenFace/opencv-2.4.11/release /home/lee/OpenFace/opencv-2.4.11/release/modules/gpu /home/lee/OpenFace/opencv-2.4.11/release/modules/gpu/CMakeFiles/pch_Generate_opencv_gpu.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : modules/gpu/CMakeFiles/pch_Generate_opencv_gpu.dir/depend

