process.stdin.resume()
process.stdin.setEncoding('utf8')

process.stdin
  .pipe
  .through2(function(data) {
    this.push(data)
  })
  .pipe(process.stdout)