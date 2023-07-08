# Base PHP project example

## composer install
```
docker compose run --rm composer update --prefer-dist
```

## linting
```
docker compose run --entrypoint=vendor/bin/phpcs --rm fpm
```

or you can execute the job inside a running fpm container
```
docker exec -it base-php-project-example-fpm-1 vendor/bin/phpcs
```

Use `phpcbf` command to automatically fix as many sniff violations as possible
