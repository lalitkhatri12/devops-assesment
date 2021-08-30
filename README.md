# Govtech Interview


## Task1

### Part A

* run the govtech-script.sh file as below.
* if email utility is configured in your linux box, please change the To Parameter to actual email address in script and run it.

./govtech-script.sh apache_logs

Cron Job to run this script every hour:
0 */1 * * * /tmp/govtech-script.sh

### Part B

* make sure logs are getting backed up in backup tape.
* delete logs which are older than 3 months OR zip/tar them and than delete.
* create the script to auto delete the log file, run script once which will auto delete logs which are older than 3 months.
* if still face storage issue, zip/tar all the logs older thn 1 month and delete the logs file.

### Installing

* How/where to download your program
* Any modifications needed to be made to files/folders

### Executing program

* How to run the program
* Step-by-step bullets
```
code blocks for commands
```

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors

Contributors names and contact info

ex. Dominique Pizzie  
ex. [@DomPizzie](https://twitter.com/dompizzie)

## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)
