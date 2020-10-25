target_triple = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "spdlog"
    location "spdlog"
    kind "SharedLib"
    language "C"

    targetdir ("bin/"..target_triple.."/%{prj.name}")
    objdir ("bin/obj/"..target_triple.."/%{prj.name}")

    defines "SPDLOG_SHARED_LIB"

    files {
        "src/async.cpp",
        "src/cfg.cpp",
        "src/color_sinks.cpp",
        "file_sinks.cpp",
        "fmt.cpp",
        "spdlog.cpp",
        "stdout_sinks.cpp"
    }

    includedirs "%{prj.name}/include"

    filter "configurations:debug"
        defines "DEBUG"
        symbols "On"

    filter "configurations:release"
        defines "NDEBUG"
        optimize "On"
