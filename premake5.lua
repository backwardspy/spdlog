target_triple = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "spdlog"
    kind "SharedLib"
    language "C++"
    cppdialect "C++17"

    disablewarnings {
        "4251",
        "4275",
    }

    targetdir ("bin/"..target_triple.."/%{prj.name}")
    objdir ("bin/obj/"..target_triple.."/%{prj.name}")

    defines {
        "SPDLOG_COMPILED_LIB",
        "SPDLOG_SHARED_LIB",
        "FMT_EXPORT",
        "spdlog_EXPORTS",
    }

    files {
        "src/**.cpp",
        "include/**.h",
    }

    includedirs "include"

    filter "configurations:debug"
        defines "DEBUG"
        symbols "On"

    filter "configurations:release"
        defines "NDEBUG"
        optimize "On"
