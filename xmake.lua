
-- add modes: debug and release 
-- add_rules("mode.release")

-- add target
target("mayaCpp")
    set_languages("cxx11")
    set_symbols("debug")
    
    set_kind("shared")
    add_files("src/*.cpp") 

    add_includedirs("C:/Users/Administrator/Desktop/maya2017u5/devkitBase/include")
    add_linkdirs("C:/Program Files/Autodesk/Maya2017/lib")
    add_links("Foundation",
    "OpenMaya",
    "OpenMayaAnim",
    "OpenMayaFX",
    "OpenMayaRender",
    "OpenMayaUI")
    add_defines("NDEBUG",
    "WIN32",
    "NT_PLUGIN",
    "TBB_USE_DEBUG=0",
    "__TBB_LIB_NAME=tbb.lib",
    "REQUIRE_IOSTREAM",
    "AW_NEW_IOSTREAMS",
    "Bits64_",
    "mayaCpp_EXPORTS")
    set_optimize("fastest")
    set_warnings("more")
    -- add_shflags("/DEF:src/main.def", {force = true})
    add_shflags("/export:initializePlugin /export:uninitializePlugin",{force=true})
    -- 要用强制导出
    -- after_build(
    --     function(target)
    --         local targetFile = target:targetfile()
    --         os.mv(targetFile,path.join(path.directory(targetFile),format("%s.%s",path.basename(targetFile),"mll")))
    --     end
    -- )
    set_filename("mayaCpp.mll")


--
-- FAQ
--
-- You can enter the project directory firstly before building project.
--   
--   $ cd projectdir
-- 
-- 1. How to build project?
--   
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install 
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code 
--    -- add macro defination
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "cxx11")
--
--    -- set optimization: none, faster, fastest, smallest 
--    set_optimize("fastest")
--    
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox", "z", "pthread")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--
-- 7. If you want to known more usage about xmake, please see http://xmake.io/#/home
--
    
