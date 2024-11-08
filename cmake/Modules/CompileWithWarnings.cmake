macro(target_warning_options the_tgt)
	target_compile_options(${the_tgt} PRIVATE
		$<$<OR:$<C_COMPILER_ID:Clang>,$<C_COMPILER_ID:AppleClang>,$<C_COMPILER_ID:GNU>>:
			-Wall -Wextra -pedantic -Wshadow -Wdouble-promotion -Wformat=2 -Wconversion>
		$<$<C_COMPILER_ID:Clang>: >
		$<$<C_COMPILER_ID:GNU>:
			-Wformat-overflow -Wformat-truncation -Wextra>
		$<$<C_COMPILER_ID:MSVC>: /W4>
		$<$<C_COMPILER_ID:Intel>: -w3 -wd1418,2259>
)
endmacro()

