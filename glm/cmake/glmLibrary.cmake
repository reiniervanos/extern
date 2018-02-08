
file(GLOB INLINES_ROOT project/glm/*.inl)
file(GLOB HEADERS_ROOT project/glm/*.hpp)

file(GLOB SOURCES_CORE project/glm/detail/glm.cpp)
file(GLOB INLINES_CORE project/glm/detail/*.inl)
file(GLOB HEADERS_CORE project/glm/detail/*.hpp)

file(GLOB INLINES_GTC  project/glm/gtc/*.inl)
file(GLOB HEADERS_GTC  project/glm/gtc/*.hpp)

file(GLOB INLINES_GTX  project/glm/gtx/*.inl)
file(GLOB HEADERS_GTX  project/glm/gtx/*.hpp)

file(GLOB INLINES_SIMD project/glm/simd/*.inl)
file(GLOB HEADERS_SIMD project/glm/simd/*.h)

set(HEADERS_PUBLIC
    ${HEADERS_ROOT} ${INLINE_ROOT}
    ${HEADERS_CORE} ${INLINE_CORE}
    ${HEADERS_GTC}  ${INLINE_GTC}
    ${HEADERS_GTX}  ${INLINE_GTX}
    ${HEADERS_SIMD} ${INLINE_SIMD}
)

set(SOURCES_PRIVATE
     ${SOURCES_CORE}
)