
# An Example Lustrous Varnish Configuration

vcl 4.0;

sub vcl_deliver {
	set resp.http.X-Served-By = "Lustrous";
}

