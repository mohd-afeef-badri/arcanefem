cmake_minimum_required(VERSION 3.21)
project(FemTest1Main LANGUAGES NONE)
enable_testing()

add_subdirectory(femutils)
add_subdirectory(fem1)
add_subdirectory(bilaplacian)
add_subdirectory(passmo)