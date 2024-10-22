# Dockerized Anki Sync Server

_Version 1.0.5_

This is a Dockerized Anki Sync Server behind an Nginx Reverse Proxy with SSL. It is tested against Anki 24.06.3.

The Sync Server implementation used is the default Rust-based Sync Server, built within a Debian-based Rust Docker container.

The Nginx SSL configuration is from [my other repository here](https://github.com/obadaalagha/4stack4pi/).

The ANKI_HOST and ANKI_PORT variables which can be set are not used. See documentation if their use is needed.

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

### Note on AnkiDroid

As of the writing of this section (July 22nd, 2024), AnkiDroid (version 2.18.4) doesn't support certificates in the user trust store due to a dependency from a Rust crate. This issue was introduced during the 2.16 release. You can see the [bug here](https://github.com/ankidroid/Anki-Android/issues/14686). There is a PR in place that has seemingly been [approved for merging into release 2.19](https://github.com/ankidroid/Anki-Android/pull/16481).

I tested against [AnkiDroid 2.19alpha10](https://github.com/ankidroid/Anki-Android/releases/tag/v2.19alpha10) with the `AnkiDroid-2.19alpha10-full-universal` apk and syncrhonization seems to work. This prerelease feature adds a field that allows you to paste a custom certificate that can be used, which alleviates the issue with the Rust crate.
