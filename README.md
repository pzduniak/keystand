# keystand

A Keybase service that provisions using a paper key.

## Starting the service

```bash
docker run \
    -e KEYBASE_USERNAME="yourusername" \
    -e KEYBASE_PAPERKEY="your paper key ..." \
    -e KEYBASE_DEVICENAME="desired device name" \ # optional
    --name keybase \ # required to use volumes-from later
    pzduniak/keystand:service \
    keybase --debug service # cmd is optional, debug mode is quite useful for debugging
```

## Running commands against the service

```bash
docker run --rm --volumes-from keybase pzduniak/keystand:client keybase chat send yourname hello
docker run --rm --volumes-from keybase pzduniak/keystand:client keybase status
```
