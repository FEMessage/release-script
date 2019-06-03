# release-script
process FEMessage's release stuff 

## release

```sh
./release.sh
```

cd local repo directory add merge dev into master, then push to remote repo, which will trigger travis ci to:
- publish npm  
- deploy gh-pages

> make sure all repos(defined in repos.sh) haven been cloned.

## get release log

```sh
./get-release-log.sh
```

generate all repos' release log into a md file. 

here may occur github api [rate limiting](https://developer.github.com/v3/#rate-limiting):
- For unauthenticated requests, the rate limit allows for up to **60** requests per hour, associated with the originating **IP** address
- For API requests using Basic Authentication or OAuth, you can make up to **5000** requests per hour, associated with the authenticated **user**

