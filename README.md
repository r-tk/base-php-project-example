# Base PHP project example

## composer install
```
docker compose run --rm composer
```

## linting

```
docker compose run --rm phpcs
```

Use `phpcbf` command to automatically fix as many sniff violations as possible
```
docker compose run --entrypoint=vendor/bin/phpcbf --rm phpcs
```
