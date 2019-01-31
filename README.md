# docker-clamav-rest
> Docker version of ClamAV REST API

## Installing & getting started

> Run the following steps to get base image available

1) Clone this Repo
2) Create new branch
3) Make any changes you require
4) Push branch to Github
5) Open Pull Request
6) Image should be build in quay.io with `DRONE_BUILD_NUMBER` tag
7) Image will be security scanned
8) When image has been approved Pull Request is merged
9) Image gets tagged with `latest` tag in quay.io

> Container should then be available for use as the base image

> Image can also be tagged manually with version of your choice (replace v1.0.0 with the tag you actually want to use):
```
git tag v1.0.0
git push origin v1.0.0
```

## Local build
To build local copy of quay.io/ukhomeofficedigital/docker-clamav-rest:1.0.0 run:
```
docker-compose build
```

## Run
To start local copy of quay.io/ukhomeofficedigital/docker-clamav-rest:1.0.0 run:
```
docker-compose run -d
```

## Testing
Run:
```sh
$ echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' > virus
$ curl -i -k -F "name=virus" -F "file=@./virus" http://localhost:8080/scan
    HTTP/1.1 200 OK
    Content-Type: text/plain;charset=ISO-8859-1
    Content-Length: 22
    Server: Jetty(8.1.15.v20140411)
    
    Everything ok : false

$ echo test > notvirus
$ curl -i -k -F "name=notvirus" -F "file=@./notvirus" http://localhost:8080/scan
    HTTP/1.1 200 OK
    Content-Type: text/plain;charset=ISO-8859-1
    Content-Length: 21
    Server: Jetty(8.1.15.v20140411)
    
    Everything ok : true
```

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting
pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the 
[tags on this repository](https://github.com/UKHomeOffice/docker-clamav-rest/tags). 

## Authors

* **Pawel Niemiec** - *Initial work* - [GitHub](https://github.com/pawniemiec)

See also the list of [contributors](https://github.com/UKHomeOffice/docker-clamav-rest/contributors) who 
participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
