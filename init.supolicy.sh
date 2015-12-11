#!/system/bin/sh

XBIN_SUPOLICY="/system/xbin/supolicy"
SU_BIN_SUPOLICY="/su/bin/supolicy"
SUPOLICY=$XBIN_SUPOLICY

if [ ! -f "$XBIN_SUPOLICY" ]
then
	if [ ! -f "$SU_BIN_SUPOLICY" ]
	then
		return 0
	else
		SUPOLICY=$SU_BIN_SUPOLICY
	fi
fi

$SUPOLICY --live \
	"allow ssr device dir read" \
        "allow init kernel security read_policy" \
        "allow zygote init unix_stream_socket { read write }" \
        "allow shell dalvikcache_data_file file write" \
        "allow shell dalvikcache_data_file dir write" \
        "allow mediaserver mediaserver_tmpfs file { read write execute }"
