# Dockerized Anki Sync Server

_Version 1.0.0_

This is a Dockerized Anki Sync Server behind an Nginx Reverse Proxy with SSL. It is tested against Anki 24.06.3.

The Sync Server implementation used is the default Rust-based Sync Server, built within a Debian-based Rust Docker container.

The Nginx SSL configuration is from [my other repository here](https://github.com/obadaalagha/4stack4pi/).

I couldn't figure out how to Use the ANKI_HOST variable. The default ANKI_PORT within the container is 8080, this can be mapped to any external host port.

The Dockerfile for the image is included.

## Building the Dockerfile

Ensure you are in the repository. This is the old syntax for building a docker image, which still works as of the uploading of this repository.

```bash
docker build . -t "anki-sync-server-docker"
```

## Running the Server

Hash your password using a tool such as [this](https://git.sr.ht/~laalsaas/pbkdf2-password-hash), which was included in the documentation for setting up a sync server. Place that hashed password alongside other configuration settings in the provided `.env.example` file. Rename that file to `.env`.

## Sync Server

These are the docs for the setup for the Sync Server itself that I used to ensure the proper environment variables were setup. Follow along for any additional information:
- [Docs](https://docs.ankiweb.net/sync-server.html)

## Connecting from Anki Clients

This [link from the docs](https://docs.ankiweb.net/sync-server.html#client-setup) as well as this [forum post](https://forums.ankiweb.net/t/client-setup-section-in-sync-server-doc-needs-to-be-clarified/34863/7) may be helpful.
