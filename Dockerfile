FROM riazarbi/ib-headless:latest

LABEL maintainer="Riaz Arbi <riazarbi@gmail.com>"

ENV R_BASE_VERSION 4.2.2

## Now install R and littler, and create a link for littler in /usr/local/bin
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
                libopenblas0-pthread \
		littler \
                r-cran-docopt \
                r-cran-littler \
		r-base=${R_BASE_VERSION}-* \
		r-base-dev=${R_BASE_VERSION}-* \
                r-base-core=${R_BASE_VERSION}-* \
		r-recommended=${R_BASE_VERSION}-* \
	&& ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/installDeps.r /usr/local/bin/installDeps.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
	&& rm -rf /var/lib/apt/lists/*
  
  
