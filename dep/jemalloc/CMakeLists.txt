#
# Copyright (C) 2008 - 2011 Trinity <http://www.trinitycore.org/>
#
# Copyright (C) 2010 - 2011 Myth Project <http://bitbucket.org/sun/myth-core/>
#
# Myth Project's source is based on the Trinity Project source, you can find the
# link to that easily in Trinity Copyrights. Myth Project is a private community.
# To get access, you either have to donate or pass a developer test.
# You can't share Myth Project's sources! Only for personal use.
#

file(GLOB sources src/*.c)

set(jemalloc_STAT_SRC
  ${sources}
)

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}/include
)

add_definitions(-D_GNU_SOURCE -D_REENTRANT)

add_library(jemalloc STATIC ${sources})