run:
	hugo server -DF --noHTTPCache

build_index:
	.build/pagefind --site public/