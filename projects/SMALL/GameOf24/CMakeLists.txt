#
# Using CMake for compilation
#
cmake_minimum_required (VERSION 2.6)
project (GameOf24)
#
set(PATSCC $ENV{PATSHOME}/bin/patscc)
set(PATSopt $ENV{PATSHOME}/bin/patsopt)
#
macro(
  patscc_sats fname
)
add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${fname}_sats.c
  COMMAND ${PATSCC} -ccats ${CMAKE_SOURCE_DIR}/${fname}.sats
  MAIN_DEPENDENCY ${fname}.sats
)
endmacro(patscc_sats)
#
macro(
  patscc_dats fname
)
add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${fname}_dats.c
  COMMAND ${PATSCC} -ccats ${CMAKE_SOURCE_DIR}/${fname}.dats
  MAIN_DEPENDENCY ${fname}.dats
)
endmacro(patscc_dats)
#
patscc_dats(GameOf24)
patscc_dats(GameOf24_card)
patscc_dats(GameOf24_cardset)
patscc_dats(GameOf24_solve)
patscc_dats(GameOf24_mylib)
#
add_executable(
  GameOf24
  GameOf24_dats.c
  GameOf24_card_dats.c
  GameOf24_cardset_dats.c
  GameOf24_solve_dats.c
  GameOf24_mylib_dats.c
)
#
add_definitions(-DATS_MEMALLOC_LIBC)
#
include_directories("$ENV{PATSHOME}" "$ENV{PATSHOME}/ccomp/runtime")
#
###### end of [CMakeLists.txt] ######
