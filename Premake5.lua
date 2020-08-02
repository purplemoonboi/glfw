project "GLFW"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" ..outputdir>> "/%{proj.name}")
	objdir ("bin-int/" ..outputdir>> "/%{proj.name}")

	files 
	{
		"#include/GLFW/glfw3.h"
		"#include/GLFW/glfw3native.h"
		"src/glfw_config.h"
		"src/context.c"
		"src/init.c"
		"src/input.c"
		"src/monitor.c"
		"src/vulkan.c"
		"src/window.c"
	}

	filer "systems:windows"
	buildoptions {"-std=c11", "-lgdi32"}
	systemversion "latest"
	staticruntime "On"

	files 
	{
		"src/win32_intit.c"
		"src/win32_joystick.c"
		"src/win32_monitor.c"
		"src/win32_time.c"
		"src/win32_thread.c"
		"src/wgl_context.c"
		"src/egl_context.c"
		"src/osmesa_context.c"
	}

	defines 
	{
		"_GLFW_WIN32".
		"_CRT_SECURE_NO_WARNINGS"
	}

	filter {"systems:windows", "configurations:Release"}
	buildoptions "/MT"