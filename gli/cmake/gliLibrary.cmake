
file(GLOB SOURCES_ROOT project/gli/*.cpp)
file(GLOB INLINES_ROOT project/gli/*.inl)
file(GLOB HEADERS_ROOT project/gli/*.hpp)

file(GLOB SOURCES_CORE project/gli/core/*.cpp)
file(GLOB INLINES_CORE project/gli/core/*.inl)
file(GLOB HEADERS_CORE project/gli/core/*.hpp)

set(HEADERS_PUBLIC
    ${HEADERS_ROOT}  ${INLINE_ROOT}
    ${HEADERS_CORE}  ${INLINE_CORE}
)

set(SOURCES_PRIVATE
    ${SOURCES_ROOT}
    ${SOURCES_CORE}
)
