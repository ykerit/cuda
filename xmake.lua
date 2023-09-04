add_rules("mode.debug", "mode.release")

target("cuda", function()
	set_kind("binary")
	add_files("src/*.cu")

	-- generate SASS code for SM architecture of current host
	add_cugencodes("native")
	add_cuflags("-allow-unsupported-compiler")

	-- generate PTX code for the virtual architecture to guarantee compatibility
	add_cugencodes("compute_86")
end)
