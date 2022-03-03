project "yaml-cpp"
	kind "StaticLib"
	language "C++"

	targetdir ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputDir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		
		"include/**.h"
	}

	includedirs
	{
		"include"
	}

	filter "system:windows"
		defines { "YAML_CPP_STATIC_DEFINE" }
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "on"

	filter "system:linux"
		defines { "YAML_CPP_STATIC_DEFINE" }
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "on"

	filter "configurations:Debug"
		symbols "on"
		runtime "Debug"

	filter "configurations:Release"
		optimize "on"
		runtime "Release"
		