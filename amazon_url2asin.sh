cat - \
	| perl -pe 's{.*/([0-9A-Z]+)/?.*}{$1}g'